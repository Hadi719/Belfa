import 'package:isar/isar.dart';

import 'loan.dart';
import 'member.dart';

part 'group.g.dart';

@Collection()
class Group {
  Id id = Isar.autoIncrement;

  late String name;

  DateTime startDate = DateTime.now();

  int? bankCardNumber;
  int? bankAccountNumber;

  final member = IsarLinks<Member>();

  final loanTurn = IsarLinks<LoanTurn>();

  @Backlink(to: 'group')
  final loan = IsarLinks<Loan>();
}

@Collection()
class LoanTurn {
  Id id = Isar.autoIncrement;
  late int memberId;
  int? turn;
}
