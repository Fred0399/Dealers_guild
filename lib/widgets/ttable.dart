import 'package:flutter/material.dart';
import '../helper/bet_type.dart';

class Ttable extends StatelessWidget {
  Ttable(
      {@required this.tableSize,
      this.chipSize,
      this.framePadding = 10,
      this.frameWidth = 5,
      this.frameRadius = 30,
      @required this.chips,
      @required this.tableImg}) {
    _width = tableSize * (341 / 254);
    _height = tableSize;
    if (chipSize == null) {
      chipSize = _width / 10;
    }
  }
  final double tableSize;
  double chipSize;
  final List<PokerChip> chips;
  final double framePadding;
  final double frameWidth;
  final double frameRadius;
  double _width;
  double _height;
  //final List<Poker>
  String tableImg = 'table focus 5.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(framePadding),
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).primaryColor, width: frameWidth),
          borderRadius: BorderRadius.all(Radius.circular(frameRadius)),
        ),
        child: Container(
          height: _height,
          width: _width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/' + tableImg,
              ),
              fit: BoxFit.fitHeight,
              alignment: Alignment.center,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: chips.map((aChip) {
              return Positioned(
                child: Container(
                  height: chipSize,
                  width: chipSize,
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/chip.png',
                        //scale: 0.5,
                        fit: BoxFit.fitHeight,
                        // width: chipSize - 50,
                        alignment: Alignment.center,
                      ),
                      if (aChip.showNumber)
                        Padding(
                          padding: EdgeInsets.all(chipSize / 6),
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              aChip.numberOfChips.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                left: _width / aChip.pos['left'] - chipSize / 2,
                top: _height / aChip.pos['top'] - chipSize / 2,
                //width: chipSize,
              );
            }).toList(),
            overflow: Overflow.visible,
          ),
        ),
      ),
    );
  }
}

// Container(
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               image: DecorationImage(
//                 image: AssetImage(
//                   'assets/' + tableImg,
//                 ),
//                 fit: BoxFit.fitWidth,
//                 alignment: Alignment.center,
//               ),
//             ),
