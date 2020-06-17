import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';


class PlantPic extends StatelessWidget {
  final String imagePath;

  const PlantPic({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
//      CircleAvatar(backgroundColor: AppColors.black,
//        radius: 50,
//        backgroundImage: AssetImage('assets/images/cactus.jpg'),
//        foregroundColor: Colors.orange);

      Container(
      margin: EdgeInsets.only(right: 11),
      child: ClipPath(
        child: new Container(
          color: AppColors.light_shadow,
          width: 100.0,
          height: 100.0,
          child: Image.asset(imagePath),
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