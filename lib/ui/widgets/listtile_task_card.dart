import 'package:flutter/material.dart';

class ListileTaskCard extends StatelessWidget {
  const ListileTaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      title: Text("Title",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("description",style: TextStyle(color: Colors.grey),),
          Text("Date: 12/2/4",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
          Row(
            children: [
              Chip(
                label: Text("New"),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(
                    color: Colors.white
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
              IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
            ],
          )
        ],
      ),
    );
  }
}