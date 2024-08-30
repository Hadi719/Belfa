import 'package:isar/isar.dart';

import 'loan.dart';

part 'installment.g.dart';

@Collection()
class Installment {
  Id id = Isar.autoIncrement;
  int? number;
  double? amountDue;
  double? amountPaid;
  DateTime? dueDate;
  DateTime? paidDate;
  bool? isPaid;

  @Backlink(to: 'installment')
  final loan = IsarLink<Loan>();
}
