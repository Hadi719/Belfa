import 'package:isar/isar.dart';

import 'loan.dart';
import 'member.dart';

part 'group.g.dart';

/// Represents a group of members in the application.
@collection
class Group {
  /// Unique identifier for the group.
  Id id = Isar.autoIncrement;

  /// Name of the group.
  late String name;

  /// Date when the group was started.
  DateTime startDate = DateTime.now();

  /// Bank card number associated with the group (optional).
  int? bankCardNumber;

  /// Bank account number associated with the group (optional).
  int? bankAccountNumber;

  /// Members belonging to this group.
  final IsarLinks<Member> members = IsarLinks<Member>();

  // Embed LoanTurn within Group
  List<LoanTurn> loanTurns = const <LoanTurn>[];

  /// Loans associated with this group.
  @Backlink(to: 'group')
  final IsarLinks<Loan> loans = IsarLinks<Loan>();
}

/// Represents a loan turn assigned to a member within a group.
@embedded
class LoanTurn {
  /// ID of the member associated with this loan turn.
  late int memberId;

  /// The turn number assigned to the member for loan allocation.
  int? turn;
}
