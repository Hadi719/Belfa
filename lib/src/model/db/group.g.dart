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
    r'loanTurns': PropertySchema(
      id: 2,
      name: r'loanTurns',
      type: IsarType.objectList,
      target: r'LoanTurn',
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 4,
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
    r'loans': LinkSchema(
      id: -4615748540892248321,
      name: r'loans',
      target: r'Loan',
      single: false,
      linkName: r'group',
    )
  },
  embeddedSchemas: {r'LoanTurn': LoanTurnSchema},
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
  bytesCount += 3 + object.loanTurns.length * 3;
  {
    final offsets = allOffsets[LoanTurn]!;
    for (var i = 0; i < object.loanTurns.length; i++) {
      final value = object.loanTurns[i];
      bytesCount += LoanTurnSchema.estimateSize(value, offsets, allOffsets);
    }
  }
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
  writer.writeObjectList<LoanTurn>(
    offsets[2],
    allOffsets,
    LoanTurnSchema.serialize,
    object.loanTurns,
  );
  writer.writeString(offsets[3], object.name);
  writer.writeDateTime(offsets[4], object.startDate);
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
  object.name = reader.readString(offsets[3]);
  object.startDate = reader.readDateTime(offsets[4]);
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
      return (reader.readObjectList<LoanTurn>(
            offset,
            LoanTurnSchema.deserialize,
            allOffsets,
            LoanTurn(),
          ) ??
          []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _groupGetId(Group object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _groupGetLinks(Group object) {
  return [object.member, object.loans];
}

void _groupAttach(IsarCollection<dynamic> col, Id id, Group object) {
  object.id = id;
  object.member.attach(col, col.isar.collection<Member>(), r'member', id);
  object.loans.attach(col, col.isar.collection<Loan>(), r'loans', id);
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

  QueryBuilder<Group, Group, QAfterFilterCondition> loanTurnsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'loanTurns',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanTurnsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'loanTurns',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanTurnsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'loanTurns',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanTurnsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'loanTurns',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanTurnsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'loanTurns',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loanTurnsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'loanTurns',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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

extension GroupQueryObject on QueryBuilder<Group, Group, QFilterCondition> {
  QueryBuilder<Group, Group, QAfterFilterCondition> loanTurnsElement(
      FilterQuery<LoanTurn> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'loanTurns');
    });
  }
}

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

  QueryBuilder<Group, Group, QAfterFilterCondition> loans(FilterQuery<Loan> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'loans');
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loansLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'loans', length, true, length, true);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loansIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'loans', 0, true, 0, true);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loansIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'loans', 0, false, 999999, true);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loansLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'loans', 0, true, length, include);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loansLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'loans', length, include, 999999, true);
    });
  }

  QueryBuilder<Group, Group, QAfterFilterCondition> loansLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'loans', lower, includeLower, upper, includeUpper);
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

  QueryBuilder<Group, List<LoanTurn>, QQueryOperations> loanTurnsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loanTurns');
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

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LoanTurnSchema = Schema(
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

extension LoanTurnQueryFilter
    on QueryBuilder<LoanTurn, LoanTurn, QFilterCondition> {
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
