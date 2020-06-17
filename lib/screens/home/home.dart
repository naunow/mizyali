import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mizyaliapp/screens/home/widgets/plant_card.dart';

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
            children: <Widget>[
              PlantCard(imagePath: 'assets/images/cactus.jpg',),
              SizedBox(height: 26,),
              PlantCard(imagePath: 'assets/images/squareplant.jpg',),
              SizedBox(height: 26,),
              PlantCard(imagePath: 'assets/images/cactus.jpg',),
          ],),
        ),
      ),
    );
  }
}

