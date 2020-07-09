import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mizyaliapp/configs/AppShadows.dart';
import 'package:mizyaliapp/configs/localized.dart';
import 'package:mizyaliapp/configs/my_localizations_delegate.dart';
import 'package:mizyaliapp/screens/calender/calender.dart';
import 'package:mizyaliapp/screens/create/create.dart';
import 'package:mizyaliapp/screens/home/home.dart';
import 'package:mizyaliapp/screens/settings/settings.dart';

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
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('ja'),
//        GlobalMaterialLocalizations.delegate,
//        GlobalWidgetsLocalizations.delegate,
      ],
      // default locale setting.
      locale: Locale('en'),
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
        length: _tabs().length,
        child: Scaffold(
            appBar: AppBar(
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
                    tabs: _tabs(),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: _tabBarViews(),
            ))
    );
  }


  List<Widget> _tabs() {
    return [
      Tab(text: 'CREATE',),
//      Tab(icon: Icon(Icons.add),),
//      Tab(text: Localized
//          .of(context)
//          .tabMenuHome),
//      Tab(text: Localized
//          .of(context)
//          .tabMenuCalender),
      Tab(text: 'HOME',),
      Tab(text: 'CALENDER',),
      Tab(text: 'SETTINGS',),
//      Tab(icon: Icon(Icons.settings),),
    ];
  }

  List<Widget> _tabBarViews() {
    return [
      Create(),
      Home(),
      Calender(),
      Settings(),
    ];
  }
}