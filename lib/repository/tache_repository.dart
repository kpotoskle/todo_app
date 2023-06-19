
import 'package:todo_app/models/tache.dart';

class tache_repository{
  List<tache> List_tache=[];
  void ajouter_tache(tache th){
    List_tache.add(th);
  }
  void supprimer_tache(tache th){
    List_tache.remove(th);
  }
}