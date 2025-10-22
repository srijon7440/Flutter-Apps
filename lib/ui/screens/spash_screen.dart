import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/ui/screens/login_screen.dart';
import 'package:task_manager/ui/util/image_paths.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class SplashScreen extends StatefulWidget {
  static const String name='/SplashScreen';


  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveNextScreen();
  }
  Future<void>_moveNextScreen()async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(
        context, LoginScreen.name);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
          child: Center(
            child: SvgPicture.asset(ImagePath.ImgLogo,height: 80,),
          )
      ),
    );
  }
}
