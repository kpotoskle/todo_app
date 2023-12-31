import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/repository/tache_repository.dart';
import 'package:todo_app/views/homePage.dart';

void main() {
  runApp(ChangeNotifierProvider<tache_repository>(
      create: (context) => tache_repository(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: home(),

    );
  }
}
