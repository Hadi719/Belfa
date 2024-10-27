import 'package:isar/isar.dart';

import '../../models/isar/base/isar_model.dart';

/// An abstract class that defines the common interface for repositories
/// interacting with Isar collections.
///
/// This class provides a set of methods for performing CRUD operations
/// on entities of type [T] stored in an Isar collection.
abstract class CollectionRepository<T extends IsarModel> {
  late IsarCollection<T> collection;

  /// Creates or update a single [object] into the collection.
  ///
  /// Returns the ID of the inserted object.
  Future<Id> insertObject(T object);

  /// Creates or update multiple [objects] into the collection.
  ///
  /// Returns a list of IDs of the inserted objects.
  Future<List<Id>> insertObjects(List<T> objects);

  /// Deletes an object from the collection by its [id].
  ///
  /// Returns `true` if the object was deleted successfully, `false` otherwise.
  Future<bool> deleteObject(Id id);

  /// Deletes multiple objects from the collection by their [ids].
  ///
  /// Returns the number of objects deleted successfully.
  Future<int> deleteObjects(List<Id> ids);

  /// Finds an object in the collection by its [id].
  ///
  /// Returns the object if found, `null` otherwise.
  Future<T?> findObjectById(Id id);

  /// Retrieves all objects from the collection.
  ///
  /// Returns a list of all objects in the collection.
  Future<List<T>> getAllObjects();
}
