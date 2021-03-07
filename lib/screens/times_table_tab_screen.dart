import 'package:flutter/material.dart';
import 'package:roulette_teacher/helper/bet_type.dart';
import 'package:roulette_teacher/widgets/times_table.dart';
import 'package:roulette_teacher/widgets/ddrawer.dart';

class TimesTableTabScreen extends StatefulWidget {
  static const routeName = 'TimesTableTabScreen';

  @override
  _TimesTableTabScreenState createState() => _TimesTableTabScreenState();
}

class _TimesTableTabScreenState extends State<TimesTableTabScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    TimesTable(
      bet: Straight(),
      key: Key('straight'),
    ),
    TimesTable(
      bet: Split(),
      key: Key('split'),
    ),
    TimesTable(
      bet: Corner(),
      key: Key('corner'),
    ),
    TimesTable(
      bet: Street(),
      key: Key('street'),
    ),
    TimesTable(
      bet: Line(),
      key: Key('line'),
    ),
    TimesTable(
      bet: Basket(),
      showTable2: true,
      key: Key('basket'),
    ),
  ];

  final List<String> titles = [
    'Straight Up',
    'Split',
    'Corner',
    'Street',
    'Line',
    'First Five',
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
        appBar: AppBar(
          elevation: 0,
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
        drawer: Ddrawer(),
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
              icon: Image.asset('assets/level_logos/straight.png',
                  height: 40, color: _currentIndex != 0 ? Colors.grey : null),
              label: 'Straight',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/level_logos/split.png',
                  height: 40, color: _currentIndex != 1 ? Colors.grey : null),
              label: 'Split',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/level_logos/corner.png',
                  height: 40, color: _currentIndex != 2 ? Colors.grey : null),
              label: 'Corner',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/level_logos/street.png',
                  height: 40, color: _currentIndex != 3 ? Colors.grey : null),
              label: 'Street',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/level_logos/line.png',
                  height: 40, color: _currentIndex != 4 ? Colors.grey : null),
              label: 'Line',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/level_logos/first five.png',
                  height: 40, color: _currentIndex != 5 ? Colors.grey : null),
              label: 'First Five',
            ),
          ],
        ),
      ),
    );
  }
}
