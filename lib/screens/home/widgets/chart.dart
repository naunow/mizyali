import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/models/plant_info.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CycleChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  CycleChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory CycleChart.withSampleData() {
    return new CycleChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          charts.PieChart(
              seriesList,
              animate: animate,
              defaultRenderer: charts.ArcRendererConfig(
                arcWidth: 20, arcRatio: 0.2,)),
          Center(
            child: Text(
              '7',
              style: TextStyle(
                fontSize: 30.0,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<WateringCycle, int>> _createSampleData() {
    final data = [
      WateringCycle()
        ..reminderCycleDays = 7
        ..reminderTitle = 'title 1'
        ..color = AppColors.blue,
      WateringCycle()
        ..reminderCycleDays = 2
        ..reminderTitle = 'title 2'
        ..color = AppColors.grey,
    ];
    return [
      charts.Series<WateringCycle, int>(
        id: 'Watering',
        domainFn: (WateringCycle cycle, _) => cycle.reminderCycleDays,
        measureFn: (WateringCycle cycle, _) => cycle.reminderCycleDays,
        data: data,
        labelAccessorFn: (WateringCycle cycle, _) => cycle.reminderTitle,
        displayName: 'display name',
        radiusPxFn: (WateringCycle cycle, _) => 10,
        colorFn: (WateringCycle cycle, _) => charts.ColorUtil.fromDartColor(cycle.color),
      )
    ];
  }
}