import 'package:flutter/material.dart';

class PlantInfo extends StatefulWidget {
  @override
  _PlantInfoState createState() => _PlantInfoState();
}

class _PlantInfoState extends State<PlantInfo> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text('Atom', style: textTheme.display1,),
          Text('1234 days', style: textTheme.body1,),
          SizedBox(height: 14,),
          Text('My parents gave it to me on my birthday.', style: textTheme.body1,),
          SizedBox(height: 7,),
        ],),
    );
  }
}