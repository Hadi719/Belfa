import '../../models/isar/member.dart';

extension MemberFullName on Member {
  String get fullName => '$name $lastName';
}
