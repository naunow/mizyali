import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/configs/AppShadows.dart';
import 'package:mizyaliapp/screens/home/widgets/plant_info.dart';
import 'package:mizyaliapp/screens/home/widgets/plant_pic.dart';
import 'package:mizyaliapp/screens/home/widgets/chart_area.dart';

class PlantCard extends StatefulWidget {
  @override
  _PlantCardState createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(14),
      width: size.width * .85,
      //height: 300,
      decoration: BoxDecoration(
        boxShadow: AppShadows.pop_shadow,
        color: AppColors.grey,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              PlantPic(),
              PlantInfo(),
            ],
          ),
          ChartArea(),
        ],
      ),
    );
  }
}