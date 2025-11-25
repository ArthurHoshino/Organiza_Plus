import 'package:flutter/material.dart';
import 'package:organiza_plus/core/core_components.dart';
import 'task_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:organiza_plus/modules/edita_task/edita_task_view.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  bool _isInitialized = false;
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<TaskViewModel>(context, listen: true);
    if (!_isInitialized) {
      viewmodel.popularLista();
      _isInitialized = true;
    }

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 16, horizontal: 8),
      child: ListView.builder(
        itemCount: viewmodel.tarefasFiltradas.length,
        itemBuilder: (context, index) {
          return TaskCard(
            nomeTarefa: viewmodel.tarefasFiltradas[index].cdTarNome,
            statusTarefa: viewmodel.tarefasFiltradas[index].cdTarStatus,
            onChanged: (value) => viewmodel.trocarStatusTarefa(viewmodel.tarefasFiltradas[index].cdTarId),
            onDeleted: () => viewmodel.excluirTarefa(viewmodel.tarefasFiltradas[index].cdTarId),
            onEdited: () async {
              final String? novoNome = await showDialog<String?>(
                context: context,
                builder: (BuildContext context) {
                  return EditTaskModal(nomeAtual: viewmodel.tarefasFiltradas[index].cdTarNome);
                },
              );
              if (novoNome != null && novoNome.isNotEmpty) {
                viewmodel.editarTarefa(viewmodel.tarefasFiltradas[index].cdTarId, novoNome);
              }
            }
          );
        },
      ),
    );
  }
}
