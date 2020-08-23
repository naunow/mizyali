import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/view_models/plant_info.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'chart.dart';

class ChartArea extends StatelessWidget {
  final List<ViewPlantCycle> wateringCycleList;

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

_wateringCycleInfo(
    List<ViewPlantCycle> wateringCycleList, BuildContext context) {
  var size = MediaQuery.of(context).size;

  List<Widget> result = [];
  wateringCycleList.forEach((cycle) {
    result.addAll([
      Column(
        children: <Widget>[
          //Placeholder(fallbackHeight: 58, fallbackWidth: 58,),
          Container(
            width: size.width / 4,
            height: size.width / 4,
            color: AppColors.grey,
            child: CycleChart(
              _chartSeries(cycle),
              animate: false,
              cycle: cycle,
            ),
          ),
          Text(
            cycle.reminderTitle,
            style: Theme.of(context).textTheme.headline3,
          )
        ],
      ),
    ]);
  });

  return result;
}

List<charts.Series<ViewPlantCycle, int>> _chartSeries(ViewPlantCycle cycle) {
  var lastDate = DateTime.parse(cycle.lastDoneDay);
  var now = DateTime.now();
  var difference = now.difference(lastDate);

  var data = [
    ViewPlantCycle()
      ..reminderCycleDays = cycle.reminderCycleDays
      ..reminderTitle = 'title 2'
      ..color = AppColors.orange,
    ViewPlantCycle()
      ..reminderCycleDays = difference.inDays >= cycle.reminderCycleDays
          ? cycle.reminderCycleDays
          : difference.inDays
      ..reminderTitle = 'title 2'
      ..color = AppColors.dark_shadow
  ];

  var color = [
    AppColors.blue,
    AppColors.orange,
    AppColors.purple,
  ];

  var series = [
    charts.Series<ViewPlantCycle, int>(
      id: 'Watering',
      domainFn: (ViewPlantCycle cycle, _) => cycle.reminderCycleDays,
      measureFn: (ViewPlantCycle cycle, _) => cycle.reminderCycleDays,
      data: data,
      labelAccessorFn: (ViewPlantCycle cycle, _) => cycle.reminderTitle,
      displayName: 'display name',
      radiusPxFn: (ViewPlantCycle cycle, _) => 10,
      colorFn: (ViewPlantCycle cycle, _) =>
          charts.ColorUtil.fromDartColor(cycle.color),
    )
  ];

  return series;
}
