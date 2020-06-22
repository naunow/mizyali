import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/models/plant_info.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'chart.dart';

class ChartArea extends StatelessWidget {
  final List<WateringCycle> wateringCycleList;

  const ChartArea({Key key, this.wateringCycleList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _wateringCycleInfo(wateringCycleList, context),
      );
  }
}

_wateringCycleInfo(List<WateringCycle> wateringCycleList, BuildContext context){
  var size = MediaQuery.of(context).size;

  List<Widget> result = [];
  wateringCycleList.forEach((cycle) {
    result.addAll([
      Column(children: <Widget>[
        //Placeholder(fallbackHeight: 58, fallbackWidth: 58,),
        Container(width: size.width / 4,
          height: size.width / 4,
          color: AppColors.grey,
          child: CycleChart.withSampleData(),),
        Text(cycle.reminderTitle, style: Theme.of(context).textTheme.headline3,)
      ],),
    ]);
  });

  return result;
}

List<charts.Series<WateringCycle, int>> _chartSeries(WateringCycle cycle){
  var data = [
    WateringCycle()
      ..reminderCycleDays = 8
      ..reminderTitle = 'title 2'
      ..color = AppColors.orange,
    WateringCycle()
    ..reminderCycleDays = 2
    ..reminderTitle = 'title 2'
    ..color = AppColors.grey,
  ];

  var series = [charts.Series<WateringCycle, int>(
    id: 'Watering',
    domainFn: (WateringCycle cycle, _) => cycle.reminderCycleDays,
    measureFn: (WateringCycle cycle, _) => cycle.reminderCycleDays,
    data: data,
    labelAccessorFn: (WateringCycle cycle, _) => cycle.reminderTitle,
    displayName: 'display name',
    radiusPxFn: (WateringCycle cycle, _) => 10,
    colorFn: (WateringCycle cycle, _) => charts.ColorUtil.fromDartColor(cycle.color),
  )];

  return series;
}
