import 'package:firstapp/util/button.dart';
import 'package:flutter/material.dart';
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
  required this.controller,
  required this.onSave,
  required this.onCancel,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:Colors.yellow ,
      content: Container(
        height: 120,
        child: Column(children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "add a new task",
            ),
          ),
          Row(children: [
             Mybutton(text: "Save", onPressed: onSave ),
             const SizedBox(width: 8,),
             Mybutton(text: "Cancel", onPressed: onCancel),
          ],)
        ],),
      ),
    );
  }
}