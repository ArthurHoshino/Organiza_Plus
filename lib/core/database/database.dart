import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DriftDatabase(
  tables: [CDTAREFAS],
  daos: [CDTAREFASDAO]
)
class OrganizaDatabase extends _$OrganizaDatabase {
  OrganizaDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  CDTAREFASDAO get tarefasDao => cdtarefasdao;
}
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

class CDTAREFAS extends Table {
  IntColumn get cdTarId => integer().named('CDTARID').autoIncrement()();
  TextColumn get cdTarNome => text().named('CDTARNOME')();
  BoolColumn get cdTarStatus => boolean().named('CDTARSTATUS')();
  DateTimeColumn get cdTarDataCriado => dateTime().withDefault(currentDateAndTime).named('CDTARDATACRIADO')();
}

@DriftAccessor(tables: [CDTAREFAS])
class CDTAREFASDAO extends DatabaseAccessor<OrganizaDatabase> with _$CDTAREFASDAOMixin {
  final OrganizaDatabase db;

  CDTAREFASDAO(this.db) : super(db);

  Future<List<CDTAREFASData>> getAllTarefas() => select(cdtarefas).get();
  Stream<List<CDTAREFASData>> watchAllTarefas() => select(cdtarefas).watch();
  Future<CDTAREFASData?> getTarefasById(int id) {
    return (select(cdtarefas)..where((tbl) => tbl.cdTarId.equals(id)))
      .getSingleOrNull();
  }
  Stream<CDTAREFASData?> watchTarefasById(int id) {
    return (select(cdtarefas)..where((tbl) => tbl.cdTarId.equals(id)))
      .watchSingleOrNull();
  }
  Future<int> insertTarefa(CDTAREFASCompanion tarefa) => into(cdtarefas).insert(tarefa);
  Future<bool> updateTarefa(CDTAREFASData tarefa) => update(cdtarefas).replace(tarefa);
  Future<int> deleteTarefa(CDTAREFASData tarefa) => delete(cdtarefas).delete(tarefa);
}