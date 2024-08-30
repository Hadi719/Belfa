// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'installment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInstallmentCollection on Isar {
  IsarCollection<Installment> get installments => this.collection();
}

const InstallmentSchema = CollectionSchema(
  name: r'Installment',
  id: -4029325804810542109,
  properties: {
    r'amountDue': PropertySchema(
      id: 0,
      name: r'amountDue',
      type: IsarType.double,
    ),
    r'amountPaid': PropertySchema(
      id: 1,
      name: r'amountPaid',
      type: IsarType.double,
    ),
    r'dueDate': PropertySchema(
      id: 2,
      name: r'dueDate',
      type: IsarType.dateTime,
    ),
    r'isPaid': PropertySchema(
      id: 3,
      name: r'isPaid',
      type: IsarType.bool,
    ),
    r'number': PropertySchema(
      id: 4,
      name: r'number',
      type: IsarType.long,
    ),
    r'paidDate': PropertySchema(
      id: 5,
      name: r'paidDate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _installmentEstimateSize,
  serialize: _installmentSerialize,
  deserialize: _installmentDeserialize,
  deserializeProp: _installmentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'loan': LinkSchema(
      id: -7414011619717774253,
      name: r'loan',
      target: r'Loan',
      single: true,
      linkName: r'installment',
    )
  },
  embeddedSchemas: {},
  getId: _installmentGetId,
  getLinks: _installmentGetLinks,
  attach: _installmentAttach,
  version: '3.1.0+1',
);

int _installmentEstimateSize(
  Installment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _installmentSerialize(
  Installment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amountDue);
  writer.writeDouble(offsets[1], object.amountPaid);
  writer.writeDateTime(offsets[2], object.dueDate);
  writer.writeBool(offsets[3], object.isPaid);
  writer.writeLong(offsets[4], object.number);
  writer.writeDateTime(offsets[5], object.paidDate);
}

Installment _installmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Installment();
  object.amountDue = reader.readDoubleOrNull(offsets[0]);
  object.amountPaid = reader.readDoubleOrNull(offsets[1]);
  object.dueDate = reader.readDateTimeOrNull(offsets[2]);
  object.id = id;
  object.isPaid = reader.readBoolOrNull(offsets[3]);
  object.number = reader.readLongOrNull(offsets[4]);
  object.paidDate = reader.readDateTimeOrNull(offsets[5]);
  return object;
}

P _installmentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _installmentGetId(Installment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _installmentGetLinks(Installment object) {
  return [object.loan];
}

void _installmentAttach(
    IsarCollection<dynamic> col, Id id, Installment object) {
  object.id = id;
  object.loan.attach(col, col.isar.collection<Loan>(), r'loan', id);
}

extension InstallmentQueryWhereSort
    on QueryBuilder<Installment, Installment, QWhere> {
  QueryBuilder<Installment, Installment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension InstallmentQueryWhere
    on QueryBuilder<Installment, Installment, QWhereClause> {
  QueryBuilder<Installment, Installment, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Installment, Installment, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Installment, Installment, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Installment, Installment, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InstallmentQueryFilter
    on QueryBuilder<Installment, Installment, QFilterCondition> {
  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      amountDueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amountDue',
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      amountDueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amountDue',
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      amountDueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amountDue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      amountDueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amountDue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      amountDueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amountDue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      amountDueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amountDue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      amountPaidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amountPaid',
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      amountPaidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amountPaid',
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      amountPaidEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amountPaid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      amountPaidGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amountPaid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      amountPaidLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amountPaid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      amountPaidBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amountPaid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      dueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      dueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition> dueDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      dueDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition> dueDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition> dueDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition> isPaidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isPaid',
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      isPaidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isPaid',
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition> isPaidEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPaid',
        value: value,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition> numberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'number',
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      numberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'number',
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition> numberEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      numberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition> numberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition> numberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'number',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      paidDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paidDate',
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      paidDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paidDate',
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition> paidDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paidDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      paidDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paidDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition>
      paidDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paidDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition> paidDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paidDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InstallmentQueryObject
    on QueryBuilder<Installment, Installment, QFilterCondition> {}

extension InstallmentQueryLinks
    on QueryBuilder<Installment, Installment, QFilterCondition> {
  QueryBuilder<Installment, Installment, QAfterFilterCondition> loan(
      FilterQuery<Loan> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'loan');
    });
  }

  QueryBuilder<Installment, Installment, QAfterFilterCondition> loanIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'loan', 0, true, 0, true);
    });
  }
}

extension InstallmentQuerySortBy
    on QueryBuilder<Installment, Installment, QSortBy> {
  QueryBuilder<Installment, Installment, QAfterSortBy> sortByAmountDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountDue', Sort.asc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> sortByAmountDueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountDue', Sort.desc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> sortByAmountPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountPaid', Sort.asc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> sortByAmountPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountPaid', Sort.desc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> sortByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> sortByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> sortByIsPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.asc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> sortByIsPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.desc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> sortByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> sortByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> sortByPaidDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidDate', Sort.asc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> sortByPaidDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidDate', Sort.desc);
    });
  }
}

extension InstallmentQuerySortThenBy
    on QueryBuilder<Installment, Installment, QSortThenBy> {
  QueryBuilder<Installment, Installment, QAfterSortBy> thenByAmountDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountDue', Sort.asc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> thenByAmountDueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountDue', Sort.desc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> thenByAmountPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountPaid', Sort.asc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> thenByAmountPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountPaid', Sort.desc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> thenByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> thenByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> thenByIsPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.asc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> thenByIsPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.desc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> thenByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> thenByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> thenByPaidDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidDate', Sort.asc);
    });
  }

  QueryBuilder<Installment, Installment, QAfterSortBy> thenByPaidDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidDate', Sort.desc);
    });
  }
}

extension InstallmentQueryWhereDistinct
    on QueryBuilder<Installment, Installment, QDistinct> {
  QueryBuilder<Installment, Installment, QDistinct> distinctByAmountDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amountDue');
    });
  }

  QueryBuilder<Installment, Installment, QDistinct> distinctByAmountPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amountPaid');
    });
  }

  QueryBuilder<Installment, Installment, QDistinct> distinctByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDate');
    });
  }

  QueryBuilder<Installment, Installment, QDistinct> distinctByIsPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPaid');
    });
  }

  QueryBuilder<Installment, Installment, QDistinct> distinctByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'number');
    });
  }

  QueryBuilder<Installment, Installment, QDistinct> distinctByPaidDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paidDate');
    });
  }
}

extension InstallmentQueryProperty
    on QueryBuilder<Installment, Installment, QQueryProperty> {
  QueryBuilder<Installment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Installment, double?, QQueryOperations> amountDueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amountDue');
    });
  }

  QueryBuilder<Installment, double?, QQueryOperations> amountPaidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amountPaid');
    });
  }

  QueryBuilder<Installment, DateTime?, QQueryOperations> dueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDate');
    });
  }

  QueryBuilder<Installment, bool?, QQueryOperations> isPaidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPaid');
    });
  }

  QueryBuilder<Installment, int?, QQueryOperations> numberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'number');
    });
  }

  QueryBuilder<Installment, DateTime?, QQueryOperations> paidDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paidDate');
    });
  }
}
