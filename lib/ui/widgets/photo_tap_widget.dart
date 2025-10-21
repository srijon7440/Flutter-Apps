import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoTap extends StatelessWidget {
  final VoidCallback onTap;
  final XFile? selectedPhoto;
  const PhotoTap({
    super.key,
    required this.onTap, this.selectedPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          spacing: 8,
          children: [
            Container(
              height:50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              alignment: Alignment.center,
              child: Text("Photo",style: TextStyle(color: Colors.white),),
            ),
            Expanded(child: Text(
                selectedPhoto == null ? "No Photo Selected" :selectedPhoto!.name,
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis
              ),
            ))
          ],
        ),
      ),
    );
  }
}
