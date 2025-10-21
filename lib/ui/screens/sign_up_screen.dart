import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/login_screen.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
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
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'email',
                      ),
                    ),
                    SizedBox(height: 12,),
                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                      ),
                    ),
                    SizedBox(height: 12,),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                      ),
                    ),
                    SizedBox(height: 12,),
                    TextFormField(
                      controller: _mobileController,
                      decoration: InputDecoration(
                        hintText: 'Mobile',
                      ),
                    ),
                    SizedBox(height: 12,),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: 'password'
                      ),
                    ),
                    SizedBox(height: 10,),
                    Center(
                        child:Column(
                          children: [
                            FilledButton(onPressed: (){},
                                child: Icon(Icons.arrow_circle_right_outlined)),
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
