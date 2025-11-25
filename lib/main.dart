import 'package:flutter/material.dart';
import 'package:organiza_plus/modules/home/home_view.dart';
import 'package:organiza_plus/modules/home/home_viewmodel.dart';
import 'package:organiza_plus/modules/task/task_viewmodel.dart';
import 'package:provider/provider.dart';
import 'core/core_components.dart';
import 'package:drift/drift.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewmodel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '💣 Organiza+ 💣',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Cores.corPrincipal1),
      ),
      home: const HomeView(title: 'Flutter Demo Home Page'),
    );
  }
}

