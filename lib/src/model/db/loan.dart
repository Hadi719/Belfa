import 'package:isar/isar.dart';

import 'group.dart';
import 'installment.dart';
import 'member.dart';

part 'loan.g.dart';

@Collection()
class Loan {
  Id id = Isar.autoIncrement;
  double? principalAmount;
  double? interestRate;
  DateTime? loanDate;
  DateTime? endDate;
  int? loanDuration;

  @enumerated
  LoanFrequency loanFrequency = LoanFrequency.monthly;

  @enumerated
  LoanStatus loanStatus = LoanStatus.active;

  final member = IsarLink<Member>();
  final group = IsarLink<Group>();
  final installment = IsarLinks<Installment>();
}

enum LoanFrequency {
  weekly('هفتگی'),
  biweekly('دو هفته'),
  monthly('ماهانه'),
  quarterly('سه ماهه'),
  semiAnnually('شش ماهه'),
  annually('سالانه');

  const LoanFrequency(this.farsi);

  final String farsi;
}

enum LoanStatus {
  active('فعال'),
  upcoming('در حال انجام'),
  completed('انجام شده');

  const LoanStatus(this.farsi);

  final String farsi;
}
