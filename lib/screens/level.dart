import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:roulette_teacher/helper/bet_type.dart';
import 'package:roulette_teacher/helper/level_manager.dart';
import 'package:roulette_teacher/widgets/ddrawer.dart';
import 'package:roulette_teacher/widgets/step_progress.dart';
import 'package:roulette_teacher/widgets/ttable.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:toast/toast.dart';

class Level extends StatefulWidget {
  static const routeName = 'Level';

  final LevelDifficulity lvlDiff;
  Level({this.lvlDiff, Key key}) : super(key: key);

  @override
  _LevelState createState() => _LevelState();
}

class _LevelState extends State<Level> {
  LevelsManager lvlManager;
  LevelDifficulity lvlDiff;
  Random random = new Random();
  TextEditingController textEditingController;
  List<PokerChip> chips = [];
  int levelInd, subLevelInd;
  bool init = false;
  String tableImgPath = 'table focus 5.png';

  initialize() {
    setState(() {
      lvlManager = LevelsManager(levelDifficulity: lvlDiff);
      chips = lvlManager.nextLevel();
      levelInd = lvlManager.levelInd;
      subLevelInd = lvlManager.subLevelInd;
      textEditingController = TextEditingController();
      _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
    });
  }

  StopWatchTimer _stopWatchTimer = StopWatchTimer();
  String displayTime;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
    // _stopWatchTimer.onExecute.add(StopWatchExecute.lap);

    if (!init) {
      init = true;
      lvlDiff = ModalRoute.of(context).settings.arguments;
      initialize();
    }
    return Scaffold(
      drawer: Ddrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          lvlManager.levelTitle,
          style: TextStyle(
            //fontSize: 30,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            if (!lvlManager.isContinuous)
              StepProgress(
                  currentStep: lvlManager.levelInd, totalSteps: 3, padding: 3),
            if (!lvlManager.isContinuous)
              StepProgress(
                  currentStep: lvlManager.subLevelInd,
                  totalSteps: 10,
                  padding: 10),
            // SizedBox(height: 15),
            StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snap) {
                final value = snap.data;
                displayTime =
                    StopWatchTimer.getDisplayTime(value, milliSecond: false);
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        displayTime,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Center(
              child: Container(
                child: ClipRRect(
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 3),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          width: 100,
                          height: 40,
                          child: TextField(
                            controller: textEditingController,
                            onEditingComplete: () {
                              checkAnswer(context);
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
                            if (textEditingController.text.isEmpty) return;
                            checkAnswer(context);
                          },
                          child: Icon(Icons.send,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Ttable(
              tableImg: tableImgPath,
              //tableImg: "table focus 2.png",
              tableSize: MediaQuery.of(context).size.width * 0.6,
              //chipSize: 35,
              frameWidth: 2,
              frameRadius: 15,
              chips: chips,
            ),
          ],
        ),
      ),
    );
  }

  void checkAnswer(BuildContext context) {
    if (textEditingController.value.text.toString().isEmpty) return;
    LevelState stt = lvlManager
        .checkAns(int.parse(textEditingController.value.text.toString()));

    textEditingController.clear();

    if (stt == LevelState.correctAns || stt == LevelState.subLevelDone) {
      setState(() {
        chips = lvlManager.nextLevel();
        levelInd = lvlManager.levelInd;
        subLevelInd = lvlManager.subLevelInd;
      });
      if (stt == LevelState.subLevelDone) {
        Toast.show(
          "Congratulations, you made it to next level!",
          context,
          duration: 2,
          gravity: Toast.TOP,
        );

        //_stopWatchTimer.onExecute.add(StopWatchExecute.stop);

        if (levelInd == 2) {
          setState(() {
            tableImgPath = 'table focus 2.png';
          });
        }
      }
    } else if (stt == LevelState.worngAns) {
      Toast.show(
        "Wrong Asnwer. You must get 10 correct to go to the next level!",
        context,
        duration: 2,
        gravity: Toast.TOP,
      );
      setState(() {
        // if (levelInd == 0) {
        //   _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
        //   _stopWatchTimer.onExecute.add(StopWatchExecute.start);
        // }
        subLevelInd = lvlManager.subLevelInd;
      });
      // _onAlertWithCustomContentPressed(context, displayTime, lvlDiff);
    } else if (stt == LevelState.levelDone) {
      setState(() {
        _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
      });
      _onAlertWithCustomContentPressed(context, displayTime, lvlDiff);
    }
  }

  _onAlertWithCustomContentPressed(context, String time, levelDiff) {
    String license;
    if (levelDiff == LevelDifficulity.beginner) {
      license = 'Silver';
    } else if (levelDiff == LevelDifficulity.advanced) {
      license = 'Gold';
    } else if (levelDiff == LevelDifficulity.master) {
      license = 'Platinum';
    }
    Alert(
      closeFunction: () {
        lvlManager.start();
        initialize();
      },
      context: context,
      title: 'You achived',
      type: AlertType.none,
      style: AlertStyle(
        isCloseButton: true,
        isOverlayTapDismiss: false,
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Text(license, style: TextStyle(fontSize: 30)),
            Text('roulette license'),
            SizedBox(height: 15),
            Text(time, style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);

            Navigator.of(context).pushNamedAndRemoveUntil(
              Level.routeName,
              (route) {
                return route.settings.name == '/' && Level.routeName != '/';
              },
              arguments: (lvlDiff == LevelDifficulity.beginner)
                  ? LevelDifficulity.advanced
                  : LevelDifficulity.master,
            );
          },
          color: Theme.of(context).primaryColor,
          child: Text(
            "Go to the next level",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
}
