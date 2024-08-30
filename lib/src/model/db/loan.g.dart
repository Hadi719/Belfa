// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLoanCollection on Isar {
  IsarCollection<Loan> get loans => this.collection();
}

const LoanSchema = CollectionSchema(
  name: r'Loan',
  id: 3165146227223573679,
  properties: {
    r'endDate': PropertySchema(
      id: 0,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'interestRate': PropertySchema(
      id: 1,
      name: r'interestRate',
      type: IsarType.double,
    ),
    r'loanDate': PropertySchema(
      id: 2,
      name: r'loanDate',
      type: IsarType.dateTime,
    ),
    r'loanDuration': PropertySchema(
      id: 3,
      name: r'loanDuration',
      type: IsarType.long,
    ),
    r'loanFrequency': PropertySchema(
      id: 4,
      name: r'loanFrequency',
      type: IsarType.byte,
      enumMap: _LoanloanFrequencyEnumValueMap,
    ),
    r'loanStatus': PropertySchema(
      id: 5,
      name: r'loanStatus',
      type: IsarType.byte,
      enumMap: _LoanloanStatusEnumValueMap,
    ),
    r'principalAmount': PropertySchema(
      id: 6,
      name: r'principalAmount',
      type: IsarType.double,
    )
  },
  estimateSize: _loanEstimateSize,
  serialize: _loanSerialize,
  deserialize: _loanDeserialize,
  deserializeProp: _loanDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'member': LinkSchema(
      id: 8894608915695164194,
      name: r'member',
      target: r'Member',
      single: true,
    ),
    r'group': LinkSchema(
      id: 3567418650061232024,
      name: r'group',
      target: r'Group',
      single: true,
    ),
    r'installment': LinkSchema(
      id: 350143696727571678,
      name: r'installment',
      target: r'Installment',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _loanGetId,
  getLinks: _loanGetLinks,
  attach: _loanAttach,
  version: '3.1.0+1',
);

int _loanEstimateSize(
  Loan object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _loanSerialize(
  Loan object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.endDate);
  writer.writeDouble(offsets[1], object.interestRate);
  writer.writeDateTime(offsets[2], object.loanDate);
  writer.writeLong(offsets[3], object.loanDuration);
  writer.writeByte(offsets[4], object.loanFrequency.index);
  writer.writeByte(offsets[5], object.loanStatus.index);
  writer.writeDouble(offsets[6], object.principalAmount);
}

Loan _loanDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Loan();
  object.endDate = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  object.interestRate = reader.readDoubleOrNull(offsets[1]);
  object.loanDate = reader.readDateTimeOrNull(offsets[2]);
  object.loanDuration = reader.readLongOrNull(offsets[3]);
  object.loanFrequency =
      _LoanloanFrequencyValueEnumMap[reader.readByteOrNull(offsets[4])] ??
          LoanFrequency.weekly;
  object.loanStatus =
      _LoanloanStatusValueEnumMap[reader.readByteOrNull(offsets[5])] ??
          LoanStatus.active;
  object.principalAmount = reader.readDoubleOrNull(offsets[6]);
  return object;
}

P _loanDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (_LoanloanFrequencyValueEnumMap[reader.readByteOrNull(offset)] ??
          LoanFrequency.weekly) as P;
    case 5:
      return (_LoanloanStatusValueEnumMap[reader.readByteOrNull(offset)] ??
          LoanStatus.active) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LoanloanFrequencyEnumValueMap = {
  'weekly': 0,
  'biweekly': 1,
  'monthly': 2,
  'quarterly': 3,
  'semiAnnually': 4,
  'annually': 5,
};
const _LoanloanFrequencyValueEnumMap = {
  0: LoanFrequency.weekly,
  1: LoanFrequency.biweekly,
  2: LoanFrequency.monthly,
  3: LoanFrequency.quarterly,
  4: LoanFrequency.semiAnnually,
  5: LoanFrequency.annually,
};
const _LoanloanStatusEnumValueMap = {
  'active': 0,
  'upcoming': 1,
  'completed': 2,
};
const _LoanloanStatusValueEnumMap = {
  0: LoanStatus.active,
  1: LoanStatus.upcoming,
  2: LoanStatus.completed,
};

Id _loanGetId(Loan object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _loanGetLinks(Loan object) {
  return [object.member, object.group, object.installment];
}

void _loanAttach(IsarCollection<dynamic> col, Id id, Loan object) {
  object.id = id;
  object.member.attach(col, col.isar.collection<Member>(), r'member', id);
  object.group.attach(col, col.isar.collection<Group>(), r'group', id);
  object.installment
      .attach(col, col.isar.collection<Installment>(), r'installment', id);
}

extension LoanQueryWhereSort on QueryBuilder<Loan, Loan, QWhere> {
  QueryBuilder<Loan, Loan, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LoanQueryWhere on QueryBuilder<Loan, Loan, QWhereClause> {
  QueryBuilder<Loan, Loan, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Loan, Loan, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Loan, Loan, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Loan, Loan, QAfterWhereClause> idBetween(
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

extension LoanQueryFilter on QueryBuilder<Loan, Loan, QFilterCondition> {
  QueryBuilder<Loan, Loan, QAfterFilterCondition> endDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> endDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> endDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> endDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> endDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> endDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Loan, Loan, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Loan, Loan, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Loan, Loan, QAfterFilterCondition> interestRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'interestRate',
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> interestRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'interestRate',
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> interestRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interestRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> interestRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'interestRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> interestRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'interestRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> interestRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'interestRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'loanDate',
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'loanDate',
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loanDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'loanDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'loanDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'loanDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanDurationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'loanDuration',
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanDurationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'loanDuration',
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanDurationEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loanDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanDurationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'loanDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanDurationLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'loanDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanDurationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'loanDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanFrequencyEqualTo(
      LoanFrequency value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loanFrequency',
        value: value,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanFrequencyGreaterThan(
    LoanFrequency value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'loanFrequency',
        value: value,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanFrequencyLessThan(
    LoanFrequency value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'loanFrequency',
        value: value,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanFrequencyBetween(
    LoanFrequency lower,
    LoanFrequency upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'loanFrequency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanStatusEqualTo(
      LoanStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loanStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanStatusGreaterThan(
    LoanStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'loanStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanStatusLessThan(
    LoanStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'loanStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> loanStatusBetween(
    LoanStatus lower,
    LoanStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'loanStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> principalAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'principalAmount',
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> principalAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'principalAmount',
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> principalAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'principalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> principalAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'principalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> principalAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'principalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> principalAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'principalAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension LoanQueryObject on QueryBuilder<Loan, Loan, QFilterCondition> {}

extension LoanQueryLinks on QueryBuilder<Loan, Loan, QFilterCondition> {
  QueryBuilder<Loan, Loan, QAfterFilterCondition> member(
      FilterQuery<Member> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'member');
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> memberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'member', 0, true, 0, true);
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> group(FilterQuery<Group> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'group');
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> groupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'group', 0, true, 0, true);
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> installment(
      FilterQuery<Installment> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'installment');
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> installmentLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'installment', length, true, length, true);
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> installmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'installment', 0, true, 0, true);
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> installmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'installment', 0, false, 999999, true);
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> installmentLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'installment', 0, true, length, include);
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> installmentLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'installment', length, include, 999999, true);
    });
  }

  QueryBuilder<Loan, Loan, QAfterFilterCondition> installmentLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'installment', lower, includeLower, upper, includeUpper);
    });
  }
}

extension LoanQuerySortBy on QueryBuilder<Loan, Loan, QSortBy> {
  QueryBuilder<Loan, Loan, QAfterSortBy> sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> sortByInterestRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestRate', Sort.asc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> sortByInterestRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestRate', Sort.desc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> sortByLoanDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanDate', Sort.asc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> sortByLoanDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanDate', Sort.desc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> sortByLoanDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanDuration', Sort.asc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> sortByLoanDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanDuration', Sort.desc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> sortByLoanFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanFrequency', Sort.asc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> sortByLoanFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanFrequency', Sort.desc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> sortByLoanStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanStatus', Sort.asc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> sortByLoanStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanStatus', Sort.desc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> sortByPrincipalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principalAmount', Sort.asc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> sortByPrincipalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principalAmount', Sort.desc);
    });
  }
}

extension LoanQuerySortThenBy on QueryBuilder<Loan, Loan, QSortThenBy> {
  QueryBuilder<Loan, Loan, QAfterSortBy> thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> thenByInterestRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestRate', Sort.asc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> thenByInterestRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestRate', Sort.desc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> thenByLoanDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanDate', Sort.asc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> thenByLoanDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanDate', Sort.desc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> thenByLoanDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanDuration', Sort.asc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> thenByLoanDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanDuration', Sort.desc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> thenByLoanFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanFrequency', Sort.asc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> thenByLoanFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanFrequency', Sort.desc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> thenByLoanStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanStatus', Sort.asc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> thenByLoanStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanStatus', Sort.desc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> thenByPrincipalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principalAmount', Sort.asc);
    });
  }

  QueryBuilder<Loan, Loan, QAfterSortBy> thenByPrincipalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principalAmount', Sort.desc);
    });
  }
}

extension LoanQueryWhereDistinct on QueryBuilder<Loan, Loan, QDistinct> {
  QueryBuilder<Loan, Loan, QDistinct> distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<Loan, Loan, QDistinct> distinctByInterestRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'interestRate');
    });
  }

  QueryBuilder<Loan, Loan, QDistinct> distinctByLoanDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'loanDate');
    });
  }

  QueryBuilder<Loan, Loan, QDistinct> distinctByLoanDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'loanDuration');
    });
  }

  QueryBuilder<Loan, Loan, QDistinct> distinctByLoanFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'loanFrequency');
    });
  }

  QueryBuilder<Loan, Loan, QDistinct> distinctByLoanStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'loanStatus');
    });
  }

  QueryBuilder<Loan, Loan, QDistinct> distinctByPrincipalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'principalAmount');
    });
  }
}

extension LoanQueryProperty on QueryBuilder<Loan, Loan, QQueryProperty> {
  QueryBuilder<Loan, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Loan, DateTime?, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<Loan, double?, QQueryOperations> interestRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'interestRate');
    });
  }

  QueryBuilder<Loan, DateTime?, QQueryOperations> loanDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loanDate');
    });
  }

  QueryBuilder<Loan, int?, QQueryOperations> loanDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loanDuration');
    });
  }

  QueryBuilder<Loan, LoanFrequency, QQueryOperations> loanFrequencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loanFrequency');
    });
  }

  QueryBuilder<Loan, LoanStatus, QQueryOperations> loanStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loanStatus');
    });
  }

  QueryBuilder<Loan, double?, QQueryOperations> principalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'principalAmount');
    });
  }
}
