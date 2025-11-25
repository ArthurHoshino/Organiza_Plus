import 'package:flutter/material.dart';
import 'package:organiza_plus/modules/task/task_viewmodel.dart';

class HomeViewmodel extends ChangeNotifier {
  final viewmodelTask = TaskViewModel();

  Future<void> insereTarefa(String tarefa) async {
    await viewmodelTask.adicionarTarefa(tarefa);
  }
}