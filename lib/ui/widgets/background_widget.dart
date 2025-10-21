import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../util/image_paths.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          ImagePath.ImgBackground,
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.cover
        ),
        SafeArea(child: child)
      ],
    );
  }
}
