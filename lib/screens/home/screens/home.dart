import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/models/db_provider.dart';
import 'package:mizyaliapp/view_models/plant_info.dart';
import 'package:mizyaliapp/screens/home/widgets/plant_card.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ViewPlant> viewPlantList;
  List<ViewPlantCycle> viewPlantCycleList;
  DbProvider dbHelper;
  @override
  void initState() {
    super.initState();
    dbHelper = DbProvider();
    _getViewPlantCycleList().then((value) => _getViewPlantList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 26),
          itemCount: 4,
          itemBuilder: (context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: _getPlantCard(index),
            );
          }),
    );
  }

  Future<void> _getViewPlantList() async {
    await dbHelper.getPlants().then((plantList) => {
          plantList.forEach((plant) {
            ViewPlant viewPlant = ViewPlant()
              ..id = plant.id
              ..imagePath = plant.imagePath
              ..memo = plant.memo
              ..name = plant.name
              ..startDate = plant.startDate
              ..wateringCycleList =
                  viewPlantCycleList.where((e) => e.plantId == plant.id);
            viewPlantList.add(viewPlant);
          })
        });
  }

  Future<List<ViewPlantCycle>> _getWateringCycle({int plantId}) async {
    // var wateringCycleList = ([
    //   ViewPlantCycle()
    //     ..id = 1
    //     ..plantId = 1
    //     ..reminderTitle = 'Watering'
    //     ..reminderCycleDays = 5
    //     ..color = AppColors.blue,
    //   ViewPlantCycle()
    //     ..id = 2
    //     ..plantId = 1
    //     ..reminderTitle = 'Fertilize Soil'
    //     ..reminderCycleDays = 7
    //     ..color = AppColors.orange,
    //   ViewPlantCycle()
    //     ..id = 3
    //     ..plantId = 1
    //     ..reminderTitle = 'Cleaning'
    //     ..reminderCycleDays = 3
    //     ..color = AppColors.purple,
    //   ViewPlantCycle()
    //     ..id = 4
    //     ..plantId = 2
    //     ..reminderTitle = 'Trim Plant'
    //     ..reminderCycleDays = 10
    //     ..color = AppColors.blue,
    //   ViewPlantCycle()
    //     ..id = 5
    //     ..plantId = 2
    //     ..reminderTitle = 'Fertilizer'
    //     ..reminderCycleDays = 6
    //     ..color = AppColors.orange,
    // ]);

    // var searchedList =
    //     wateringCycleList.where((x) => x.plantId == plantId).toList();

    // return searchedList;
  }

  Future<void> _getViewPlantCycleList() async {
    await dbHelper.getCycles().then((cycleList) => {
          cycleList.forEach((cycle) {
            ViewPlantCycle viewPlantCycle = ViewPlantCycle()
              ..id = cycle.id
              ..plantId = cycle.plantId
              ..reminderCycleDays = cycle.reminderCycleDays
              ..reminderTitle = cycle.reminderTitle
              ..color = AppColors.blue;
            viewPlantCycleList.add(viewPlantCycle);
          })
        });
  }

  PlantCard _getPlantCard(int index) {
    //var plantInfo = _getTestPlantInfo(index);
    var plantInfo = viewPlantList[index];

    return PlantCard(
      plantInfo: plantInfo,
    );
  }
}

ViewPlant _getTestPlantInfo(int index) {
  // var plantList = ([
  //   ViewPlant()
  //     ..id = 1
  //     ..name = 'Atom'
  //     ..memo = 'This is a test memo.'
  //     ..startDate = '20200710'
  //     ..imagePath = 'assets/images/squareplant.jpg'
  //     ..wateringCycleList = _getWateringCycle(plantId: 1),
  //   ViewPlant()
  //     ..id = 2
  //     ..name = 'Takiyon'
  //     ..memo = 'My parents gave it to me on my birthday.'
  //     ..startDate = '20200214'
  //     ..imagePath = 'assets/images/cactus.jpg'
  //     ..wateringCycleList = _getWateringCycle(plantId: 2),
  //   ViewPlant()
  //     ..id = 3
  //     ..name = 'Strawberry'
  //     ..memo = 'hayaku tabetai!'
  //     ..startDate = '20191225'
  //     ..imagePath = 'assets/images/squareplant.jpg'
  //     ..wateringCycleList = _getWateringCycle(plantId: 1),
  //   ViewPlant()
  //     ..id = 4
  //     ..name = 'tomato'
  //     ..memo =
  //         'My parents gave it to me on my birthday. My parents gave it to me on my birthday. My parents gave it to me on my birthday.'
  //     ..startDate = '19900101'
  //     ..imagePath = 'assets/images/cactus.jpg'
  //     ..wateringCycleList = _getWateringCycle(plantId: 2),
  // ]);

  // return plantList[index];
  //return plantList;
}
