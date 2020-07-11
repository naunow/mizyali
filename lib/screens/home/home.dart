import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/models/plant_info.dart';
import 'package:mizyaliapp/screens/home/widgets/plant_card.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(vertical :36.0),
        child: Center(
          child: Column(
            children:
              _getPlantCard(),
          ),
        ),
      ),
    );
  }
}

_getPlantCard(){
  var plantCardList = _getTestPlantInfo();

  List<Widget> plantCard = [];
  plantCardList.forEach((plantInfo) {
    plantCard.addAll([
      PlantCard(plantInfo: plantInfo),
      SizedBox(height: 26),
    ]);
  });

  return plantCard;
}

List<Plant> _getTestPlantInfo(){
  var plantList = ([
    Plant()
      ..id = 1
      ..name = 'Atom'
      ..memo = 'This is a test memo.'
      ..startDate = '20200710'
      ..imagePath = 'assets/images/squareplant.jpg'
      ..wateringCycleList = _getWateringCycle(plantId: 1),
    Plant()
      ..id = 2
      ..name = 'Takiyon'
      ..memo = 'My parents gave it to me on my birthday.'
      ..startDate = '20200214'
      ..imagePath = 'assets/images/cactus.jpg'
      ..wateringCycleList = _getWateringCycle(plantId: 2),
    Plant()
      ..id = 3
      ..name = 'Strawberry'
      ..memo = 'hayaku tabetai!'
      ..startDate = '20191225'
      ..imagePath = 'assets/images/squareplant.jpg'
      ..wateringCycleList = _getWateringCycle(plantId: 1),
    Plant()
      ..id = 4
      ..name = 'tomato'
      ..memo = 'My parents gave it to me on my birthday. My parents gave it to me on my birthday. My parents gave it to me on my birthday.'
      ..startDate = '19900101'
      ..imagePath = 'assets/images/cactus.jpg'
      ..wateringCycleList = _getWateringCycle(plantId: 2),
  ]);

  return plantList;
}

List<WateringCycle> _getWateringCycle({int plantId}) {
  var wateringCycleList = ([
    WateringCycle()
      ..id = 1
      ..plantId = 1
      ..reminderTitle = 'Watering'
      ..reminderCycleDays = 5
      ..color = AppColors.blue,
    WateringCycle()
      ..id = 2
      ..plantId = 1
      ..reminderTitle = 'Fertilize Soil'
      ..reminderCycleDays = 7
      ..color = AppColors.orange,
    WateringCycle()
      ..id = 3
      ..plantId = 1
      ..reminderTitle = 'Cleaning'
      ..reminderCycleDays = 3
      ..color = AppColors.purple,
    WateringCycle()
      ..id = 4
      ..plantId = 2
      ..reminderTitle = 'Trim Plant'
      ..reminderCycleDays = 10
      ..color = AppColors.blue,
    WateringCycle()
      ..id = 5
      ..plantId = 2
      ..reminderTitle = 'Fertilizer'
      ..reminderCycleDays = 6
      ..color = AppColors.orange,
  ]);

  var searchedList = wateringCycleList.where((x) => x.plantId == plantId).toList();

  return searchedList;
}