import 'package:isar/isar.dart';

import 'group.dart';
import 'loan.dart';

part 'member.g.dart';

/// Represents a member in the application.
@collection
class Member {
  /// Unique identifier for the member.
  Id id = Isar.autoIncrement;

  /// First name of the member.
  String? name;

  /// Last name of the member.
  String? lastName;

  /// Phone number of the member.
  int? phoneNumber;

  /// Loans taken by this member.
  @Backlink(to: 'member')
  final loans = IsarLinks<Loan>();

  /// Groups to which this member belongs.
  @Backlink(to: 'member')
  final groups = IsarLinks<Group>();
}
