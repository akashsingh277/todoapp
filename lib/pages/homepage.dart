import 'package:firstapp/data/database.dart';
import 'package:firstapp/util/dialogbox.dart';
import 'package:firstapp/util/todotile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';
class HomePage extends StatefulWidget {
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox=Hive.box('mybox');
  ToDoDataBase db =ToDoDataBase();


  @override
  void initState() {
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }
  final _controller=TextEditingController();
  // List todolist=[
  //   ["Do Exercise",false],
  //    ["Sleep",false],
  // ];
  void checkBoxChanged(bool? value,int index){
setState(() {
  db.todolist[index][1]=!db.todolist[index][1];
});
 db.updateDataBase();
  }
  void saveNewTask(){
    setState(() {
      db.todolist.add([_controller.text,false]);
      _controller.clear(); 
    });
    Navigator.of(context).pop();
    db..updateDataBase();
  }
  void createNewTask(){
    showDialog(
      context: context,
       builder: (context){
        return DialogBox(
          controller:_controller ,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );

       },);
  }
  void deleteTask(int index){
setState(() {
  db.todolist.removeAt(index);
});
db.updateDataBase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(child: Text("To Do")),
        elevation: 0,
      ),
      floatingActionButton:FloatingActionButton (
        onPressed:createNewTask,
      child: Icon(Icons.add),
      ),
      body: ListView.builder(
       itemCount: db.todolist.length,
       itemBuilder: (context, index) {
         return ToDoTile(
          taskNAme: db.todolist[index][0],
          taskCompleted: db.todolist[index][1],
          onChanged: (value) => checkBoxChanged(value,index),
          deleteFunction:(context)=>deleteTask(index),
           );
       },
      ),
    );
  }
}