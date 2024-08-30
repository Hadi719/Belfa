// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGroupCollection on Isar {
  IsarCollection<Group> get groups => this.collection();
}

const GroupSchema = CollectionSchema(
  name: r'Group',
  id: -2045556087275737047,
  properties: {
    r'bankAccountNumber': PropertySchema(
      id: 0,
      name: r'bankAccountNumber',
      type: IsarType.long,
    ),
    r'bankCardNumber': PropertySchema(
      id: 1,
      name: r'bankCardNumber',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 3,
      name: r'startDate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _groupEstimateSize,
  serialize: _groupSerialize,
  deserialize: _groupDeserialize,
  deserializeProp: _groupDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'member': LinkSchema(
      id: 2614838594148017922,
      name: r'member',
      target: r'Member',
      single: false,
    ),
    r'loanTurn': LinkSchema(
      id: -4842794575481311250,
      name: r'loanTurn',
      target: r'LoanTurn',
      single: false,
    ),
    r'loan': LinkSchema(
      id: -4615748540892248321,
      name: r'loan',
      target: r'Loan',
      single: false,
      linkName: r'group',
    )
  },
  embeddedSchemas: {},
  getId: _groupGetId,
  getLinks: _groupGetLinks,
  attach: _groupAttach,
  version: '3.1.0+1',
);

int _groupEstimateSize(
  Group object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _groupSerialize(
  Group object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bankAccountNumber);
  writer.writeLong(offsets[1], object.bankCardNumber);
  writer.writeString(offsets[2], object.name);
  writer.writeDateTime(offsets[3], object.startDate);
}

Group _groupDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Group();
  object.bankAccountNumber = reader.readLongOrNull(offsets[0]);
  object.bankCardNumber = reader.readLongOrNull(offsets[1]);
  object.id = id;
  object.name = reader.readString(offsets[2]);
  object.startDate = reader.readDateTime(offsets[3]);
  return object;
}

P _groupDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _groupGetId(Group object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _groupGetLinks(Group object) {
  return [object.member, object.loanTurn, object.loan];
}

void _groupAttach(IsarCollection<dynamic> col, Id id, Group object) {
  object.id = id;
  object.member.attach(col, col.isar.collection<Member>(), r'member', id);
  object.loanTurn.attach(col, col.isar.collection<LoanTurn>(), r'loanTurn', id);
  object.loan.attach(col, col.isar.collection<Loan>(), r'loan', id);
}

extension GroupQueryWhereSort on QueryBuilder<Group, Group, QWhere> {
  QueryBuilder<Group, Group, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GroupQueryWhere on QueryBuilder<Group, Group, QWhereClause> {
  QueryBuilder<Group, Group, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Group, Group, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Group, Group, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Group, Group, QAfterWhereClause> idBetween(
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

extension GroupQueryFilter on QueryBuilder<Group, Group, QFilterCondition> {
  QueryBuilder<Group, Group, QAfterFilterCondition> bankAccountNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bankAccountNumber',
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition>
      bankAccountNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bankAccountNumber',
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> bankAccountNumberEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankAccountNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition>
      bankAccountNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bankAccountNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> bankAccountNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bankAccountNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> bankAccountNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bankAccountNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> bankCardNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bankCardNumber',
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> bankCardNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bankCardNumber',
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> bankCardNumberEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankCardNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> bankCardNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bankCardNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> bankCardNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bankCardNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> bankCardNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bankCardNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Group, Group, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Group, Group, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Group, Group, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> startDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> startDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> startDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> startDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GroupQueryObject on QueryBuilder<Group, Group, QFilterCondition> {}

extension GroupQueryLinks on QueryBuilder<Group, Group, QFilterCondition> {
  QueryBuilder<Group, Group, QAfterFilterCondition> member(
      FilterQuery<Member> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'member');
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> memberLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'member', length, true, length, true);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> memberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'member', 0, true, 0, true);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> memberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'member', 0, false, 999999, true);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> memberLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'member', 0, true, length, include);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> memberLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'member', length, include, 999999, true);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> memberLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'member', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanTurn(
      FilterQuery<LoanTurn> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'loanTurn');
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanTurnLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'loanTurn', length, true, length, true);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanTurnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'loanTurn', 0, true, 0, true);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanTurnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'loanTurn', 0, false, 999999, true);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanTurnLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'loanTurn', 0, true, length, include);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanTurnLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'loanTurn', length, include, 999999, true);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanTurnLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'loanTurn', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loan(FilterQuery<Loan> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'loan');
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'loan', length, true, length, true);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'loan', 0, true, 0, true);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'loan', 0, false, 999999, true);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'loan', 0, true, length, include);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'loan', length, include, 999999, true);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'loan', lower, includeLower, upper, includeUpper);
    });
  }
}

extension GroupQuerySortBy on QueryBuilder<Group, Group, QSortBy> {
  QueryBuilder<Group, Group, QAfterSortBy> sortByBankAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccountNumber', Sort.asc);
    });
  }

  QueryBuilder<Group, Group, QAfterSortBy> sortByBankAccountNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccountNumber', Sort.desc);
    });
  }

  QueryBuilder<Group, Group, QAfterSortBy> sortByBankCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankCardNumber', Sort.asc);
    });
  }

  QueryBuilder<Group, Group, QAfterSortBy> sortByBankCardNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankCardNumber', Sort.desc);
    });
  }

  QueryBuilder<Group, Group, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Group, Group, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Group, Group, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<Group, Group, QAfterSortBy> sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }
}

extension GroupQuerySortThenBy on QueryBuilder<Group, Group, QSortThenBy> {
  QueryBuilder<Group, Group, QAfterSortBy> thenByBankAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccountNumber', Sort.asc);
    });
  }

  QueryBuilder<Group, Group, QAfterSortBy> thenByBankAccountNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccountNumber', Sort.desc);
    });
  }

  QueryBuilder<Group, Group, QAfterSortBy> thenByBankCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankCardNumber', Sort.asc);
    });
  }

  QueryBuilder<Group, Group, QAfterSortBy> thenByBankCardNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankCardNumber', Sort.desc);
    });
  }

  QueryBuilder<Group, Group, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Group, Group, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Group, Group, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Group, Group, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Group, Group, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<Group, Group, QAfterSortBy> thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }
}

extension GroupQueryWhereDistinct on QueryBuilder<Group, Group, QDistinct> {
  QueryBuilder<Group, Group, QDistinct> distinctByBankAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bankAccountNumber');
    });
  }

  QueryBuilder<Group, Group, QDistinct> distinctByBankCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bankCardNumber');
    });
  }

  QueryBuilder<Group, Group, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Group, Group, QDistinct> distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }
}

extension GroupQueryProperty on QueryBuilder<Group, Group, QQueryProperty> {
  QueryBuilder<Group, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Group, int?, QQueryOperations> bankAccountNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankAccountNumber');
    });
  }

  QueryBuilder<Group, int?, QQueryOperations> bankCardNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankCardNumber');
    });
  }

  QueryBuilder<Group, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Group, DateTime, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLoanTurnCollection on Isar {
  IsarCollection<LoanTurn> get loanTurns => this.collection();
}

const LoanTurnSchema = CollectionSchema(
  name: r'LoanTurn',
  id: 5464536919949472241,
  properties: {
    r'memberId': PropertySchema(
      id: 0,
      name: r'memberId',
      type: IsarType.long,
    ),
    r'turn': PropertySchema(
      id: 1,
      name: r'turn',
      type: IsarType.long,
    )
  },
  estimateSize: _loanTurnEstimateSize,
  serialize: _loanTurnSerialize,
  deserialize: _loanTurnDeserialize,
  deserializeProp: _loanTurnDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _loanTurnGetId,
  getLinks: _loanTurnGetLinks,
  attach: _loanTurnAttach,
  version: '3.1.0+1',
);

int _loanTurnEstimateSize(
  LoanTurn object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _loanTurnSerialize(
  LoanTurn object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.memberId);
  writer.writeLong(offsets[1], object.turn);
}

LoanTurn _loanTurnDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LoanTurn();
  object.id = id;
  object.memberId = reader.readLong(offsets[0]);
  object.turn = reader.readLongOrNull(offsets[1]);
  return object;
}

P _loanTurnDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _loanTurnGetId(LoanTurn object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _loanTurnGetLinks(LoanTurn object) {
  return [];
}

void _loanTurnAttach(IsarCollection<dynamic> col, Id id, LoanTurn object) {
  object.id = id;
}

extension LoanTurnQueryWhereSort on QueryBuilder<LoanTurn, LoanTurn, QWhere> {
  QueryBuilder<LoanTurn, LoanTurn, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LoanTurnQueryWhere on QueryBuilder<LoanTurn, LoanTurn, QWhereClause> {
  QueryBuilder<LoanTurn, LoanTurn, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<LoanTurn, LoanTurn, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterWhereClause> idBetween(
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

extension LoanTurnQueryFilter
    on QueryBuilder<LoanTurn, LoanTurn, QFilterCondition> {
  QueryBuilder<LoanTurn, LoanTurn, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<LoanTurn, LoanTurn, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LoanTurn, LoanTurn, QAfterFilterCondition> idBetween(
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

  QueryBuilder<LoanTurn, LoanTurn, QAfterFilterCondition> memberIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memberId',
        value: value,
      ));
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterFilterCondition> memberIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'memberId',
        value: value,
      ));
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterFilterCondition> memberIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'memberId',
        value: value,
      ));
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterFilterCondition> memberIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'memberId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterFilterCondition> turnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'turn',
      ));
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterFilterCondition> turnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'turn',
      ));
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterFilterCondition> turnEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'turn',
        value: value,
      ));
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterFilterCondition> turnGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'turn',
        value: value,
      ));
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterFilterCondition> turnLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'turn',
        value: value,
      ));
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterFilterCondition> turnBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'turn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LoanTurnQueryObject
    on QueryBuilder<LoanTurn, LoanTurn, QFilterCondition> {}

extension LoanTurnQueryLinks
    on QueryBuilder<LoanTurn, LoanTurn, QFilterCondition> {}

extension LoanTurnQuerySortBy on QueryBuilder<LoanTurn, LoanTurn, QSortBy> {
  QueryBuilder<LoanTurn, LoanTurn, QAfterSortBy> sortByMemberId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memberId', Sort.asc);
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterSortBy> sortByMemberIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memberId', Sort.desc);
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterSortBy> sortByTurn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'turn', Sort.asc);
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterSortBy> sortByTurnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'turn', Sort.desc);
    });
  }
}

extension LoanTurnQuerySortThenBy
    on QueryBuilder<LoanTurn, LoanTurn, QSortThenBy> {
  QueryBuilder<LoanTurn, LoanTurn, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterSortBy> thenByMemberId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memberId', Sort.asc);
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterSortBy> thenByMemberIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memberId', Sort.desc);
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterSortBy> thenByTurn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'turn', Sort.asc);
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QAfterSortBy> thenByTurnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'turn', Sort.desc);
    });
  }
}

extension LoanTurnQueryWhereDistinct
    on QueryBuilder<LoanTurn, LoanTurn, QDistinct> {
  QueryBuilder<LoanTurn, LoanTurn, QDistinct> distinctByMemberId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'memberId');
    });
  }

  QueryBuilder<LoanTurn, LoanTurn, QDistinct> distinctByTurn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'turn');
    });
  }
}

extension LoanTurnQueryProperty
    on QueryBuilder<LoanTurn, LoanTurn, QQueryProperty> {
  QueryBuilder<LoanTurn, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LoanTurn, int, QQueryOperations> memberIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'memberId');
    });
  }

  QueryBuilder<LoanTurn, int?, QQueryOperations> turnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'turn');
    });
  }
}
