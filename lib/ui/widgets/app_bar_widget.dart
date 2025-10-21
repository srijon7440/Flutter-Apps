import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';

class TMAppBarTheme extends StatelessWidget implements PreferredSizeWidget{
  const TMAppBarTheme({
    super.key, this.fromUpdateProfile,
  });
  final bool? fromUpdateProfile;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.logout,color: Colors.white,))
      ],
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: (){
          if(fromUpdateProfile == true) {
            return;
          }
          Navigator.pushNamed(context, UpdateProfileScreen.name);
        },
        child: Row(
          spacing: 8,
          children: [
            CircleAvatar(
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Full Name',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                ),
                Text(
                  "gg.@gmail.com",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}