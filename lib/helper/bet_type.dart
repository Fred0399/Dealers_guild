import 'package:flutter/cupertino.dart';

class StraightPos {
  static const Map<String, double> cell_1 = {'left': (8 / 3), 'top': 6};
  static const Map<String, double> cell_2 = {'left': (8 / 5), 'top': 6};
  static const Map<String, double> cell_3 = {'left': (8 / 7), 'top': 6};
  static const Map<String, double> cell_4 = {'left': (8 / 3), 'top': 2};
  static const Map<String, double> cell_5 = {'left': (8 / 5), 'top': 2};
  static const Map<String, double> cell_6 = {'left': (8 / 7), 'top': 2};
  static const Map<String, double> cell_7 = {'left': (8 / 3), 'top': (6 / 5)};
  static const Map<String, double> cell_8 = {'left': (8 / 5), 'top': (6 / 5)};
  static const Map<String, double> cell_9 = {'left': (8 / 7), 'top': (6 / 5)};
}

class SplitPos {
  static const Map<String, double> cell_12 = {'left': 2, 'top': 6};
  static const Map<String, double> cell_14 = {'left': (8 / 3), 'top': 3};
  static const Map<String, double> cell_23 = {'left': (4 / 3), 'top': 6};
  static const Map<String, double> cell_25 = {'left': (8 / 5), 'top': 3};
  static const Map<String, double> cell_36 = {'left': (8 / 7), 'top': 3};
  static const Map<String, double> cell_45 = {'left': 2, 'top': 2};
  static const Map<String, double> cell_47 = {'left': (8 / 3), 'top': (3 / 2)};
  static const Map<String, double> cell_56 = {'left': (4 / 3), 'top': 2};
  static const Map<String, double> cell_58 = {'left': (8 / 5), 'top': (3 / 2)};
  static const Map<String, double> cell_69 = {'left': (8 / 7), 'top': (3 / 2)};
  static const Map<String, double> cell_78 = {'left': 2, 'top': (6 / 5)};
  static const Map<String, double> cell_89 = {'left': (4 / 3), 'top': (6 / 5)};
}

class CornerPos {
  static const Map<String, double> cell_1245 = {'left': 2, 'top': 3};
  static const Map<String, double> cell_2356 = {'left': (4 / 3), 'top': 3};
  static const Map<String, double> cell_4578 = {'left': 2, 'top': (3 / 2)};
  static const Map<String, double> cell_5689 = {
    'left': (4 / 3),
    'top': (3 / 2)
  };
}

class StreetPos {
  static const Map<String, double> cell_1 = {'left': 4, 'top': 6};
  static const Map<String, double> cell_4 = {'left': 4, 'top': 2};
  static const Map<String, double> cell_7 = {'left': 4, 'top': (6 / 5)};
}

class LinePos {
  static const Map<String, double> cell_14 = {'left': 4, 'top': 3};
  static const Map<String, double> cell_47 = {'left': 4, 'top': (3 / 2)};
}

class SpecialPos {
  static const Map<String, double> cell_02 = {'left': (16 / 9), 'top': 3};
  static const Map<String, double> cell_002 = {'left': (16 / 11), 'top': 3};
}

class PokerChip {
  final Bet bet;
  final int numberOfChips;
  Map<String, double> pos;
  bool showNumber;
  PokerChip(
      {@required this.numberOfChips,
      @required this.bet,
      this.pos,
      this.showNumber}) {
    if (this.pos == null) {
      this.pos = this.bet.defaultPos;
    }
    if (this.showNumber == null) {
      showNumber = true;
    }
  }
}

enum BetType { straight, split, corner, street, line, basket }

abstract class Bet {
  BetType betType;
  int betPoint;
  String title;
  Map<String, double> defaultPos;
  List<Map<String, double>> allPos;
  List<Map<String, double>> allPosTable2;
  List<Map<String, double>> focus5;
  List<Map<String, double>> focus2;
  List<Map<String, double>> focus2and4;
}

class Straight extends Bet {
  BetType betType = BetType.straight;
  int betPoint = 35;
  String title = 'Straight up';
  Map<String, double> defaultPos = StraightPos.cell_5;
  List<Map<String, double>> allPos = [
    StraightPos.cell_1,
    StraightPos.cell_2,
    StraightPos.cell_3,
    StraightPos.cell_4,
    StraightPos.cell_5,
    StraightPos.cell_6,
    StraightPos.cell_7,
    StraightPos.cell_8,
    StraightPos.cell_9,
  ];

  List<Map<String, double>> allPosTable2 = [
    StraightPos.cell_4,
    StraightPos.cell_5,
    StraightPos.cell_6,
    StraightPos.cell_7,
    StraightPos.cell_8,
    StraightPos.cell_9,
  ];

  List<Map<String, double>> focus5 = [
    StraightPos.cell_5,
  ];

  List<Map<String, double>> focus2 = [
    StraightPos.cell_5,
  ];

  List<Map<String, double>> focus2and4 = [
    StraightPos.cell_2,
    StraightPos.cell_4,
  ];
}

class Split extends Bet {
  BetType betType = BetType.split;
  int betPoint = 17;
  String title = 'Splits';
  Map<String, double> defaultPos = SplitPos.cell_45;
  List<Map<String, double>> allPos = [
    SplitPos.cell_12,
    SplitPos.cell_14,
    SplitPos.cell_23,
    SplitPos.cell_25,
    SplitPos.cell_36,
    SplitPos.cell_45,
    SplitPos.cell_47,
    SplitPos.cell_56,
    SplitPos.cell_58,
    SplitPos.cell_69,
    SplitPos.cell_78,
    SplitPos.cell_89,
  ];

  List<Map<String, double>> allPosTable2 = [
    SplitPos.cell_45,
    SplitPos.cell_47,
    SplitPos.cell_56,
    SplitPos.cell_58,
    SplitPos.cell_69,
    SplitPos.cell_78,
    SplitPos.cell_89,
  ];

  List<Map<String, double>> focus5 = [
    SplitPos.cell_25,
    SplitPos.cell_45,
    SplitPos.cell_56,
    SplitPos.cell_58,
  ];

  List<Map<String, double>> focus2 = [
    SplitPos.cell_45,
    SplitPos.cell_56,
    SplitPos.cell_58,
  ];

  List<Map<String, double>> focus2and4 = [
    SplitPos.cell_14,
    SplitPos.cell_47,
    SplitPos.cell_45,
    SplitPos.cell_12,
    SplitPos.cell_23,
    SplitPos.cell_25,
  ];
}

class Corner extends Bet {
  BetType betType = BetType.corner;
  int betPoint = 8;
  String title = 'Corners';
  Map<String, double> defaultPos = CornerPos.cell_1245;
  List<Map<String, double>> allPos = [
    CornerPos.cell_1245,
    CornerPos.cell_2356,
    CornerPos.cell_4578,
    CornerPos.cell_5689,
  ];

  List<Map<String, double>> allPosTable2 = [
    CornerPos.cell_4578,
    CornerPos.cell_5689,
  ];

  List<Map<String, double>> focus5 = [
    CornerPos.cell_1245,
    CornerPos.cell_2356,
    CornerPos.cell_4578,
    CornerPos.cell_5689,
  ];

  List<Map<String, double>> focus2 = [
    CornerPos.cell_4578,
    CornerPos.cell_5689,
  ];

  List<Map<String, double>> focus2and4 = [
    CornerPos.cell_1245,
    CornerPos.cell_4578,
    CornerPos.cell_2356,
  ];
}

class Street extends Bet {
  BetType betType = BetType.street;
  int betPoint = 11;
  String title = 'Streets';
  Map<String, double> defaultPos = StreetPos.cell_4;
  List<Map<String, double>> allPos = [
    StreetPos.cell_1,
    StreetPos.cell_4,
    StreetPos.cell_7,
  ];

  List<Map<String, double>> allPosTable2 = [
    StreetPos.cell_4,
    StreetPos.cell_7,
  ];

  List<Map<String, double>> focus5 = [
    StreetPos.cell_1,
    StreetPos.cell_4,
    StreetPos.cell_7,
  ];

  List<Map<String, double>> focus2 = [
    StreetPos.cell_4,
    StreetPos.cell_7,
  ];

  List<Map<String, double>> focus2and4 = [
    StreetPos.cell_4,
    StreetPos.cell_1,
  ];
}

class Line extends Bet {
  BetType betType = BetType.line;
  int betPoint = 5;
  String title = 'Lines';
  Map<String, double> defaultPos = LinePos.cell_47;
  List<Map<String, double>> allPos = [
    LinePos.cell_14,
    LinePos.cell_47,
  ];

  List<Map<String, double>> allPosTable2 = [
    LinePos.cell_47,
  ];

  List<Map<String, double>> focus5 = [
    LinePos.cell_14,
    LinePos.cell_47,
  ];

  List<Map<String, double>> focus2 = [
    LinePos.cell_47,
  ];

  List<Map<String, double>> focus2and4 = [
    LinePos.cell_14,
    LinePos.cell_47,
  ];
}

class Basket extends Bet {
  BetType betType = BetType.basket;
  int betPoint = 6;
  String title = 'First Five';
  Map<String, double> defaultPos = LinePos.cell_14;
}

List<List<Map<String, dynamic>>> level2FocusChoices = [
  f1,
  f2,
  f3,
  f4,
  f5,
  f6,
  f7,
  f8,
  f9
];
List<List<Map<String, dynamic>>> level3FocusChoices = [
  f1_table2,
  f2_table2,
  f3_table2,
  f4_table2,
  f5_table2,
  f6_table2
];

//
//
//for the level 2 focus

List<Map<String, dynamic>> f1_table2 = [
  {"type": Straight(), "pos": StraightPos.cell_4},
  {"type": Split(), "pos": SplitPos.cell_47},
  {"type": Split(), "pos": SplitPos.cell_45},
  {"type": Corner(), "pos": CornerPos.cell_4578},
  {"type": Line(), "pos": LinePos.cell_47},
  {"type": Street(), "pos": StreetPos.cell_4},
];

List<Map<String, dynamic>> f2_table2 = [
  {"type": Straight(), "pos": StraightPos.cell_5},
  {"type": Split(), "pos": SplitPos.cell_45},
  {"type": Split(), "pos": SplitPos.cell_56},
  {"type": Split(), "pos": SplitPos.cell_58},
  {"type": Corner(), "pos": CornerPos.cell_4578},
  {"type": Corner(), "pos": CornerPos.cell_5689},
  {"type": Street(), "pos": CornerPos.cell_1245},
  {"type": Street(), "pos": CornerPos.cell_2356},
];

List<Map<String, dynamic>> f3_table2 = [
  {"type": Straight(), "pos": StraightPos.cell_6},
  {"type": Split(), "pos": SplitPos.cell_56},
  {"type": Split(), "pos": SplitPos.cell_69},
  {"type": Corner(), "pos": CornerPos.cell_5689},
];

List<Map<String, dynamic>> f4_table2 = [
  {"type": Straight(), "pos": StraightPos.cell_7},
  {"type": Split(), "pos": SplitPos.cell_47},
  {"type": Split(), "pos": SplitPos.cell_78},
  {"type": Corner(), "pos": CornerPos.cell_4578},
  {"type": Line(), "pos": LinePos.cell_47},
  {"type": Street(), "pos": StreetPos.cell_7},
];

List<Map<String, dynamic>> f5_table2 = [
  {"type": Straight(), "pos": StraightPos.cell_8},
  {"type": Split(), "pos": SplitPos.cell_78},
  {"type": Split(), "pos": SplitPos.cell_58},
  {"type": Split(), "pos": SplitPos.cell_89},
  {"type": Corner(), "pos": CornerPos.cell_4578},
  {"type": Corner(), "pos": CornerPos.cell_5689},
];

List<Map<String, dynamic>> f6_table2 = [
  {"type": Straight(), "pos": StraightPos.cell_9},
  {"type": Split(), "pos": SplitPos.cell_89},
  {"type": Split(), "pos": SplitPos.cell_69},
  {"type": Corner(), "pos": CornerPos.cell_5689},
];

//
//
//
//for the level 2 focus
//
List<Map<String, dynamic>> f1 = [
  {"type": Straight(), "pos": StraightPos.cell_1},
  {"type": Split(), "pos": SplitPos.cell_12},
  {"type": Split(), "pos": SplitPos.cell_14},
  {"type": Corner(), "pos": CornerPos.cell_1245},
  {"type": Line(), "pos": LinePos.cell_14},
  {"type": Street(), "pos": StreetPos.cell_1},
];

List<Map<String, dynamic>> f2 = [
  {"type": Straight(), "pos": StraightPos.cell_2},
  {"type": Split(), "pos": SplitPos.cell_12},
  {"type": Split(), "pos": SplitPos.cell_23},
  {"type": Split(), "pos": SplitPos.cell_25},
  {"type": Corner(), "pos": CornerPos.cell_1245},
  {"type": Corner(), "pos": CornerPos.cell_2356},
];

List<Map<String, dynamic>> f3 = [
  {"type": Straight(), "pos": StraightPos.cell_3},
  {"type": Split(), "pos": SplitPos.cell_23},
  {"type": Split(), "pos": SplitPos.cell_36},
  {"type": Corner(), "pos": CornerPos.cell_2356},
];

List<Map<String, dynamic>> f4 = [
  {"type": Straight(), "pos": StraightPos.cell_4},
  {"type": Split(), "pos": SplitPos.cell_14},
  {"type": Split(), "pos": SplitPos.cell_47},
  {"type": Split(), "pos": SplitPos.cell_45},
  {"type": Corner(), "pos": CornerPos.cell_1245},
  {"type": Corner(), "pos": CornerPos.cell_4578},
  {"type": Line(), "pos": LinePos.cell_14},
  {"type": Line(), "pos": LinePos.cell_47},
  {"type": Street(), "pos": StreetPos.cell_4},
];

List<Map<String, dynamic>> f5 = [
  {"type": Straight(), "pos": StraightPos.cell_5},
  {"type": Split(), "pos": SplitPos.cell_25},
  {"type": Split(), "pos": SplitPos.cell_45},
  {"type": Split(), "pos": SplitPos.cell_56},
  {"type": Split(), "pos": SplitPos.cell_58},
  {"type": Corner(), "pos": CornerPos.cell_1245},
  {"type": Corner(), "pos": CornerPos.cell_2356},
  {"type": Corner(), "pos": CornerPos.cell_4578},
  {"type": Corner(), "pos": CornerPos.cell_5689},
];

List<Map<String, dynamic>> f6 = [
  {"type": Straight(), "pos": StraightPos.cell_6},
  {"type": Split(), "pos": SplitPos.cell_36},
  {"type": Split(), "pos": SplitPos.cell_56},
  {"type": Split(), "pos": SplitPos.cell_69},
  {"type": Corner(), "pos": CornerPos.cell_2356},
  {"type": Corner(), "pos": CornerPos.cell_5689},
];

List<Map<String, dynamic>> f7 = [
  {"type": Straight(), "pos": StraightPos.cell_7},
  {"type": Split(), "pos": SplitPos.cell_47},
  {"type": Split(), "pos": SplitPos.cell_78},
  {"type": Corner(), "pos": CornerPos.cell_4578},
  {"type": Line(), "pos": LinePos.cell_47},
  {"type": Street(), "pos": StreetPos.cell_7},
];

List<Map<String, dynamic>> f8 = [
  {"type": Straight(), "pos": StraightPos.cell_8},
  {"type": Split(), "pos": SplitPos.cell_78},
  {"type": Split(), "pos": SplitPos.cell_58},
  {"type": Split(), "pos": SplitPos.cell_89},
  {"type": Corner(), "pos": CornerPos.cell_4578},
  {"type": Corner(), "pos": CornerPos.cell_5689},
];

List<Map<String, dynamic>> f9 = [
  {"type": Straight(), "pos": StraightPos.cell_9},
  {"type": Split(), "pos": SplitPos.cell_89},
  {"type": Split(), "pos": SplitPos.cell_69},
  {"type": Corner(), "pos": CornerPos.cell_5689},
];
