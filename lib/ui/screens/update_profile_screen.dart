import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager/ui/widgets/app_bar_widget.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

import '../widgets/photo_tap_widget.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});
  static const String name='/UpdateProfile';


  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _firstNameController=TextEditingController();
  final TextEditingController _lastNameController=TextEditingController();
  final TextEditingController _mobileController=TextEditingController();
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  final ImagePicker _imagePicker=ImagePicker();
   XFile? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBarTheme(
        fromUpdateProfile: true,
      ),
      body: BackgroundWidget(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50,),
                Text(
                  "Update Profile",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 30,),
                //Photo flicker field
                PhotoTap(onTap: _pickImage,
                  selectedPhoto: selectedImage,
                ),

                const SizedBox(height: 30,),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Name",
                  ),
                ),
                const SizedBox(height: 8,),

                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    hintText: "Name",
                  ),
                ),
                const SizedBox(height: 8,),

                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    hintText: "Name",
                  ),
                ),
                const SizedBox(height: 8,),

                TextFormField(
                  controller: _mobileController,
                  decoration: InputDecoration(
                    hintText: "Name",
                  ),
                ),
                const SizedBox(height: 8,),

                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: "Name",
                  ),
                ),
                const SizedBox(height: 20,),

                FilledButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined))
              ],
                  ),
          )),
    );
  }
  Future<void> _pickImage() async {
    XFile? pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage;
      });
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    super.dispose();

  }
}

