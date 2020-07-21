class Plant {
  int id;
  String name;
  String memo;
  String startDate;
  String imagePath;

  Plant();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'memo': memo,
      'startDate': startDate,
      'imagePath': imagePath,
    };
    return map;
  }

  Plant.fromMap(Map<String,dynamic> map){
    id = map['id'];
    name = map['name'];
    memo = map['memo'];
    startDate = map['startDate'];
    imagePath = map['imagePath'];
  }

}
