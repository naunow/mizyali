import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/widgets/circle_clipper.dart';

class ClipImageRounded extends StatelessWidget {
  final String path;
  final Function onTap;
  final double height;
  final double width;

  const ClipImageRounded(
      {Key key, this.path, this.onTap, this.height = 150, this.width = 150})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CircleClipper(),
      child: Container(
        height: height,
        width: width,
        color: AppColors.light_shadow,
        child: GestureDetector(
          onTap: onTap,
          child: Image.asset(path),
        ),
      ),
    );
  }
}