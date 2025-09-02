import 'package:flutter/material.dart';
import 'package:untitled/home_screen.dart';

main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RecipeApp',
      home: HomeScreen(),
    );
  }
}
