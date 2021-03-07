import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:roulette_teacher/screens/calculator.dart';
import 'package:roulette_teacher/screens/home.dart';
import 'package:roulette_teacher/screens/level.dart';
import 'package:roulette_teacher/screens/picure_bets_screen.dart';
import 'package:roulette_teacher/screens/times_table_tab_screen.dart';
import 'package:roulette_teacher/screens/tutorial.dart';

import 'screens/dealers_guild.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Rubik',
          primaryColor: Color.fromARGB(255, 181, 39, 52)),
      initialRoute: '/',
      routes: {
        Home.routeName: (ctx) => Home(),
        Calculator.routeName: (ctx) => Calculator(),
        DealersGuild.routeName: (ctx) => DealersGuild(),
        TimesTableTabScreen.routeName: (ctx) => TimesTableTabScreen(),
        PictureBetsScreen.routeName: (ctx) => PictureBetsScreen(),
        Tutorial.routeName: (ctx) => Tutorial(),
        Level.routeName: (ctx) => Level(),
      },
    );
  }
}
