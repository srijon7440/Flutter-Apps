import 'package:flutter/material.dart';

import 'Screens/home_screen.dart';

main(){
  runApp(OrderApp());
}
class OrderApp extends StatelessWidget {
  const OrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order',
      theme: ThemeData(
        colorSchemeSeed: Colors.purple.shade900
      ),
      home: HomeScreen(),
    );
  }
}
