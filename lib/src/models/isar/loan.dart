import 'package:isar/isar.dart';

import 'base/isar_model.dart';
import 'group.dart';
import 'installment.dart';
import 'member.dart';

part 'loan.g.dart';

/// Represents a loan taken by a member within a group.
@collection
class Loan extends IsarModel {
  /// The principal amount of the loan.
  double? principalAmount;

  /// The annual interest rate of the loan.
  double? interestRate;

  /// The date when the loan was taken.
  DateTime? loanDate;

  /// The date when the loan is expected to be fully repaid.
  DateTime? endDate;

  /// The duration of the loan in terms of the chosen frequency (e.g., months).
  int? loanDuration;

  /// The frequency of loan repayments (e.g., monthly, weekly).
  @enumerated
  LoanRepaymentFrequency loanRepaymentFrequency =
      LoanRepaymentFrequency.monthly;

  /// The current status of the loan (e.g., active, completed).
  @enumerated
  LoanStatus loanStatus = LoanStatus.active;

  /// The member who took the loan.
  final IsarLink<Member> member = IsarLink<Member>();

  /// The group to which the loan is associated.
  final IsarLink<Group> group = IsarLink<Group>();

  /// The installments associated with this loan.
  final IsarLinks<Installment> installments = IsarLinks<Installment>();
}

/// Represents the frequency of loan repayments.
enum LoanRepaymentFrequency {
  weekly('Weekly', 'هفتگی'),
  biweekly('Biweekly', 'دو هفته'),
  monthly('Monthly', 'ماهانه'),
  quarterly('Quarterly', 'سه ماهه'),
  semiAnnually('Semi-Annually', 'شش ماهه'),
  annually('Annually', 'سالانه');

  /// Creates a new [LoanRepaymentFrequency] with the given English and Farsi representations.
  const LoanRepaymentFrequency(this.english, this.farsi);

  /// The English representation of the loan repayment frequency.
  final String english;

  /// The Farsi representation of the loan repayment frequency.
  final String farsi;
}

/// Represents the current status of a loan.
enum LoanStatus {
  active('Active', 'فعال'),
  upcoming('Upcoming', 'در حال انجام'),
  completed('Completed', 'انجام شده');

  /// Creates a new [LoanStatus] with the given English and Farsi representations.
  const LoanStatus(this.english, this.farsi);

  /// The English representation of the loan status.
  final String english;

  /// The Farsi representation of the loan status.
  final String farsi;
}
