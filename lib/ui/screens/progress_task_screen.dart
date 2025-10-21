import 'package:flutter/material.dart';

import '../widgets/listtile_task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded
              (
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context,index){
                  return ListileTaskCard();
            },
                separatorBuilder: (context,index){
                  return SizedBox(height: 8,);
            }
              )
            ),
          ],
        ),
      ),
    );
  }
}




