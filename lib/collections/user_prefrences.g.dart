// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_prefrences.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetUserPrefrencesCollection on Isar {
  IsarCollection<UserPrefrences> get userPrefrences => this.collection();
}

const UserPrefrencesSchema = CollectionSchema(
  name: r'UserPrefrences',
  id: -612110930006759707,
  properties: {
    r'firstRun': PropertySchema(
      id: 0,
      name: r'firstRun',
      type: IsarType.bool,
    )
  },
  estimateSize: _userPrefrencesEstimateSize,
  serialize: _userPrefrencesSerialize,
  deserialize: _userPrefrencesDeserialize,
  deserializeProp: _userPrefrencesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userPrefrencesGetId,
  getLinks: _userPrefrencesGetLinks,
  attach: _userPrefrencesAttach,
  version: '3.0.1',
);

int _userPrefrencesEstimateSize(
  UserPrefrences object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _userPrefrencesSerialize(
  UserPrefrences object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.firstRun);
}

UserPrefrences _userPrefrencesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserPrefrences();
  object.firstRun = reader.readBoolOrNull(offsets[0]);
  object.id = id;
  return object;
}

P _userPrefrencesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userPrefrencesGetId(UserPrefrences object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userPrefrencesGetLinks(UserPrefrences object) {
  return [];
}

void _userPrefrencesAttach(
    IsarCollection<dynamic> col, Id id, UserPrefrences object) {
  object.id = id;
}

extension UserPrefrencesQueryWhereSort
    on QueryBuilder<UserPrefrences, UserPrefrences, QWhere> {
  QueryBuilder<UserPrefrences, UserPrefrences, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserPrefrencesQueryWhere
    on QueryBuilder<UserPrefrences, UserPrefrences, QWhereClause> {
  QueryBuilder<UserPrefrences, UserPrefrences, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserPrefrences, UserPrefrences, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<UserPrefrences, UserPrefrences, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserPrefrences, UserPrefrences, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserPrefrences, UserPrefrences, QAfterWhereClause> idBetween(
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

extension UserPrefrencesQueryFilter
    on QueryBuilder<UserPrefrences, UserPrefrences, QFilterCondition> {
  QueryBuilder<UserPrefrences, UserPrefrences, QAfterFilterCondition>
      firstRunIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstRun',
      ));
    });
  }

  QueryBuilder<UserPrefrences, UserPrefrences, QAfterFilterCondition>
      firstRunIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstRun',
      ));
    });
  }

  QueryBuilder<UserPrefrences, UserPrefrences, QAfterFilterCondition>
      firstRunEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstRun',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPrefrences, UserPrefrences, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPrefrences, UserPrefrences, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<UserPrefrences, UserPrefrences, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<UserPrefrences, UserPrefrences, QAfterFilterCondition> idBetween(
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
}

extension UserPrefrencesQueryObject
    on QueryBuilder<UserPrefrences, UserPrefrences, QFilterCondition> {}

extension UserPrefrencesQueryLinks
    on QueryBuilder<UserPrefrences, UserPrefrences, QFilterCondition> {}

extension UserPrefrencesQuerySortBy
    on QueryBuilder<UserPrefrences, UserPrefrences, QSortBy> {
  QueryBuilder<UserPrefrences, UserPrefrences, QAfterSortBy> sortByFirstRun() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstRun', Sort.asc);
    });
  }

  QueryBuilder<UserPrefrences, UserPrefrences, QAfterSortBy>
      sortByFirstRunDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstRun', Sort.desc);
    });
  }
}

extension UserPrefrencesQuerySortThenBy
    on QueryBuilder<UserPrefrences, UserPrefrences, QSortThenBy> {
  QueryBuilder<UserPrefrences, UserPrefrences, QAfterSortBy> thenByFirstRun() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstRun', Sort.asc);
    });
  }

  QueryBuilder<UserPrefrences, UserPrefrences, QAfterSortBy>
      thenByFirstRunDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstRun', Sort.desc);
    });
  }

  QueryBuilder<UserPrefrences, UserPrefrences, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserPrefrences, UserPrefrences, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension UserPrefrencesQueryWhereDistinct
    on QueryBuilder<UserPrefrences, UserPrefrences, QDistinct> {
  QueryBuilder<UserPrefrences, UserPrefrences, QDistinct> distinctByFirstRun() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstRun');
    });
  }
}

extension UserPrefrencesQueryProperty
    on QueryBuilder<UserPrefrences, UserPrefrences, QQueryProperty> {
  QueryBuilder<UserPrefrences, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserPrefrences, bool?, QQueryOperations> firstRunProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstRun');
    });
  }
}
