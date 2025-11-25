// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CDTAREFASTable extends CDTAREFAS
    with TableInfo<$CDTAREFASTable, CDTAREFASData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CDTAREFASTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cdTarIdMeta = const VerificationMeta(
    'cdTarId',
  );
  @override
  late final GeneratedColumn<int> cdTarId = GeneratedColumn<int>(
    'CDTARID',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cdTarNomeMeta = const VerificationMeta(
    'cdTarNome',
  );
  @override
  late final GeneratedColumn<String> cdTarNome = GeneratedColumn<String>(
    'CDTARNOME',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cdTarStatusMeta = const VerificationMeta(
    'cdTarStatus',
  );
  @override
  late final GeneratedColumn<bool> cdTarStatus = GeneratedColumn<bool>(
    'CDTARSTATUS',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("CDTARSTATUS" IN (0, 1))',
    ),
  );
  static const VerificationMeta _cdTarDataCriadoMeta = const VerificationMeta(
    'cdTarDataCriado',
  );
  @override
  late final GeneratedColumn<DateTime> cdTarDataCriado =
      GeneratedColumn<DateTime>(
        'CDTARDATACRIADO',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  @override
  List<GeneratedColumn> get $columns => [
    cdTarId,
    cdTarNome,
    cdTarStatus,
    cdTarDataCriado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cdtarefas';
  @override
  VerificationContext validateIntegrity(
    Insertable<CDTAREFASData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('CDTARID')) {
      context.handle(
        _cdTarIdMeta,
        cdTarId.isAcceptableOrUnknown(data['CDTARID']!, _cdTarIdMeta),
      );
    }
    if (data.containsKey('CDTARNOME')) {
      context.handle(
        _cdTarNomeMeta,
        cdTarNome.isAcceptableOrUnknown(data['CDTARNOME']!, _cdTarNomeMeta),
      );
    } else if (isInserting) {
      context.missing(_cdTarNomeMeta);
    }
    if (data.containsKey('CDTARSTATUS')) {
      context.handle(
        _cdTarStatusMeta,
        cdTarStatus.isAcceptableOrUnknown(
          data['CDTARSTATUS']!,
          _cdTarStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cdTarStatusMeta);
    }
    if (data.containsKey('CDTARDATACRIADO')) {
      context.handle(
        _cdTarDataCriadoMeta,
        cdTarDataCriado.isAcceptableOrUnknown(
          data['CDTARDATACRIADO']!,
          _cdTarDataCriadoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cdTarId};
  @override
  CDTAREFASData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CDTAREFASData(
      cdTarId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CDTARID'],
      )!,
      cdTarNome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CDTARNOME'],
      )!,
      cdTarStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}CDTARSTATUS'],
      )!,
      cdTarDataCriado: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}CDTARDATACRIADO'],
      )!,
    );
  }

  @override
  $CDTAREFASTable createAlias(String alias) {
    return $CDTAREFASTable(attachedDatabase, alias);
  }
}

class CDTAREFASData extends DataClass implements Insertable<CDTAREFASData> {
  final int cdTarId;
  final String cdTarNome;
  final bool cdTarStatus;
  final DateTime cdTarDataCriado;
  const CDTAREFASData({
    required this.cdTarId,
    required this.cdTarNome,
    required this.cdTarStatus,
    required this.cdTarDataCriado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['CDTARID'] = Variable<int>(cdTarId);
    map['CDTARNOME'] = Variable<String>(cdTarNome);
    map['CDTARSTATUS'] = Variable<bool>(cdTarStatus);
    map['CDTARDATACRIADO'] = Variable<DateTime>(cdTarDataCriado);
    return map;
  }

  CDTAREFASCompanion toCompanion(bool nullToAbsent) {
    return CDTAREFASCompanion(
      cdTarId: Value(cdTarId),
      cdTarNome: Value(cdTarNome),
      cdTarStatus: Value(cdTarStatus),
      cdTarDataCriado: Value(cdTarDataCriado),
    );
  }

  factory CDTAREFASData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CDTAREFASData(
      cdTarId: serializer.fromJson<int>(json['cdTarId']),
      cdTarNome: serializer.fromJson<String>(json['cdTarNome']),
      cdTarStatus: serializer.fromJson<bool>(json['cdTarStatus']),
      cdTarDataCriado: serializer.fromJson<DateTime>(json['cdTarDataCriado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cdTarId': serializer.toJson<int>(cdTarId),
      'cdTarNome': serializer.toJson<String>(cdTarNome),
      'cdTarStatus': serializer.toJson<bool>(cdTarStatus),
      'cdTarDataCriado': serializer.toJson<DateTime>(cdTarDataCriado),
    };
  }

  CDTAREFASData copyWith({
    int? cdTarId,
    String? cdTarNome,
    bool? cdTarStatus,
    DateTime? cdTarDataCriado,
  }) => CDTAREFASData(
    cdTarId: cdTarId ?? this.cdTarId,
    cdTarNome: cdTarNome ?? this.cdTarNome,
    cdTarStatus: cdTarStatus ?? this.cdTarStatus,
    cdTarDataCriado: cdTarDataCriado ?? this.cdTarDataCriado,
  );
  CDTAREFASData copyWithCompanion(CDTAREFASCompanion data) {
    return CDTAREFASData(
      cdTarId: data.cdTarId.present ? data.cdTarId.value : this.cdTarId,
      cdTarNome: data.cdTarNome.present ? data.cdTarNome.value : this.cdTarNome,
      cdTarStatus: data.cdTarStatus.present
          ? data.cdTarStatus.value
          : this.cdTarStatus,
      cdTarDataCriado: data.cdTarDataCriado.present
          ? data.cdTarDataCriado.value
          : this.cdTarDataCriado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CDTAREFASData(')
          ..write('cdTarId: $cdTarId, ')
          ..write('cdTarNome: $cdTarNome, ')
          ..write('cdTarStatus: $cdTarStatus, ')
          ..write('cdTarDataCriado: $cdTarDataCriado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(cdTarId, cdTarNome, cdTarStatus, cdTarDataCriado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CDTAREFASData &&
          other.cdTarId == this.cdTarId &&
          other.cdTarNome == this.cdTarNome &&
          other.cdTarStatus == this.cdTarStatus &&
          other.cdTarDataCriado == this.cdTarDataCriado);
}

class CDTAREFASCompanion extends UpdateCompanion<CDTAREFASData> {
  final Value<int> cdTarId;
  final Value<String> cdTarNome;
  final Value<bool> cdTarStatus;
  final Value<DateTime> cdTarDataCriado;
  const CDTAREFASCompanion({
    this.cdTarId = const Value.absent(),
    this.cdTarNome = const Value.absent(),
    this.cdTarStatus = const Value.absent(),
    this.cdTarDataCriado = const Value.absent(),
  });
  CDTAREFASCompanion.insert({
    this.cdTarId = const Value.absent(),
    required String cdTarNome,
    required bool cdTarStatus,
    this.cdTarDataCriado = const Value.absent(),
  }) : cdTarNome = Value(cdTarNome),
       cdTarStatus = Value(cdTarStatus);
  static Insertable<CDTAREFASData> custom({
    Expression<int>? cdTarId,
    Expression<String>? cdTarNome,
    Expression<bool>? cdTarStatus,
    Expression<DateTime>? cdTarDataCriado,
  }) {
    return RawValuesInsertable({
      if (cdTarId != null) 'CDTARID': cdTarId,
      if (cdTarNome != null) 'CDTARNOME': cdTarNome,
      if (cdTarStatus != null) 'CDTARSTATUS': cdTarStatus,
      if (cdTarDataCriado != null) 'CDTARDATACRIADO': cdTarDataCriado,
    });
  }

  CDTAREFASCompanion copyWith({
    Value<int>? cdTarId,
    Value<String>? cdTarNome,
    Value<bool>? cdTarStatus,
    Value<DateTime>? cdTarDataCriado,
  }) {
    return CDTAREFASCompanion(
      cdTarId: cdTarId ?? this.cdTarId,
      cdTarNome: cdTarNome ?? this.cdTarNome,
      cdTarStatus: cdTarStatus ?? this.cdTarStatus,
      cdTarDataCriado: cdTarDataCriado ?? this.cdTarDataCriado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cdTarId.present) {
      map['CDTARID'] = Variable<int>(cdTarId.value);
    }
    if (cdTarNome.present) {
      map['CDTARNOME'] = Variable<String>(cdTarNome.value);
    }
    if (cdTarStatus.present) {
      map['CDTARSTATUS'] = Variable<bool>(cdTarStatus.value);
    }
    if (cdTarDataCriado.present) {
      map['CDTARDATACRIADO'] = Variable<DateTime>(cdTarDataCriado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CDTAREFASCompanion(')
          ..write('cdTarId: $cdTarId, ')
          ..write('cdTarNome: $cdTarNome, ')
          ..write('cdTarStatus: $cdTarStatus, ')
          ..write('cdTarDataCriado: $cdTarDataCriado')
          ..write(')'))
        .toString();
  }
}

abstract class _$OrganizaDatabase extends GeneratedDatabase {
  _$OrganizaDatabase(QueryExecutor e) : super(e);
  $OrganizaDatabaseManager get managers => $OrganizaDatabaseManager(this);
  late final $CDTAREFASTable cdtarefas = $CDTAREFASTable(this);
  late final CDTAREFASDAO cdtarefasdao = CDTAREFASDAO(this as OrganizaDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cdtarefas];
}

typedef $$CDTAREFASTableCreateCompanionBuilder =
    CDTAREFASCompanion Function({
      Value<int> cdTarId,
      required String cdTarNome,
      required bool cdTarStatus,
      Value<DateTime> cdTarDataCriado,
    });
typedef $$CDTAREFASTableUpdateCompanionBuilder =
    CDTAREFASCompanion Function({
      Value<int> cdTarId,
      Value<String> cdTarNome,
      Value<bool> cdTarStatus,
      Value<DateTime> cdTarDataCriado,
    });

class $$CDTAREFASTableFilterComposer
    extends Composer<_$OrganizaDatabase, $CDTAREFASTable> {
  $$CDTAREFASTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get cdTarId => $composableBuilder(
    column: $table.cdTarId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cdTarNome => $composableBuilder(
    column: $table.cdTarNome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get cdTarStatus => $composableBuilder(
    column: $table.cdTarStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cdTarDataCriado => $composableBuilder(
    column: $table.cdTarDataCriado,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CDTAREFASTableOrderingComposer
    extends Composer<_$OrganizaDatabase, $CDTAREFASTable> {
  $$CDTAREFASTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get cdTarId => $composableBuilder(
    column: $table.cdTarId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cdTarNome => $composableBuilder(
    column: $table.cdTarNome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get cdTarStatus => $composableBuilder(
    column: $table.cdTarStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cdTarDataCriado => $composableBuilder(
    column: $table.cdTarDataCriado,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CDTAREFASTableAnnotationComposer
    extends Composer<_$OrganizaDatabase, $CDTAREFASTable> {
  $$CDTAREFASTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get cdTarId =>
      $composableBuilder(column: $table.cdTarId, builder: (column) => column);

  GeneratedColumn<String> get cdTarNome =>
      $composableBuilder(column: $table.cdTarNome, builder: (column) => column);

  GeneratedColumn<bool> get cdTarStatus => $composableBuilder(
    column: $table.cdTarStatus,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cdTarDataCriado => $composableBuilder(
    column: $table.cdTarDataCriado,
    builder: (column) => column,
  );
}

class $$CDTAREFASTableTableManager
    extends
        RootTableManager<
          _$OrganizaDatabase,
          $CDTAREFASTable,
          CDTAREFASData,
          $$CDTAREFASTableFilterComposer,
          $$CDTAREFASTableOrderingComposer,
          $$CDTAREFASTableAnnotationComposer,
          $$CDTAREFASTableCreateCompanionBuilder,
          $$CDTAREFASTableUpdateCompanionBuilder,
          (
            CDTAREFASData,
            BaseReferences<_$OrganizaDatabase, $CDTAREFASTable, CDTAREFASData>,
          ),
          CDTAREFASData,
          PrefetchHooks Function()
        > {
  $$CDTAREFASTableTableManager(_$OrganizaDatabase db, $CDTAREFASTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CDTAREFASTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CDTAREFASTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CDTAREFASTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> cdTarId = const Value.absent(),
                Value<String> cdTarNome = const Value.absent(),
                Value<bool> cdTarStatus = const Value.absent(),
                Value<DateTime> cdTarDataCriado = const Value.absent(),
              }) => CDTAREFASCompanion(
                cdTarId: cdTarId,
                cdTarNome: cdTarNome,
                cdTarStatus: cdTarStatus,
                cdTarDataCriado: cdTarDataCriado,
              ),
          createCompanionCallback:
              ({
                Value<int> cdTarId = const Value.absent(),
                required String cdTarNome,
                required bool cdTarStatus,
                Value<DateTime> cdTarDataCriado = const Value.absent(),
              }) => CDTAREFASCompanion.insert(
                cdTarId: cdTarId,
                cdTarNome: cdTarNome,
                cdTarStatus: cdTarStatus,
                cdTarDataCriado: cdTarDataCriado,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CDTAREFASTableProcessedTableManager =
    ProcessedTableManager<
      _$OrganizaDatabase,
      $CDTAREFASTable,
      CDTAREFASData,
      $$CDTAREFASTableFilterComposer,
      $$CDTAREFASTableOrderingComposer,
      $$CDTAREFASTableAnnotationComposer,
      $$CDTAREFASTableCreateCompanionBuilder,
      $$CDTAREFASTableUpdateCompanionBuilder,
      (
        CDTAREFASData,
        BaseReferences<_$OrganizaDatabase, $CDTAREFASTable, CDTAREFASData>,
      ),
      CDTAREFASData,
      PrefetchHooks Function()
    >;

class $OrganizaDatabaseManager {
  final _$OrganizaDatabase _db;
  $OrganizaDatabaseManager(this._db);
  $$CDTAREFASTableTableManager get cdtarefas =>
      $$CDTAREFASTableTableManager(_db, _db.cdtarefas);
}

mixin _$CDTAREFASDAOMixin on DatabaseAccessor<OrganizaDatabase> {
  $CDTAREFASTable get cdtarefas => attachedDatabase.cdtarefas;
}
