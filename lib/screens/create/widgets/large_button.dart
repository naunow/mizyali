import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/configs/AppShadows.dart';

class LargeButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String text;
  final Color color;
  final Color fontColor;

  const LargeButton({Key key, this.text, this.color, this.fontColor, this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 266.0,
        height: 40.0,
        decoration: BoxDecoration(
            color: color,
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
            if (formKey.currentState.validate()) {
              // 各フォームのonSavedに記述した処理を実行
              // このsave()を呼び出さないと、onSavedは実行されないので注意
              formKey.currentState.save();
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('更新しました。')));
            }
          },
          child: Container(
              child: Center(
                  child: Text(
            text,
            style: Theme.of(context).textTheme.button.apply(color: fontColor),
          ))),
        ));
  }
}
