import 'package:drift/drift.dart';

import '../../core/core_components.dart';

class TaskModel {
  // bool trocarStatusTarefa(List<dynamic>? registro) {
  //   bool retorno = false;
  //   try {
  //     print('Trocando legal o status da tarefa');
  //     registro?[1] = !registro?[1];
  //     // persiste no banco
  //     retorno = true;
  //   } catch (e) {
  //     print(e);
  //   }

  //   return retorno;
  // }

  Future<List<CDTAREFASData>> pegarTodasTarefas() async {
    final database = OrganizaDatabase();
    final dao = database.tarefasDao;

    return dao.getAllTarefas();
  }

  Future<bool> trocarStatusTarefa(int id) async {
    final database = OrganizaDatabase();
    final dao = database.tarefasDao;
    var tarefa = await dao.getTarefasById(id);
    CDTAREFASData tarefaAtualizada;
    bool deuCerto = true;
    if (tarefa != null) {
      tarefaAtualizada = CDTAREFASData(
        cdTarId: tarefa.cdTarId, 
        cdTarNome: tarefa.cdTarNome, 
        cdTarStatus: !tarefa.cdTarStatus, 
        cdTarDataCriado: DateTime.now(),
        );
      try {
        await dao.updateTarefa(tarefaAtualizada);
      } catch (e) {
        print('❌ Erro Update Tarefa: $e');
        deuCerto = false;
      }
    } else {
      deuCerto = false;
    }

    return deuCerto;
  }

  Future<bool> deletarTarefa(int id) async {
    final database = OrganizaDatabase();
    final dao = database.tarefasDao;
    var tarefa = await dao.getTarefasById(id);
    bool deuCerto = true;

    try {
      await dao.deleteTarefa(tarefa!);
    } catch (e) {
      print('❌ Erro Delete Tarefa: $e');
      deuCerto = false;
    }

    return deuCerto;
  }

  Future<bool> renomearTarefa(int id, String novoNome) async {
    final database = OrganizaDatabase();
    final dao = database.tarefasDao;
    var tarefa = await dao.getTarefasById(id);
    CDTAREFASData tarefaAtualizada;
    bool deuCerto = true;

    if (tarefa != null) {
      tarefaAtualizada = CDTAREFASData(
        cdTarId: tarefa.cdTarId, 
        cdTarNome: novoNome,
        cdTarStatus: tarefa.cdTarStatus,
        cdTarDataCriado: tarefa.cdTarDataCriado
      );

      try {
        await dao.updateTarefa(tarefaAtualizada);
      } catch (e) {
        print('❌ Erro Update Nome Tarefa: $e');
        deuCerto = false;
      }
    } else {
      deuCerto = false;
    }

    return deuCerto;
  }
}