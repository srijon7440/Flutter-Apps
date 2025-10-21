import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

import '../widgets/app_bar_widget.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleController=TextEditingController();
  final TextEditingController _descriptionController=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBarTheme(),
      body: BackgroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32,),
                  Text("Add New Task",style: Theme.of(context).textTheme.titleLarge,),
                  SizedBox(height: 16,),
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: "title"
                    ),
                  ),
                  SizedBox(height: 8,),

                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: "description"
                    ),
                  ),
                  SizedBox(height: 16,),
                  FilledButton(onPressed: (){}, child: Text("Add"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _descriptionController.dispose();
    _titleController.dispose();
    super.dispose();
  }
}
