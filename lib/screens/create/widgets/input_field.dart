import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';

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
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            validator: (value) =>
            value.isEmpty ? ('The ${this.widget.hintText} is required.') : null
//                onSaved: (String value) {
//                  _loginData.password = value;
//                }
        ),
      ),
    );
  }
}
