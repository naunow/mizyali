import 'package:flutter/material.dart';
import 'package:mizyaliapp/models/plant_info.dart';

class PlantInfoDisplay extends StatelessWidget {
  final Plant plantInfo;

  PlantInfoDisplay({Key key, this.plantInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme
        .of(context)
        .textTheme;
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(plantInfo.name, style: textTheme.headline4,),
          Text(_elapsedDays(plantInfo.startDate), style: textTheme.bodyText2,),
          SizedBox(height: 14,),
          Text(plantInfo.memo,
            style: textTheme.bodyText2,),
          SizedBox(height: 7,),
        ],),
    );
  }
}

_elapsedDays(String startDateStr){
  var startDate = DateTime.parse(startDateStr);
  var now = DateTime.now();

  var elapsedDays = now.difference(startDate).inDays;

  return '$elapsedDays days';
}