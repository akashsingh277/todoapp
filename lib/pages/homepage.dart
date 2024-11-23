import 'package:firstapp/util/dialogbox.dart';
import 'package:firstapp/util/todotile.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todolist=[
    ["Do Exercise",false],
     ["Sleep",false],
  ];
  void checkBoxChanged(bool? value,int index){
setState(() {
  todolist[index][1]=!todolist[index][1];
});
  }
  void createNewTask(){
    showDialog(
      context: context,
       builder: (context){
        return DialogBox();

       },);
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
       itemCount: todolist.length,
       itemBuilder: (context, index) {
         return ToDoTile(
          taskNAme: todolist[index][0],
          taskCompleted: todolist[index][1],
           onChanged: (value) => checkBoxChanged(value,index),
           );
       },
      ),
    );
  }
}