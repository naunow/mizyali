import 'package:flutter/cupertino.dart';
import 'package:mizyaliapp/models/cycle.dart';
import 'package:mizyaliapp/models/plant.dart';
import 'package:mizyaliapp/view_models/plant_info.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  static Database _db;

  // Database name
  static const String DATABASE_NAME = "mizyali.db";

  // Table names
  static const String TABLE_PLANT = "Plants";
  static const String TABLE_CYCLE = "Cycles";
  static const String TABLE_EVENT = "Events";

  // Common column names
  static const String KEY_ID = "id";

  // Plants Table - column names
  static const String KEY_NAME = "name";
  static const String KEY_MEMO = "memo";
  static const String KEY_STARTDATE = "startDate";
  static const String KEY_IMAGEPATH = "imagePath";

  // Cycles Table - column names
  static const String KEY_PLANTID = "plantId";
  static const String KEY_REMINDERTITLE = "reminderTitle";
  static const String KEY_REMINDERCYCLEDAYS = "reminderCycleDays";
  static const String KEY_COLOR = "color";
  static const String KEY_LASTDONEDAY = "lastDoneDay";

  // Table Create Statements
  // Plants table create statement
  static const String CREATE_TABLE_PLANT = """
  CREATE TABLE $TABLE_PLANT 
  (
    $KEY_ID INTEGER PRIMARY KEY,
    $KEY_NAME TEXT,
    $KEY_MEMO TEXT,
    $KEY_STARTDATE TEXT,
    $KEY_IMAGEPATH TEXT
  )""";

  // Cycles table create statement
  static const String CREATE_TABLE_CYCLE = """
  CREATE TABLE $TABLE_CYCLE
  (
    $KEY_ID INTEGER PRIMARY KEY,
    $KEY_PLANTID INTEGER,
    $KEY_REMINDERTITLE TEXT,
    $KEY_REMINDERCYCLEDAYS INTEGER,
    $KEY_COLOR TEXT,
    $KEY_LASTDONEDAY TEXT
  )
  """;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await init();
    return _db;
  }

  init() async {
    var documentDir = await getDatabasesPath();
    final path = join(documentDir, DATABASE_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(CREATE_TABLE_CYCLE).then((value) =>
        debugPrint("============CYCLE TABLE INSERTED=============="));
    await db.execute(CREATE_TABLE_PLANT).then((value) => {
          debugPrint("============PLANT TABLE INSERTED=============="),
          // insert initial sample data
          _insertSampleData(db).then((id) => {
                debugPrint(
                    "============SAMPLE DATA INSERTED id:$id=============="),
              })
        });
  }

  Future<int> _insertSampleData(Database db) async {
    Plant samplePlant = Plant()
      ..memo = "initial memo"
      ..name = "first name"
      ..startDate = DateTime(2020, 1, 1).toUtc().toString()
      ..imagePath = "assets/images/cactus.jpg";

    Cycle sampleCycle = Cycle()
      ..plantId = 1
      ..reminderCycleDays = 5
      ..reminderTitle = "watering"
      ..lastDoneDay = DateTime(2020, 8, 6).toUtc().toString();

    Cycle sampleCycle2 = Cycle()
      ..plantId = 1
      ..reminderCycleDays = 3
      ..reminderTitle = "cleaning"
      ..lastDoneDay = DateTime(2020, 8, 4).toUtc().toString();

    Cycle sampleCycle3 = Cycle()
      ..plantId = 1
      ..reminderCycleDays = 6
      ..reminderTitle = "test"
      ..lastDoneDay = DateTime(2020, 8, 1).toUtc().toString();

    db.insert(TABLE_PLANT, samplePlant.toMap());
    db.insert(TABLE_CYCLE, sampleCycle.toMap());
    db.insert(TABLE_CYCLE, sampleCycle2.toMap());

    return await db.insert(TABLE_CYCLE, sampleCycle3.toMap());
  }

  // =============================
  // Create
  // =============================

  Future<Plant> createPlant(Plant plant) async {
    var dbClient = await db;
    plant.id = await dbClient.insert(TABLE_PLANT, plant.toMap());
    return plant;
  }

  Future<Cycle> createCycle(Cycle cycle) async {
    var dbClient = await db;
    cycle.id = await dbClient.insert(TABLE_CYCLE, cycle.toMap());
    return cycle;
  }

  // =============================
  // Get
  // =============================
  Future<List<Plant>> getPlants() async {
    var dbClient = await db;
    var maps = await dbClient.query(TABLE_PLANT);
    List<Plant> list = [];
    maps.forEach((map) => list.add(Plant.fromMap(map)));
    return list;
  }

  Future<Plant> getPlant(int id) async {
    var dbClient = await db;
    var plant = await dbClient.query(TABLE_PLANT,
        where: "id = ?", whereArgs: [id], limit: 1);

    return Plant.fromMap(plant.first);
  }

  Future<List<Cycle>> getCycles() async {
    var dbClient = await db;
    var maps = await dbClient.query(TABLE_CYCLE);
    var list;
    maps.forEach((map) => list.add(Cycle.fromMap(map)));
    return list;
  }

  Future<Cycle> getCycle(int id) async {
    var dbClient = await db;
    var cycle = await dbClient.query(TABLE_CYCLE,
        where: "id = ?", whereArgs: [id], limit: 1);
    return Cycle.fromMap(cycle.first);
  }

  Future<List<ViewPlant>> getViewPlants() async {
    var dbClient = await db;
    var sql = """
      SELECT
        *
      FROM
        $TABLE_PLANT
    """;
    var viewPlant = await dbClient.rawQuery(sql);
    List<ViewPlant> viewPlantList = [];
    viewPlant.forEach((element) {
      viewPlantList.add(ViewPlant.fromMap(element));
    });

    var a = await dbClient.query(TABLE_CYCLE);
    List<ViewPlantCycle> viewPlantCycle = [];
    a.forEach((element) {
      viewPlantCycle.add(ViewPlantCycle.fromMap(element));
    });

    viewPlantList.forEach((element) {
      var cycle = viewPlantCycle.where((c) => c.plantId == element.id);
      element.wateringCycleList.addAll(cycle);
    });

    // var sql = """
    //   SELECT
    //     *
    //   FROM
    //     $TABLE_PLANT
    //   LEFT JOIN $TABLE_CYCLE ON
    //     $TABLE_PLANT.$KEY_ID = $TABLE_CYCLE.$KEY_PLANTID
    // """;

    // var viewPlantMap = await dbClient.rawQuery(sql);
    // List<ViewPlant> viewPlantList = [];
    // viewPlantMap.forEach((element) {
    //   var m = ViewPlant.fromMap(element);
    //   viewPlantList.add(m);
    // });
    // var a = viewPlantList.toListViewPlant();

    debugPrint(viewPlantList.toString());
    return viewPlantList;
  }

  // =============================
  // Update
  // =============================
  Future<Plant> updatePlant(Plant plant) async {
    var dbClient = await db;
    await dbClient.update(TABLE_PLANT, plant.toMap(),
        where: "id = ?", whereArgs: [plant.id]);
    return plant;
  }

  Future<Cycle> updateCycle(Cycle cycle) async {
    var dbClient = await db;
    await dbClient.update(TABLE_CYCLE, cycle.toMap(),
        where: "id = ?", whereArgs: [cycle.id]);
    return cycle;
  }

  // =============================
  // Delete
  // =============================
  deletePlant(Plant plant) async {
    var dbClient = await db;
    await dbClient.delete(TABLE_PLANT, where: "id = ?", whereArgs: [plant.id]);
  }

  deleteCycle(Cycle cycle) async {
    var dbClient = await db;
    await dbClient.delete(TABLE_CYCLE, where: "id = ?", whereArgs: [cycle.id]);
  }
}
