import 'package:isar/isar.dart';

import 'loan.dart';

part 'installment.g.dart';

/// Represents an installment payment for a loan.
@collection
class Installment {
  /// Unique identifier for the installment.
  Id id = Isar.autoIncrement;

  /// Installment number within the loan.
  int? installmentNumber;

  /// Amount due for this installment.
  double? amountDue;

  /// Amount paid for this installment.
  double? amountPaid;

  /// Date when the installment is due.
  DateTime? dueDate;

  /// Date when the installment was paid (optional).
  DateTime? paidDate;

  /// Indicates whether the installment has been paid.
  bool isPaid = false;

  /// The loan to which this installment belongs.
  @Backlink(to: 'installments')
  final IsarLink<Loan> loan = IsarLink<Loan>();
}
