import 'package:firstapp/pages/homepage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
 await  Hive.initFlutter();
 var box=await Hive.openBox('mybox');
  runApp( const MyApp());  
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
