import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/new_task_screen.dart';
import 'package:task_manager/ui/screens/progress_task_screen.dart';

import '../widgets/app_bar_widget.dart';
class MainNavigationBarScreen extends StatefulWidget {
  const MainNavigationBarScreen({super.key});
  static const String name='/MainNavigator';

  @override
  State<MainNavigationBarScreen> createState() => _MainNavigationBarScreenState();
}

class _MainNavigationBarScreenState extends State<MainNavigationBarScreen> {
  final List<Widget>_screens=[
    NewTaskScreen(),
    ProgressTaskScreen(),
    ProgressTaskScreen(),
    ProgressTaskScreen(),
  ];
   int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBarTheme(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index){
          _selectedIndex=index;
          setState(() {

          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.new_label), label: 'New'),
          NavigationDestination(icon: Icon(Icons.refresh), label: "Progress"),
          NavigationDestination(icon: Icon(Icons.close), label: "Cancel"),
          NavigationDestination(icon: Icon(Icons.done), label: "Complete"),
        ],
      ),
    );
  }
}


