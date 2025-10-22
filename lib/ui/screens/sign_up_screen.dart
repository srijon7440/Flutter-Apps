import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/services/api_caller.dart';
import 'package:task_manager/ui/screens/login_screen.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';
import 'package:task_manager/ui/widgets/snackBarWidget.dart';

import '../../data/Urls/urlPost.dart';

class SignUpScreen extends StatefulWidget {
  static const String name='/signUp';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _firstNameController=TextEditingController();
  final TextEditingController _lastNameController=TextEditingController();
  final TextEditingController _mobileController=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  bool _signUpInProgress=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 82,),
                    Text(
                      'Join With Us',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'email',
                      ),
                      validator: (String? value){
                        String inputText=value ?? '';
                        if(EmailValidator.validate(inputText)==false){
                          return "Enter Valid Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12,),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty?? true){
                          return "Enter Your First Name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12,),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty?? true){
                          return "Enter Your Last Name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12,),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _mobileController,
                      decoration: InputDecoration(
                        hintText: 'Mobile',
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty?? true){
                          return "Enter Your Mobile Number";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12,),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: 'password'
                      ),
                      validator: (String? value){
                        if((value?.length ?? 0)<=6){
                          return "Password must be more than 6 Letters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    Center(
                        child:Column(
                          children: [
                            Visibility(
                              visible:_signUpInProgress==false,
                              replacement: Center(
                                child: CircularProgressIndicator(),
                              ),
                              child: FilledButton(onPressed: _onTapSubmit,
                                  child: Icon(Icons.arrow_circle_right_outlined)
                              ),
                            ),
                            SizedBox(height: 36,),
            
                            RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600
                                    ),
                                    text: "Have an account?",
                                    children: [
                                      TextSpan(
                                          text: " Sign in",
                                          style: TextStyle(color: Colors.green),
                                          recognizer: TapGestureRecognizer()..onTap=_tapSignIn
                                      )
                                    ]
                                ))
                          ],
                        )
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
  void _onTapSubmit(){
    if(_formKey.currentState!.validate()){
      //register
      _signUp();
    }
  }
  Future<void>_signUp()async{
    _signUpInProgress=true;
    setState(() {});
    Map<String, dynamic> jsonBody = {
      "email": _emailController.text.trim(),
      "firstName": _firstNameController.text.trim(),
      "lastName": _lastNameController.text.trim(),
      "mobile": _mobileController.text.trim(),
      "password": _passwordController.text
    };

    final ApiResponse response =await ApiCaller.postRequest(
        url:Urls.registerUrl,
      body: jsonBody
    );
    _signUpInProgress=false;
    setState(() {});
    if(response.isSuccess){
      _clearController();
      showSnackBarMessage(context, "Registration Success!! Please Login");
    }
    else{
      showSnackBarMessage(context, response.errorMessage!);
    }
  }
  void _clearController(){
    _emailController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _passwordController.clear();
  }
  void _tapSignIn(){
    Navigator.pop(context);
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
