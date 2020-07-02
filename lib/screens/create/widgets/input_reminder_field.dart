import 'package:flutter/material.dart';

class InputReminderField extends StatefulWidget {
  final String hintText;

  const InputReminderField({Key key, this.hintText}) : super(key: key);

  @override
  _InputReminderFieldState createState() => _InputReminderFieldState();
}

class _InputReminderFieldState extends State<InputReminderField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: SizedBox(
              height: 90,
              child: TextFormField(
                  autofocus: false,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: this.widget.hintText,
                    labelText: this.widget.hintText,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                  validator: (value) => null
//                onSaved: (String value) {
//                  _loginData.password = value;
//                }
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 6,
            child: SizedBox(
              height: 90,
              child: TextFormField(
                  autofocus: false,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'every 5 days',
                    labelText: 'Cycle',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                  validator: (value) => null
//                onSaved: (String value) {
//                  _loginData.password = value;
//                }

              ),
            ),
          ),
        ],
      ),
    );
  }
}
