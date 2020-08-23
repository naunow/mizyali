import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/widgets/circle_clipper.dart';

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
        child: Container(
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
