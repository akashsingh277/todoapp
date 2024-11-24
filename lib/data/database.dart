

import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List todolist=[];
  final _myBox=Hive.box('mybox');
  void createInitialData(){
    todolist=[
      ["Eat", false],
      ["Sleep",false],
    ];

  }
  void loadData(){
 todolist= _myBox.get("TODOLIST");

  }
  void updateDataBase(){
_myBox.put("TODOLIST", todolist);
  }
}