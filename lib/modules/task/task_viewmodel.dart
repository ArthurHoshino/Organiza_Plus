import 'package:flutter/material.dart';
import 'package:organiza_plus/modules/home/home_model.dart';
import 'task_model.dart';
import '../../core/core_components.dart';

enum Filtros { todas, pendentes, concluidas }

class TaskViewModel extends ChangeNotifier {
  final TaskModel taskModel = TaskModel();
  final HomeModel homeModel = HomeModel();
  late List<CDTAREFASData> mapaTarefas = [];
  bool _isLoading = false;
  Filtros filtroAtual = Filtros.todas;

  bool get isLoading => _isLoading;

  List<CDTAREFASData> get tarefasFiltradas {
    switch (filtroAtual) {
      case Filtros.concluidas:
        return mapaTarefas.where((t) => t.cdTarStatus == true).toList();
      case Filtros.pendentes:
        return mapaTarefas.where((t) => t.cdTarStatus == false).toList();
      case Filtros.todas:
        return mapaTarefas;
    }
  }

  Future<void> popularLista() async {
    _isLoading = true;
    mapaTarefas = await taskModel.pegarTodasTarefas();
    bool houveAlteracao = false;
    final hoje = DateTime.now();
    
    for (var tarefa in mapaTarefas) {
      if (tarefa.cdTarStatus) {
        bool ehVelha = tarefa.cdTarDataCriado.day != hoje.day ||
                       tarefa.cdTarDataCriado.month != hoje.month ||
                       tarefa.cdTarDataCriado.year != hoje.year;
        if (ehVelha) {
          print("Resetando tarefa antiga: ${tarefa.cdTarNome}");
          await taskModel.trocarStatusTarefa(tarefa.cdTarId);
          houveAlteracao = true;
        }
      }
    }
    if (houveAlteracao) {
      mapaTarefas = await taskModel.pegarTodasTarefas();
    }

    print('Aqui legal 👍 $mapaTarefas');
    _isLoading = false;
    notifyListeners();
  }

  Future<void> adicionarTarefa(String nomeTarefa) async {
    print('Inseriu Tarefa 👍 $mapaTarefas');
    await homeModel.inserirTarefa(nomeTarefa);
    await popularLista();
  }

  Future<void> trocarStatusTarefa(int id) async {
    print('Trocou status legal 👍 $mapaTarefas');
    await taskModel.trocarStatusTarefa(id);
    await popularLista();
  }

  Future<void> excluirTarefa(int id) async {
    print('Excluiu 👍 $mapaTarefas');
    await taskModel.deletarTarefa(id);
    await popularLista();
  }

  Future<void> editarTarefa(int id, String novoNome) async {
    print('Editou 👍 $mapaTarefas');
    await taskModel.renomearTarefa(id, novoNome);
    await popularLista();
  }

  double calcularPorcentagem() {
    if (mapaTarefas.isEmpty) {
      return 0.0;
    }
    int totalConcluidas = mapaTarefas.where((tarefa) => tarefa.cdTarStatus).length;
    return totalConcluidas / mapaTarefas.length;
  }

  void alterarFiltro(Filtros novoFiltro) {
    filtroAtual = novoFiltro;
    notifyListeners();
  }
}