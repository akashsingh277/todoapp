import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoTile extends StatelessWidget {
  final String taskNAme;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)?deleteFunction;
   ToDoTile({super.key,
  required this.taskNAme,
  required this.taskCompleted,
  required this.onChanged,
  required this.deleteFunction,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
      child: Slidable(
       endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(15),
          )
        ],
       ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged
                // activeColor: Colors.black,
                ),
              Text(
                taskNAme,
                style: TextStyle(decoration: taskCompleted 
                ? TextDecoration.lineThrough
                : TextDecoration.none),
                ),
            ],
          ),
        ),
      ),
    );
  }
}