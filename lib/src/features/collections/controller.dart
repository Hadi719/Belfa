import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/route/app_pages.dart';
import '../../models/isar/index.dart';
import '../../repositories/index.dart';
import '../../utils/localization/translation/translation_keys.dart';
import '../../utils/usecase/extentions.dart';
import 'models/arguments.dart';

/// Provides functionality for managing selection state in a list view.
mixin _SelectionHandler<T extends IsarModel> {
  /// Indicates whether selection mode is active.
  final RxBool isSelectionMode = false.obs;

  /// Indicates whether the view is exclusively for selection.
  final RxBool isOnlySelectionMode = false.obs;

  /// Indicates whether all displayed items are currently selected.
  final RxBool isAllSelected = false.obs;

  /// The currently selected items.
  final RxList<T> selectedItems = <T>[].obs;

  /// Checks if all displayed items are selected.
  void updateIsAllSelected(List<T> selectedItems);

  /// Toggles the selection state of the given item.
  void toggleItemSelection(T item) {
    selectedItems.contains(item)
        ? selectedItems.remove(item)
        : selectedItems.add(item);
  }

  /// Activates selection mode and selects the given item.
  void handleLongPress(T item) {
    toggleItemSelection(item);
    isSelectionMode.value = true;
  }

  /// Selects all displayed items, ensuring uniqueness.
  void selectAll();

  /// Deselects all items.
  void deselectAll() {
    selectedItems.clear();
  }

  /// Clears the selection and disables selection mode.
  void disableSelection() {
    deselectAll();
    isSelectionMode.value = false;
  }

  /// Handles any initial selection state.
  void handleInitialSelection();
}

/// A generic controller for managing views that display collections of data.
///
/// This controller provides functionality for:
/// - Loading data from a repository.
/// - Filtering the displayed data based on a search query.
/// - Managing selection state for multiple items in the collection.
///
/// To use this controller, extend it and provide concrete implementations for:
/// - [C], the type of repository used to access the collection data.
/// - [T], the type of objects in the collection.
/// - [_filterObjects], which implements the logic for filtering the collection
///   based on the current search query.
///
/// This controller uses [Getx] for state management and reactive updates.
sealed class CollectionsController<T extends IsarModel> extends GetxController
    with _SelectionHandler<T> {
  CollectionsController(this._repository);

  /// Repository for accessing collection data.
  final CollectionRepository _repository;

  /// Stream to listen for changes in the [T] collection.
  late Stream<void> _collectionStream;

  /// All objects fetched from the repository.
  final RxList<T> _allItems = <T>[].obs;

  /// Objects displayed in the UI, filtered based on search.
  final RxList<T> displayedItems = <T>[].obs;

  /// The current search query.
  final RxString searchQuery = ''.obs;

  /// Controller for the search text field.
  final TextEditingController searchController = TextEditingController();

  late Worker _selectionWorker;
  late Worker _searchWorker;

  // TODO: implement
  String get viewableRoute;
  String get editableRoute;
  String get appBarTitle;

  /// Abstract method to get the title for an item.
  String getItemTitle(T item);

  /// Abstract method to get the subtitle for an item.
  String getItemSubtitle(T item);

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  @override
  void onClose() {
    searchController.dispose();
    _selectionWorker.dispose();
    _searchWorker.dispose();
    super.onClose();
  }

  /// Initializes the controller by loading data, setting up listeners,
  /// and handling any initial selection state.
  Future<void> _initialize() async {
    await loadObjects();
    _listenForCollectionChanges();
    _setupSearchListener();
    handleInitialSelection();
    _selectionWorker = ever(selectedItems, updateIsAllSelected);
  }

  /// Loads all objects from the repository and updates [_allItems] and
  /// [displayedItems].
  Future<void> loadObjects() async {
    _allItems.value = await _repository.getAllObjects() as List<T>;
    _filterObjects();
  }

  /// Filters the [displayedItems] based on the current [searchQuery].
  ///
  /// This method must be implemented by subclasses to define the filtering logic.
  void _filterObjects() {
    if (searchQuery.isEmpty) {
      displayedItems.value = _allItems;
      return;
    }

    // Implement filtering logic based on searchQuery here
  }

  Future<void> deleteObject(int id) async {
    await _repository.deleteObject(id);
    await loadObjects();
  }

  /// Deletes the selected objects from the repository.
  Future<void> deleteSelectedObjects() async {
    await _repository.deleteObjects(selectedItems.map((f) => f.id).toList());
    deselectAll();
  }

  /// Sets up a listener for changes in the [searchQuery] to trigger filtering.
  void _setupSearchListener() {
    _searchWorker = debounce(
      searchQuery,
      (_) => _filterObjects(),
      time: const Duration(milliseconds: 300),
    );
  }

  /// Listens for changes in the collection data and refreshes the UI.
  void _listenForCollectionChanges() {
    _collectionStream = _repository.collection.watchLazy();
    _collectionStream.listen((_) => loadObjects());
  }

  @override
  void updateIsAllSelected(List<T> selectedItems) {
    isAllSelected.value = displayedItems.length == selectedItems.length &&
        displayedItems.isNotEmpty;
  }

  @override
  void selectAll() {
    final uniqueItems = {...selectedItems, ...displayedItems};
    selectedItems.assignAll(uniqueItems);
  }

  @override
  void handleInitialSelection() {
    if (Get.arguments == null || Get.arguments is! CollectionsArguments) {
      return;
    }

    final arguments = Get.arguments as CollectionsArguments;
    isOnlySelectionMode.value = arguments.isOnlySelectionMode;
    isSelectionMode.value = arguments.isOnlySelectionMode;

    final preselectedIds = arguments.preSelectedId;
    if (preselectedIds.isNotEmpty) {
      selectedItems.assignAll(_allItems
          .where((IsarModel element) => preselectedIds.contains(element.id))
          .toList());
    }
  }
}

class GroupsCollectionController extends CollectionsController<Group> {
  GroupsCollectionController() : super(Get.find<GroupRepository>());

  @override
  String get appBarTitle => TranslationKey.groups.name.tr;

  @override
  String get editableRoute => AppRoutes.form;

  @override
  // TODO: implement
  String get viewableRoute => throw UnimplementedError();

  @override
  String getItemTitle(Group item) {
    return item.name;
  }

  @override
  String getItemSubtitle(Group item) {
    return item.members.length.toString();
  }

  @override
  void _filterObjects() {
    super._filterObjects();

    final query = searchQuery.value.toLowerCase();

    displayedItems.value = _allItems.where((group) {
      final name = group.name.toLowerCase();
      return name.contains(query);
    }).toList();
  }
}

class MembersCollectionController extends CollectionsController<Member> {
  MembersCollectionController() : super(Get.find<MemberRepository>());

  @override
  String getItemTitle(Member item) {
    return item.fullName;
  }

  @override
  String getItemSubtitle(Member item) {
    return item.phoneNumber ?? '';
  }

  @override
  String get appBarTitle => TranslationKey.members.name.tr;

  @override
  String get editableRoute => AppRoutes.memberForm;

  @override
  // TODO: implement
  String get viewableRoute => throw UnimplementedError();

  @override
  void _filterObjects() {
    super._filterObjects();

    final query = searchQuery.value.toLowerCase();

    displayedItems.value = _allItems.where((member) {
      final name = member.name?.toLowerCase() ?? '';
      final lastName = member.lastName?.toLowerCase() ?? '';
      final phoneNumber = member.phoneNumber ?? '';
      return name.contains(query) ||
          lastName.contains(query) ||
          phoneNumber.contains(query);
    }).toList();
  }
}

class LoansCollectionController extends CollectionsController<Loan> {
  LoansCollectionController() : super(Get.find<LoanRepository>());

  @override
  // TODO: implement
  String get appBarTitle => throw UnimplementedError();

  @override
  // TODO: implement
  String get editableRoute => throw UnimplementedError();

  @override
  // TODO: implement
  String get viewableRoute => throw UnimplementedError();

  @override
  String getItemTitle(Loan item) {
    return item.loanDate?.toLocal().toString() ?? '';
  }

  @override
  String getItemSubtitle(Loan item) {
    return item.group.value?.name ?? '';
  }

  @override
  void _filterObjects() {
    super._filterObjects();

    final query = searchQuery.value.toLowerCase();

    displayedItems.value = _allItems.where((loan) {
      final memberName = loan.member.value?.name?.toLowerCase() ?? '';
      final memberLastName = loan.member.value?.lastName?.toLowerCase() ?? '';
      final memberPhoneNumber = loan.member.value?.phoneNumber ?? '';
      final groupName = loan.group.value?.name.toLowerCase() ?? '';
      return memberName.contains(query) ||
          memberLastName.contains(query) ||
          memberPhoneNumber.contains(query) ||
          groupName.contains(query);
    }).toList();
  }
}

class InstallmentsCollectionController
    extends CollectionsController<Installment> {
  InstallmentsCollectionController() : super(Get.find<InstallmentRepository>());

  @override
  // TODO: implement
  String get appBarTitle => throw UnimplementedError();

  @override
  // TODO: implement
  String get editableRoute => throw UnimplementedError();

  @override
  // TODO: implement
  String get viewableRoute => throw UnimplementedError();

  @override
  String getItemTitle(Installment item) {
    return item.dueDate
            ?.toLocal()
            .difference(DateTime.now())
            .inDays
            .toString() ??
        '';
  }

  @override
  String getItemSubtitle(Installment item) {
    return item.amountDue?.toString() ?? '0';
  }

  @override
  void _filterObjects() {
    super._filterObjects();

    final query = searchQuery.value.toLowerCase();

    displayedItems.value = _allItems.where((installment) {
      final memberName =
          installment.loan.value?.member.value?.name?.toLowerCase() ?? '';
      final memberLastName =
          installment.loan.value?.member.value?.lastName?.toLowerCase() ?? '';
      final memberPhoneNumber =
          installment.loan.value?.member.value?.phoneNumber ?? '';
      final groupName =
          installment.loan.value?.group.value?.name.toLowerCase() ?? '';
      return memberName.contains(query) ||
          memberLastName.contains(query) ||
          memberPhoneNumber.contains(query) ||
          groupName.contains(query);
    }).toList();
  }
}
