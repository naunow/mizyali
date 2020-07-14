import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mizyaliapp/configs/AppShadows.dart';
import 'package:mizyaliapp/configs/localized.dart';
import 'package:mizyaliapp/configs/my_localizations_delegate.dart';
import 'file:///C:/Users/nauno/AndroidStudioProjects/mizyali_app/lib/screens/calender/screens/calender.dart';
import 'file:///C:/Users/nauno/AndroidStudioProjects/mizyali_app/lib/screens/create/screens/create.dart';
import 'file:///C:/Users/nauno/AndroidStudioProjects/mizyali_app/lib/screens/home/screens/home.dart';
import 'file:///C:/Users/nauno/AndroidStudioProjects/mizyali_app/lib/screens/settings/screens/settings.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const MyLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en','US'),
        const Locale('ja','JP'),
      ],
      //locale:Locale('ja', 'JP'),
      locale: Locale('en','US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.mPlusRounded1cTextTheme(
          Theme.of(context)
              .textTheme
              .copyWith(
            headline6: TextStyle(
              // tab bar
                fontSize: 20,
                letterSpacing: 8.0,
                shadows: AppShadows.font_shadow,
                fontWeight: FontWeight.w400),
            headline4: TextStyle(
              // card plant name
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
            bodyText2: TextStyle(
              // card description
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
            headline3: TextStyle(
              // chart label
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            headline2: TextStyle(
              // chart days
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            headline1: TextStyle(
              // calender card
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            button: TextStyle(
              fontSize: 18,
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
    );
  }
}

class HomePath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabs(context).length,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.add), color: AppColors.black, onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Create()));
              }),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.settings),
                  color: AppColors.black,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  },),
              ],
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TabBar(
                    isScrollable: true,
                    unselectedLabelStyle: TextStyle(fontSize: 8),
                    labelStyle: TextStyle(
                        fontSize: 20,
                        letterSpacing: 8.0,
                        shadows: AppShadows.font_shadow,
                        fontWeight: FontWeight.w300),
                    tabs: _tabs(context),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: _tabBarViews(),
            ))
    );
  }


  List<Widget> _tabs(BuildContext context) {
    return [
      Tab(text: Localized
          .of(context)
          .tabMenuHome),
      Tab(text: Localized
          .of(context)
          .tabMenuCalender),
    ];
  }

  List<Widget> _tabBarViews() {
    return [
      Home(),
      Calender(),
    ];
  }
}