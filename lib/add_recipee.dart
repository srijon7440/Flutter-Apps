import 'package:flutter/material.dart';
import 'package:untitled/home_screen.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController itemController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController(); // comma-separated string

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: itemController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  hintText: 'Title',
                  labelText: 'Title',
                ),
              ),
            ),
            // Description
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  hintText: 'Description',
                  labelText: 'Description',
                ),
              ),
            ),
            // Ingredients
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: ingredientsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  hintText: 'Ingredients (comma separated)',
                  labelText: 'Ingredients',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                List<String> ingredientsList = ingredientsController.text
                    .split(',')
                    .map((e) => e.trim())
                    .toList();

                Recipe recipe = Recipe(
                  title: itemController.text,
                  description: descriptionController.text,
                  ingredients: ingredientsList,
                );
                Navigator.pop(context, recipe);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
