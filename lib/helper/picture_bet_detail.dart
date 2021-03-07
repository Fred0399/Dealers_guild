import 'package:roulette_teacher/helper/bet_type.dart';

class PictureBetDetail {
  String title;
  List<PokerChip> chips;
  int amount;
  String tablePath;

  PictureBetDetail(title, chips, [String tablePath]) {
    this.title = title;
    this.chips = chips;
    this.tablePath =
        tablePath == null ? 'table focus 5.png' : 'table focus 2.png';

    amount = 0;
    for (int i = 0; i < chips.length; i++) {
      amount += chips[i].numberOfChips * chips[i].bet.betPoint;
    }
  }
}

getAmount() {}

List<PictureBetDetail> pageDetails = [
  // PictureBetDetail(
  //     'Deck of Cards',
  //     [
  //       PokerChip(
  //         numberOfChips: 1,
  //         bet: Split(),
  //         pos: SplitPos.cell_25,
  //         //showNumber: false,
  //       ),
  //       PokerChip(
  //         numberOfChips: 1,
  //         bet: Corner(),
  //         pos: SpecialPos.cell_02,
  //         //showNumber: false,
  //       ),
  //       PokerChip(
  //         numberOfChips: 1,
  //         bet: Corner(),
  //         pos: SpecialPos.cell_002,
  //         // showNumber: false,
  //       ),
  //       PokerChip(
  //         numberOfChips: 1,
  //         bet: Corner(),
  //         pos: CornerPos.cell_2356,
  //         // showNumber: false,
  //       ),
  //       PokerChip(
  //         numberOfChips: 1,
  //         bet: Corner(),
  //         pos: CornerPos.cell_1245,
  //         // showNumber: false,
  //       ),
  //     ],
  //     "2"),

  /////////////////////
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_25,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_2356,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Straight(),
        pos: StraightPos.cell_5,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_2356,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Straight(),
        pos: StraightPos.cell_5,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_56,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_25,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_2356,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_1245,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Straight(),
        pos: StraightPos.cell_5,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_2356,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_1245,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_25,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_45,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_56,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Straight(),
        pos: StraightPos.cell_5,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_45,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_56,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_1245,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_2356,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_4578,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_5689,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_1245,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_2356,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_45,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_56,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_1245,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_2356,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_4578,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_5689,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Straight(),
        pos: StraightPos.cell_5,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_25,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_45,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_56,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Straight(),
        pos: StraightPos.cell_5,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_25,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_45,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_56,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_58,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Straight(),
        pos: StraightPos.cell_5,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_25,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_58,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_1245,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_2356,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_4578,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_5689,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_25,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_1245,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_2356,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_45,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_56,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Straight(),
        pos: StraightPos.cell_5,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_1245,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_2356,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_4578,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_5689,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_25,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_45,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_56,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_58,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_1245,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_2356,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_4578,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_5689,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_25,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_45,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_56,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_58,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Straight(),
        pos: StraightPos.cell_5,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Street(),
        pos: StreetPos.cell_4,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Line(),
        pos: LinePos.cell_14,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Line(),
        pos: LinePos.cell_47,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Line(),
        pos: LinePos.cell_14,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_1245,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_45,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Line(),
        pos: LinePos.cell_14,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Straight(),
        pos: StraightPos.cell_5,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Line(),
        pos: LinePos.cell_14,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Line(),
        pos: LinePos.cell_47,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Straight(),
        pos: StraightPos.cell_5,
        showNumber: false,
      ),
    ],
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_1245,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_2356,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_4578,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_5689,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_25,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_45,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_56,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_58,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Straight(),
        pos: StraightPos.cell_5,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Street(),
        pos: StreetPos.cell_4,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Line(),
        pos: LinePos.cell_14,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Line(),
        pos: LinePos.cell_47,
        showNumber: false,
      ),
    ],
  ),
  //new ones
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Street(),
        pos: CornerPos.cell_1245,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Street(),
        pos: CornerPos.cell_2356,
        showNumber: false,
      ),
    ],
    "2",
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Street(),
        pos: CornerPos.cell_1245,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Street(),
        pos: CornerPos.cell_2356,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Straight(),
        pos: StraightPos.cell_5,
        showNumber: false,
      ),
    ],
    "2",
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Street(),
        pos: CornerPos.cell_1245,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Street(),
        pos: CornerPos.cell_2356,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Straight(),
        pos: StraightPos.cell_5,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Basket(),
        pos: LinePos.cell_14,
        showNumber: false,
      ),
    ],
    "2",
  ),
  PictureBetDetail(
    'Deck of Cards',
    [
      PokerChip(
        numberOfChips: 1,
        bet: Street(),
        pos: CornerPos.cell_1245,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Street(),
        pos: CornerPos.cell_2356,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Straight(),
        pos: StraightPos.cell_5,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Basket(),
        pos: LinePos.cell_14,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Street(),
        pos: StreetPos.cell_4,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Line(),
        pos: LinePos.cell_47,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_45,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_58,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Split(),
        pos: SplitPos.cell_56,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_4578,
        showNumber: false,
      ),
      PokerChip(
        numberOfChips: 1,
        bet: Corner(),
        pos: CornerPos.cell_5689,
        showNumber: false,
      ),
    ],
    "2",
  ),
];
