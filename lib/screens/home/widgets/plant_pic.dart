import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';

class PlantPic extends StatefulWidget {
  @override
  _PlantPicState createState() => _PlantPicState();
}

class _PlantPicState extends State<PlantPic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 11),
      child: ClipPath(
        child: new Container(
          color: AppColors.light_shadow,
          width: 100.0,
          height: 100.0,
          child: Image.asset('assets/images/cactus.jpg'),
        ),
        clipper: CircleClipper(),
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
    ..addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2),
    radius: size.width * 0.45),);

  }

  @override
  bool shouldReclip(CircleClipper oldClipper) => false;
}