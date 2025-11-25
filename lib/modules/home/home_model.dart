import '../../core/core_components.dart';

class HomeModel {
  Future<bool> inserirTarefa(String tarefa) async {
    final database = OrganizaDatabase();
    final dao = database.tarefasDao;
    final tarefaCompanion = CDTAREFASCompanion.insert(cdTarNome: tarefa, cdTarStatus: false);
    bool deuCerto = true;

    try {
      await dao.insertTarefa(tarefaCompanion);
    } catch (e) {
      print('❌ Erro Insert Tarefa: $e');
      deuCerto = false;
    }

    return deuCerto;
  }
}