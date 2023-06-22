import 'package:flutter/material.dart';
import 'package:todo_app/models/tache.dart';
import 'package:todo_app/repository/tache_repository.dart';
import 'package:todo_app/views/homePage.dart';

class add_tache extends StatefulWidget {
  const add_tache({Key? key}) : super(key: key);

  @override
  State<add_tache> createState() => _add_tacheState();
}

class _add_tacheState extends State<add_tache> {
  DateTime? choiceDate;
  String? titre;
  String? description;
  GlobalKey<FormState> keyCol = GlobalKey();


  TextEditingController description_controller = TextEditingController();
  TextEditingController titre_controller = TextEditingController();
  TextEditingController date_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final taches = tache_repository();
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter la tâche"),
        centerTitle: true,
        foregroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () {

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const home(),
            ),
          );
        },
          icon: Icon(Icons.arrow_back),

        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: keyCol,
          child: Column(
            children: [
              TextFormField(
                controller: titre_controller,
                decoration: InputDecoration(
                  hintText: "Titre",
                  border: UnderlineInputBorder(),
                  hintStyle: TextStyle(fontSize: 32),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
                onChanged: (value) {
                  titre = value;
                },
              ),
              TextFormField(
                controller: description_controller,
                //minLines: 2,
                maxLines: 12,
                decoration: InputDecoration(
                  hintText: 'Note',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  description = value;
                },
              ),
              /* SizedBox(height: 10,),
         GestureDetector(
           child: Container(

             height: 55,

             width: MediaQuery.of(context).size.width,
             alignment: Alignment.centerLeft,
             padding: EdgeInsets.only(left: 110),
             decoration: BoxDecoration(border: Border.all()),
             child: Text(
               choiceDate !=null
                 ? choiceDate.toString()
               :"choisir une deadline",
                   style: TextStyle( fontSize:15 ),
                 ),
           ),
           onTap: (){
             showDatePicker(context: context,
                 initialDate: DateTime.now(),
                 firstDate: DateTime.parse("1994-02-02"),
                 lastDate: DateTime.parse("2040-02-02"))
                 .then((value) {
                   choiceDate=value;
             });
           },
         ),*/
              SizedBox(
                height: 70,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (keyCol.currentState!.validate() && titre != null) {
                      tache tch = tache(titre: titre, description: description);

                      setState(() {
                        description_controller.clear();
                        titre_controller.clear();
                        taches.ajouter(tch);});
                      showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                                title: Text("Succes"),
                                content: Text("Tache ajoutée avec succès"),
                              ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Ajouter"))
            ],
          ),
        ),
      ),
    );
  }
}
