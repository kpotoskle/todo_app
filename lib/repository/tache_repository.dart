
import 'package:flutter/foundation.dart';
import 'package:todo_app/models/tache.dart';
final List<tache> _List_tache=[];
class tache_repository with ChangeNotifier{

   List<tache> get List_tache => _List_tache;

   void ajouter(tache th){
    _List_tache.add(th);
    notifyListeners();

  }
   void supprimer(tache th){
    _List_tache.remove(th);
    notifyListeners();
  }
}


