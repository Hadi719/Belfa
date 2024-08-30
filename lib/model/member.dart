import 'package:isar/isar.dart';

import 'group.dart';
import 'loan.dart';

part 'member.g.dart';

@Collection()
class Member {
  Id id = Isar.autoIncrement;
  String? name;
  String? lastName;
  String? phoneNumber;

  @Backlink(to: 'member')
  final loan = IsarLinks<Loan>();
  @Backlink(to: 'member')
  final group = IsarLinks<Group>();
}
