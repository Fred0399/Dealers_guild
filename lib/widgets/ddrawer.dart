import 'package:flutter/material.dart';

import 'package:roulette_teacher/helper/level_manager.dart';
import 'package:roulette_teacher/screens/calculator.dart';
import 'package:roulette_teacher/screens/dealers_guild.dart';
import 'package:roulette_teacher/screens/home.dart';
import 'package:roulette_teacher/screens/picure_bets_screen.dart';
import 'package:roulette_teacher/screens/tutorial.dart';
import 'package:roulette_teacher/screens/level.dart';

import 'package:roulette_teacher/screens/times_table_tab_screen.dart';

import 'drawer_tile.dart';

class Ddrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 1.5),
        //color: Theme.of(context).primaryColor,

        borderRadius: BorderRadius.only(
          topRight: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
        child: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border(
                      top: BorderSide(width: 0),
                      bottom: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                  child: Image.asset(
                    'assets/logo.png',
                    alignment: Alignment.center,
                    //  height: 100,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      DrawerTile(
                        imagePath: 'home.png',
                        tileTitle: "Home",
                        routeName: Home.routeName,
                        ctx: context,
                      ),

                      DrawerTile(
                        imagePath: 'bets.png',
                        tileTitle: "Bets",
                        routeName: TimesTableTabScreen.routeName,
                        ctx: context,
                      ),

                      // DrawerTile(
                      //   tileTitle: "Levels",
                      //   routeName: LevelTabScreen.routeName,
                      //   ctx: context,
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      DrawerTile(
                        imagePath: 'album.png',
                        tileTitle: "Picture Bets",
                        routeName: PictureBetsScreen.routeName,
                        ctx: context,
                      ),

                      DrawerTile<LevelDifficulity>(
                        imagePath: 'beginner.png',
                        tileTitle: "Beginner",
                        routeName: Level.routeName,
                        ctx: context,
                        arg: LevelDifficulity.beginner,
                      ),

                      // DrawerTile<LevelDifficulity>(
                      //   imagePath: 'intermediate.png',
                      //   tileTitle: "Intermediate",
                      //   routeName: Level.routeName,
                      //   ctx: context,
                      //   arg: LevelDifficulity.intermediate,
                      // ),

                      DrawerTile<LevelDifficulity>(
                        imagePath: 'advanced.png',
                        tileTitle: "Advanced",
                        routeName: Level.routeName,
                        ctx: context,
                        arg: LevelDifficulity.advanced,
                      ),

                      DrawerTile<LevelDifficulity>(
                        imagePath: 'master.png',
                        tileTitle: "Master",
                        routeName: Level.routeName,
                        ctx: context,
                        arg: LevelDifficulity.master,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Theme.of(context).primaryColor,
                  thickness: 1.5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: ListTile(
                    title: Text(
                      'Calculator',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        Calculator.routeName,
                        (route) {
                          return route.settings.name == '/' &&
                              Calculator.routeName != '/';
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: ListTile(
                    title: Text(
                      'Tutorial',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        Tutorial.routeName,
                        (route) {
                          return route.settings.name == '/' &&
                              Tutorial.routeName != '/';
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: ListTile(
                    title: Text(
                      'Dealers Guild',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        DealersGuild.routeName,
                        (route) {
                          return route.settings.name == '/' &&
                              DealersGuild.routeName != '/';
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
