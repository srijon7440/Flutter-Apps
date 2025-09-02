import 'package:flutter/material.dart';
import 'package:untitled/home_screen.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  TextEditingController itemController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController ingredientsController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipee'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              controller: itemController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintText: 'Item',
                labelText: 'Item'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              controller: descriptionController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  hintText: 'Description',
                  labelText: 'Description'
              ),
            ),
          ),

          //ingredients
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: ingredientsController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  hintText: 'ingredients',
                  labelText: 'ingredients'
              ),
            ),
          ),

          ElevatedButton(onPressed: (){
            Recipe recipe=Recipe(title: itemController.text, description: descriptionController.text, ingredients: ingredientsController.text);
            Navigator.pop(context,recipe);
          }, child: Text('Save'))
        ],
      )),
    );
  }
}
