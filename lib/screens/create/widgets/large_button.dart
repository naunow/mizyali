import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/configs/AppShadows.dart';
import 'package:mizyaliapp/models/cycle.dart';
import 'package:mizyaliapp/models/db_provider.dart';
import 'package:mizyaliapp/models/plant.dart';

class LargeButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String text;
  final Color color;
  final Color fontColor;
  final Plant plant;
  final List<Cycle> cycleList;

  const LargeButton(
      {Key key,
      this.text,
      this.color,
      this.fontColor,
      this.formKey,
      this.plant,
      this.cycleList})
      : super(key: key);

  @override
  _LargeButtonState createState() => _LargeButtonState();
}

class _LargeButtonState extends State<LargeButton> {
  DbProvider dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 266.0,
        height: 40.0,
        decoration: BoxDecoration(
            color: widget.color,
            boxShadow: AppShadows.pop_shadow,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: FlatButton(
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          // 送信ボタンクリック時の処理
          onPressed: () {
            // バリデーションチェック
            if (widget.formKey.currentState.validate()) {
              // 各フォームのonSavedに記述した処理を実行
              // このsave()を呼び出さないと、onSavedは実行されないので注意
              widget.formKey.currentState.save();

              insertPlant(this.widget.plant, this.widget.cycleList);
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('更新しました。')));
            }
          },
          child: Container(
              child: Center(
                  child: Text(
            widget.text,
            style: Theme.of(context)
                .textTheme
                .button
                .apply(color: widget.fontColor),
          ))),
        ));
  }

  void insertPlant(Plant plant, List<Cycle> cycleList) async {
    debugPrint("=========SAVE NAME:${plant.name}=========");
    debugPrint("=========SAVE MEMO:${plant.memo}=========");
    debugPrint("=========SAVE PATH:${plant.imagePath}=========");
    cycleList.forEach((element) {
      debugPrint(
          "DAYS:${element.reminderCycleDays}/TITLE:${element.reminderTitle}");
    });

    plant.startDate = DateTime.now().toUtc().toString();
    await dbHelper.createPlant(plant).then((value) => {
          debugPrint("INSERTED PLANT ID:${value.id}"),
          cycleList.forEach((cy) {
            cy.plantId = value.id;
            cy.color = "purple";

            dbHelper
                .createCycle(cy)
                .then((value) => debugPrint("INSERTED CYCLE ID:${value.id}"));
          })
        });
  }
}
