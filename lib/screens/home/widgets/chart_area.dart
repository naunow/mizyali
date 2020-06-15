import 'package:flutter/material.dart';

class ChartArea extends StatefulWidget {
  @override
  _ChartAreaState createState() => _ChartAreaState();
}

class _ChartAreaState extends State<ChartArea> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(children: <Widget>[
          Placeholder(fallbackHeight: 58, fallbackWidth: 58,),
          Text('Water', style: textTheme.display2,)
        ],),
        Column(children: <Widget>[
          Placeholder(fallbackHeight: 58, fallbackWidth: 58,),
          Text('Fertiliser', style: textTheme.display2,)
        ],),
        Column(children: <Widget>[
          Placeholder(fallbackHeight: 58, fallbackWidth: 58,),
          Text('Cleaning', style: textTheme.display2,)
        ],),
      ],);
  }
}