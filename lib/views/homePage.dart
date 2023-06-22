import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/repository/tache_repository.dart';
import 'package:todo_app/views/add_tache.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    var taches = context.watch<tache_repository>().List_tache;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        foregroundColor: Colors.teal,
        title: Text("Liste des tâches"),
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: taches.length,
                itemBuilder: (context, index) {
                  final currentTache = taches[index];
                  return Card(
                      child: Column(children: [
                    ListTile(
                      title: Text(currentTache.titre.toString()),
                      subtitle: Text(currentTache.description.toString()),
                    ),
                    const Divider(),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {});
                         tache_repository().supprimer(currentTache);
                        },
                        child: Text("supprimer"))
                  ]));
                }))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const add_tache(),
            ),
          );
        },
        child: Icon(Icons.add_circle_outline),
      ),
    );
  }
}
