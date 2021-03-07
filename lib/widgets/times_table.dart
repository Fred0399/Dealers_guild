import 'package:flutter/material.dart';
import 'dart:math';
import 'package:roulette_teacher/widgets/step_progress.dart';
import 'package:roulette_teacher/widgets/ttable.dart';

import 'package:toast/toast.dart';

import '../helper/bet_type.dart';

class TimesTable extends StatefulWidget {
  static const routeName = 'TimesTable';
  final Bet bet;
  final bool showTable2;
  TimesTable({this.bet, this.showTable2 = false, Key key}) : super(key: key);

  @override
  _TimesTableState createState() => _TimesTableState();
}

class _TimesTableState extends State<TimesTable>
    with SingleTickerProviderStateMixin {
  int currentStep;
  int currentInd;
  Bet bet;
  List<int> list;
  bool isRandom = false;
  Random random = new Random();
  TextEditingController textEditingController = TextEditingController();

  incStep(BuildContext ctx) {
    if (currentStep == 19) {
      Toast.show(
        "Congratulations! We will now start from the beginning, so you can go faster.",
        ctx,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.TOP,
      );

      initialize();
    } else {
      setState(() {
        currentStep++;
      });
    }
  }

  void orderRandom(int val) {
    if (val == 0 && isRandom) {
      isRandom = false;
      toOrder();
      initialize();
    } else if (val == 1 && !isRandom) {
      isRandom = true;
      initialize();
      toRandom();
    }
  }

  void toRandom() {
    setState(() {
      currentInd = random.nextInt(list.length);
    });
  }

  void toOrder() {
    setState(() {
      currentInd = 0;
    });
  }

  void correctAns(BuildContext ctx) {
    list.removeAt(currentInd);
    incStep(ctx);

    if (isRandom) {
      toRandom();
    }
  }

  void checkAns(int val, BuildContext ctx) {
    if (val == list[currentInd] * bet.betPoint) {
      correctAns(ctx);
    } else {
      Toast.show(
        "Wrong Asnwer",
        ctx,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.TOP,
      );
    }
  }

  void initialize() {
    setState(() {
      currentStep = 0;
      currentInd = 0;
      list = [for (var i = 1; i < 21; i += 1) i];
    });
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bet = widget.bet;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            centerTitle: true,
            // title: Text(
            //   bet.title,
            //   style: TextStyle(
            //     //fontSize: 30,
            //     fontFamily: 'Rubik',
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              onTap: (value) {
                orderRandom(value);
              },
              tabs: [
                Tab(
                  child: Text(
                    'In order',
                    style: TextStyle(
                      fontSize: 27,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Random',
                    style: TextStyle(
                      fontSize: 27,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StepProgress(
                currentStep: currentStep,
                totalSteps: 20,
                padding: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    //(list[currentInd]).toString() + ' ' +
                    bet.title,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                  Container(
                    child: ClipRRect(
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              width: 90,
                              height: 40,
                              child: TextField(
                                controller: textEditingController,
                                onEditingComplete: () {
                                  checkAns(
                                      int.parse(textEditingController.text),
                                      context);
                                  textEditingController.clear();
                                },
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w100,
                                  color: Theme.of(context).primaryColor,
                                ),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'answer',
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w100,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withAlpha(150),
                                  ),
                                  filled: false,
                                  isDense: false,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10),
                                ),
                              ),
                            ),
                            FlatButton(
                                onPressed: () {
                                  if (textEditingController.text.isEmpty)
                                    return;
                                  checkAns(
                                      int.parse(textEditingController.text),
                                      context);
                                  textEditingController.clear();
                                },
                                child: Icon(Icons.send,
                                    color: Theme.of(context).primaryColor)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Ttable(
                tableImg: widget.showTable2
                    ? 'table focus 2.png'
                    : 'table focus 5.png',
                tableSize: MediaQuery.of(context).size.width * 0.6,
                //chipSize: 35,
                frameWidth: 2,
                frameRadius: 15,
                chips: [
                  PokerChip(
                      numberOfChips: list[currentInd],
                      bet: bet,
                      showNumber: true),
                ],
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8),
                width: MediaQuery.of(context).size.width * 0.95,
                //height: 150,
                child: Column(
                  children: [
                    Text(
                      bet.betPoint.toString() + ':1',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(5, (ind) {
                          return Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(4, (index) {
                                var nm = ind * 4 + 1 + index;
                                return Expanded(
                                  flex: 1,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      //   color: Colors.amber,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Text(
                                            "20:700",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w500,
                                              // fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            (nm).toString() +
                                                ':' +
                                                (nm * bet.betPoint).toString(),
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w500,
                                              // fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
