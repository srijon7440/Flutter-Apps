import 'package:flutter/material.dart';
import 'package:untitled/add_recipee.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RecipeApp'),
      ),
      body: ListView.builder(
         itemCount: 5,
          itemBuilder: (context,index){
           return ListTile(
            title: Text("Pasta"),
             subtitle: Text("Creamy Pasta"),
             leading: CircleAvatar()
           );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddRecipe()));
        },child: Icon(Icons.add),),
    );
  }
}
