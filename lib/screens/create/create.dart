import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(vertical: 36.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                width: 150,
                child: Placeholder(),
              ),
              SizedBox(height: 25),
              InputField(hintText: 'Name',),
              SizedBox(height: 25),
              InputField(hintText: 'Discription',),
              //InputField(hintText: 'Name', formKey: _formKey,),
              RaisedButton(
                color: AppColors.grey,

                // 送信ボタンクリック時の処理
                onPressed: () {
                  // バリデーションチェック
                  if (_formKey.currentState.validate()) {
                    // 各フォームのonSavedに記述した処理を実行
                    // このsave()を呼び出さないと、onSavedは実行されないので注意
                    _formKey.currentState.save();
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('更新しました。')));
                  }
                },
                child: Text('送信する'),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputField extends StatefulWidget {
  final String hintText;

  const InputField({Key key, this.hintText}) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(
        autofocus: false,
        obscureText: false,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: this.widget.hintText,
          labelText: this.widget.hintText,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
          validator: (value) =>
          value.isEmpty ? ('NG') : null
//                onSaved: (String value) {
//                  _loginData.password = value;
//                }
      ),
    );
  }
}
