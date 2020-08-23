import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ViewPlant {
  int id;
  String memo;
  String name;
  String startDate;
  String imagePath;
  // int plantId;
  // String reminderTitle;
  // int reminderCycleDays;
  // String color;
  // String lastDoneDay;
  List<ViewPlantCycle> wateringCycleList = [];

  ViewPlant();

  ViewPlant.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    memo = map['memo'];
    name = map['name'];
    startDate = map['startDate'];
    imagePath = map['imagePath'];
    // plantId = map['plantId'];
    // reminderTitle = map['reminderTitle'];
    // reminderCycleDays = map['reminderCycleDays'];
    // color = map['color'];
    // lastDoneDay = map['lastDoneDay'];
  }
}

class ViewPlantCycle {
  int id;
  int plantId;
  String reminderTitle;
  int reminderCycleDays;
  String lastDoneDay;
  Color color;

  ViewPlantCycle();

  ViewPlantCycle.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    plantId = map['plantId'];
    reminderTitle = map['reminderTitle'];
    reminderCycleDays = map['reminderCycleDays'];
    lastDoneDay = map['lastDoneDay'];
  }
}
