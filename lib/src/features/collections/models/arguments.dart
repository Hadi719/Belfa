class CollectionsArguments {
  const CollectionsArguments({
    this.isOnlySelectionMode = false,
    this.preSelectedId = const <int>[],
  });

  final bool isOnlySelectionMode;
  final List<int> preSelectedId;

  CollectionsArguments copyWith({
    bool? isOnlySelectionMode,
    List<int>? preSelectedId,
  }) {
    return CollectionsArguments(
      isOnlySelectionMode: isOnlySelectionMode ?? this.isOnlySelectionMode,
      preSelectedId: preSelectedId ?? this.preSelectedId,
    );
  }
}
