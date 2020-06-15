import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mizyaliapp/configs/AppShadows.dart';
import 'package:mizyaliapp/screens/calender/calender.dart';
import 'package:mizyaliapp/screens/home/home.dart';

//void main() {
//  debugPaintSizeEnabled = false;
//  runApp(MyApp());
//}
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.mPlusRounded1cTextTheme(
          Theme.of(context)
              .textTheme
              .copyWith(
            title: TextStyle(
              // tab bar
                fontSize: 20,
                letterSpacing: 8.0,
                shadows: AppShadows.font_shadow,
                fontWeight: FontWeight.w400),
            display1: TextStyle(
              // card plant name
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
            body1: TextStyle(
              // card description
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
            display2: TextStyle(
              // chart label
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            display3: TextStyle(
              // chart days
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            display4: TextStyle(
              // calender card
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            button: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              shadows: AppShadows.font_shadow,
            ),
          )
              .apply(
            bodyColor: AppColors.black,
            displayColor: AppColors.black,
          ),
        ),
        primarySwatch: Colors.cyan,
        primaryColor: AppColors.grey,
        scaffoldBackgroundColor: AppColors.grey,
      ),
      home: HomePath(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              elevation: 10,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  color: AppColors.black,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  color: AppColors.black,
                  onPressed: () {},
                ),
              ],
              bottom: TabBar(
                isScrollable: true,
                unselectedLabelStyle: TextStyle(fontSize: 8),
                labelStyle: TextStyle(
                    fontSize: 20,
                    letterSpacing: 8.0,
                    shadows: AppShadows.font_shadow,
                    fontWeight: FontWeight.w300),
                tabs: [
                  Tab(
                    text: 'HOME',
                  ),
                  Tab(
                    text: 'CALENDER',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Home(),
                Calender(),
              ],
            )));
  }
}


//class Home extends StatefulWidget {
//  @override
//  _HomeState createState() => _HomeState();
//}
//
//class _HomeState extends State<Home> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Center(
//            child: Text(
//              'Hello world',
//              style: TextStyle(shadows: AppShadows.font_shadow),
//            ),
//          ),
//          TextFormField(
//            decoration: InputDecoration(
//              filled: true,
//            ),
//          ),
//          Center(
//            child: Container(
//              height: 40,
//              width: 300,
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.all(Radius.circular(30)),
//                color: Colors.transparent,
//                boxShadow: AppShadows.push_shadow,
//              ),
//            ),
//          ),
//          Center(
//            child: Container(
//              height: 100,
//              width: 100,
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.all(Radius.circular(30)),
//                color: AppColors.grey,
//                boxShadow: AppShadows.pop_shadow,
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}
