import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/login_screen.dart';
import 'package:task_manager/ui/screens/main_navigation_bar_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/screens/spash_screen.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            fixedSize: Size.fromWidth(double.maxFinite),
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(vertical: 12)
          )
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600
          )
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 17),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(borderSide: BorderSide.none)
        )
      ),
      initialRoute:SplashScreen.name ,
      routes: {
        SplashScreen.name:(_)=>SplashScreen(),
        LoginScreen.name:(_)=>LoginScreen(),
        SignUpScreen.name:(_)=>SignUpScreen(),
        MainNavigationBarScreen.name:(_)=>MainNavigationBarScreen(),
        UpdateProfileScreen.name:(_)=>UpdateProfileScreen(),
      }
    );
  }
}
