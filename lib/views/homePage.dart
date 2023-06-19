import'package:flutter/material.dart';

import 'package:todo_app/repository/tache_repository.dart';
import 'package:todo_app/views/add_tache.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.teal,
        title: Text("Liste des tâches"),
      ),
      body: Column(
        children: [
          Expanded(child: ListView(
            children: tache_repository.List_tache
                .where((tache)=> tache.titre != null)
                .map((tache)=> Card(
              child: Column(
                children : [
                   ListTile(
                title: Text(tache.titre.toString()),
                subtitle: Text(tache.description.toString()),
              ),
                  const Divider(),
                  ElevatedButton(
                      onPressed: ()
                      {setState(() {
                          tache_repository.supprimer_tache(tache);
                        });
                      }
                      , child: Text("supprimer"))
            ]
            )
            )).toList(),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const add_tache(),
            ),
          );

        },
        child: Icon(
            Icons.add_circle_outline

        ),
      ),
    );
  }
}


