import 'dart:math';
import 'package:flutter/material.dart';
import 'package:roulette_teacher/helper/picture_bet_detail.dart';
import 'package:roulette_teacher/widgets/ttable.dart';

class PictureBet extends StatefulWidget {
  PictureBet({Key key, this.detail, this.tablePath}) : super(key: key);

  final PictureBetDetail detail;
  final String tablePath;

  @override
  _PictureBetState createState() => _PictureBetState();
}

class _PictureBetState extends State<PictureBet>
    with AutomaticKeepAliveClientMixin<PictureBet> {
  bool showAmount = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text(
          //   widget.detail.title,
          //   style: TextStyle(
          //     color: Theme.of(context).primaryColor,
          //     fontFamily: 'Rubik',
          //     fontWeight: FontWeight.bold,
          //     fontSize: 23,
          //   ),
          // ),
          Ttable(
            tableImg: widget.tablePath,
            tableSize: min(MediaQuery.of(context).size.width * 0.6,
                MediaQuery.of(context).size.height * 0.6),
            //chipSize: 35,
            frameWidth: 2,
            frameRadius: 15,
            chips: widget.detail.chips,
            //  chipSize: 25,
          ),
          SizedBox(
            height: min(40, MediaQuery.of(context).size.height * 0.05),
            width: MediaQuery.of(context).size.width * 0.5,
            child: FlatButton(
              onPressed: () {
                setState(() {
                  showAmount = true;
                });
              },
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Show amount',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.5,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Text(
            showAmount ? widget.detail.amount.toString() : '',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'Rubik',
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
