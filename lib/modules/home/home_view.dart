import 'package:flutter/material.dart';
import 'package:organiza_plus/modules/task/task_viewmodel.dart';
import 'package:organiza_plus/modules/insere_task/insere_task_view.dart';
import 'package:organiza_plus/modules/task/task_view.dart';
import 'package:organiza_plus/modules/info/info_view.dart';

import 'package:organiza_plus/core/core_components.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<void> showNameForm(BuildContext context) async {
    print("👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍");
    final viewmodel = Provider.of<TaskViewModel>(context, listen: false);

    final String? result = await showDialog<String?>(
      context: context,
      builder: (BuildContext context) {
        return const NameFormModal();
      },
    );

    // Trata o resultado
    if (result != null) {
      viewmodel.adicionarTarefa(result);
      print('Nome capturado: $result');
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Organiza'),
                WidgetSpan(child: Icon(Icons.add))
              ]
            ),
          ),
          actions: [
            PopupMenuButton<Filtros>(
              icon: const Icon(Icons.filter_list),
              tooltip: 'Filtrar',
              initialValue: taskViewModel.filtroAtual,
              
              onSelected: (Filtros item) {
                taskViewModel.alterarFiltro(item);
              },
              
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Filtros>>[
                const PopupMenuItem(
                  value: Filtros.todas,
                  child: Text('Todas'),
                ),
                const PopupMenuItem(
                  value: Filtros.pendentes,
                  child: Text('A Fazer'),
                ),
                const PopupMenuItem(
                  value: Filtros.concluidas,
                  child: Text('Concluídas'),
                ),
              ],
            ),
            const SizedBox(width: 10),
          ],
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_box),
                    SizedBox(width: 8),
                    Text('Tarefas'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bar_chart),
                    SizedBox(width: 8),
                    Text('Info para 🤓'),
                  ],
                ),
              )
            ],
          ),
        ),
        backgroundColor: Cores.corFundo1,
        body: const TabBarView(
          children: [
            TaskView(),
            InfoView(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showNameForm(context);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}