import 'package:flutter/material.dart';
import 'package:roulette_teacher/helper/level_manager.dart';
import 'package:roulette_teacher/screens/level.dart';
import 'package:roulette_teacher/widgets/ddrawer.dart';

class LevelTabScreen extends StatefulWidget {
  static const routeName = 'LevelTabScreen';

  @override
  _LevelTabScreenState createState() => _LevelTabScreenState();
}

class _LevelTabScreenState extends State<LevelTabScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Level(lvlDiff: LevelDifficulity.beginner, key: Key('beginner')),
    // Level(lvlDiff: LevelDifficulity.intermediate, key: Key('intermediate')),
    Level(lvlDiff: LevelDifficulity.advanced, key: Key('advanced')),
    Level(lvlDiff: LevelDifficulity.master, key: Key('master')),
  ];

  final List<String> titles = [
    'Beginner',
//    'Intermediate',
    'Advanced',
    'Master',
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          setState(() {
            _currentIndex = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        drawer: Ddrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            titles[_currentIndex],
            style: TextStyle(
              //fontSize: 30,
              fontFamily: 'Rubik',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/level_logos/beginner.png',
                  height: 40, color: _currentIndex != 0 ? Colors.grey : null),
              label: 'Beginner',
            ),
            // BottomNavigationBarItem(
            //   icon: Image.asset('assets/level_logos/intermediate.png',
            //       height: 40, color: _currentIndex != 1 ? Colors.grey : null),
            //   title: Text('Intermediate'),
            // ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/level_logos/advanced.png',
                  height: 40, color: _currentIndex != 2 ? Colors.grey : null),
              label: 'Advanced',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/level_logos/master.png',
                  height: 40, color: _currentIndex != 3 ? Colors.grey : null),
              label: 'Master',
            ),
          ],
        ),
      ),
    );
  }
}
