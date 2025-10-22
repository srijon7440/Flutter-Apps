import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/main_navigation_bar_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String name='/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  bool _loginInProgress = false;
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
                      'Get Started With',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
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
                            FilledButton(onPressed: _enterArrowLogin,
                                child: Icon(Icons.arrow_circle_right_outlined)),
                            SizedBox(height: 36,),
                            TextButton(onPressed: _tapForgotPassword, child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                            )),
                            RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600
                                    ),
                                    text: "Don't have an account?",
                                    children: [
                                      TextSpan(
                                          text: " Sign up",
                                          style: TextStyle(color: Colors.green),
                                          recognizer: TapGestureRecognizer()..onTap=_tapSignUp
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
  void _enterArrowLogin(){
    Navigator.pushNamedAndRemoveUntil(context, MainNavigationBarScreen.name,
          (predicate)=>false,
    );

  }
  void _tapForgotPassword(){
    Navigator.push(context, MaterialPageRoute(builder: (_)=>ForgotPasswordVerifyEmailScreen()));
  }
  void _tapSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpScreen()));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();

  }
}