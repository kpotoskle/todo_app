
import 'package:todo_app/models/tache.dart';

class tache_repository{
  static List<tache> List_tache=[];
  static void ajouter_tache(tache th){
    List_tache.add(th);
  }
  static void supprimer_tache(tache th){
    List_tache.remove(th);
  }
}