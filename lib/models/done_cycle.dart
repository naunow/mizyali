import 'package:mizyaliapp/configs/AppColors.dart';

class DoneCycle {
  final name;
  final color;

  DoneCycle({this.name, this.color});

  static withSampleData1(){
    List<DoneCycle> list = [];
    list.add(DoneCycle(name: 'Watering', color: AppColors.blue));
    list.add(DoneCycle(name: 'Cleaning', color: AppColors.orange));
    list.add(DoneCycle(name: 'Trim', color: AppColors.purple));

    return list;
  }

  static withSampleData2(){
    List<DoneCycle> list = [];
    list.add(DoneCycle(name: 'Watering', color: AppColors.blue));
    list.add(DoneCycle(name: 'Cleaning', color: AppColors.orange));

    return list;
  }
}