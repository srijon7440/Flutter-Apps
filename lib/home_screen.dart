import 'package:flutter/material.dart';
import 'package:untitled/add_recipee.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe>recipeList=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
                'Food Recipes',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                fontWeight: FontWeight.bold
            ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
         itemCount: recipeList.length,
          itemBuilder: (context,index){
           Recipe recipe=recipeList[index];
           return ListTile(
            title: Text(recipe.title),
             subtitle: Text(recipe.description),
             leading: CircleAvatar(
               backgroundImage: NetworkImage(
                 'https://marketplace.canva.com/EAFaFUz4aKo/3/0/1600w/canva-yellow-abstract-cooking-fire-free-logo-tn1zF-_cG9c.jpg'
               ),
             )
           );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
       Recipe recipe= await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddRecipe()));
       if(recipe!=null){
         recipeList.add(recipe);
         setState(() {});
       }
        },child: Icon(Icons.add),),
    );
  }
}
class Recipe{
  final String title;
  final String description;
  final String ingredients;
  Recipe(
  {
    required this.title,
    required this.description,
    required this.ingredients
}
      );
}
