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
  List<ViewPlantCycle> viewPlantCycleList;
  DbProvider dbHelper;
  @override
  void initState() {
    super.initState();
    dbHelper = DbProvider();
    // _getViewPlantCycleList().then((value) => _getViewPlantList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 26),
          itemCount: 1,
          itemBuilder: (context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: FutureBuilder(
                future: _getViewPlantList(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<ViewPlant>> snapshot) {
                  if (snapshot.hasData) {
                    return PlantCard(plantInfo: snapshot.data[index]);
                  } else {
                    return Text("no data.");
                  }
                },
              ),
            );
          }),
    );
  }

  Future<List<ViewPlant>> _getViewPlantList() async {
    List<ViewPlant> viewPlantList = [];
    return await dbHelper.getViewPlants();

    // await dbHelper.getPlants().then((plantList) => {
    //       plantList.forEach((plant) {
    //         ViewPlant viewPlant = ViewPlant()
    //           ..id = plant.id
    //           ..imagePath = plant.imagePath
    //           ..memo = plant.memo
    //           ..name = plant.name
    //           ..startDate = plant.startDate;

    //         // ..wateringCycleList = [];
    //         // viewPlantCycleList.where((e) => e.plantId == plant.id);
    //         viewPlantList.add(viewPlant);
    //       })
    //     });
    // return viewPlantList;
  }
}
