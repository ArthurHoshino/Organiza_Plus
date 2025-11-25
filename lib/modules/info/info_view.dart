import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:organiza_plus/modules/task/task_viewmodel.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<TaskViewModel>(context);
    final porcentagem = viewmodel.calcularPorcentagem();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Progresso Atual",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  value: porcentagem,
                  strokeWidth: 15,
                  backgroundColor: Colors.grey[300],
                  color: Colors.green,
                ),
              ),
              Text(
                "${(porcentagem * 100).toStringAsFixed(0)}%",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 30),
          
          Text(
            "Você completou ${viewmodel.mapaTarefas.where((t) => t.cdTarStatus).length} de ${viewmodel.mapaTarefas.length} tarefas",
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}