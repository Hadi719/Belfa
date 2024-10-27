import '../../../models/isar/base/isar_model.dart';

class CollectionsResult<T extends IsarModel> {
  const CollectionsResult({this.objects = const []});
  final List<T> objects;
}
