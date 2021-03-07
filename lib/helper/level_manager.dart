import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roulette_teacher/helper/bet_type.dart';

enum LevelDifficulity {
  beginner,
  advanced,
  master,
}

enum LevelState {
  levelDone,
  subLevelDone,
  correctAns,
  worngAns,
}

enum LevelFocus {
  focus5,
  focus2,
  focus2and4,
  focusAll,
}

class LevelsManager {
  LevelDifficulity levelDifficulity;
  int levelInd = 0;
  int subLevelInd = 0;
  bool isContinuous;
  String levelTitle;
  List<Bet> possibleBets;
  int numberOfEachChip;
  int numberOfPokerChips;
  int minNumberOfChips;
  int maxNumberOfChips;
  bool isNumberOfEachChipRandom;
  int currentCorrectAns;
  LevelFocus focus = LevelFocus.focusAll;
  LevelsManager({@required levelDifficulity}) {
    this.levelDifficulity = levelDifficulity;
    start();
  }

  final _random = Random();
  int _next(int min, int max) {
    if (max == min) return min;
    return min + _random.nextInt(max - min);
  }

  void start() {
    levelInd = 0;
    subLevelInd = 0;

    switch (levelDifficulity) {
      case LevelDifficulity.beginner:
        levelTitle = 'Beginner';
        numberOfEachChip = 1;
        numberOfPokerChips = 4;
        minNumberOfChips = 2;
        maxNumberOfChips = 4;
        isContinuous = false;
        isNumberOfEachChipRandom = false;
        possibleBets = [Straight(), Corner(), Split()];
        focus = LevelFocus.focus5;
        break;

      // case LevelDifficulity.intermediate:
      //   levelTitle = 'Intermediate';
      //   numberOfEachChip = 1;
      //   numberOfPokerChips = 3;
      //   minNumberOfChips = 2;
      //   maxNumberOfChips = 3;
      //   isContinuous = false;
      //   isNumberOfEachChipRandom = false;
      //   possibleBets = [Straight(), Corner(), Split()];
      //   focus = LevelFocus.focusAll;
      //   break;

      case LevelDifficulity.advanced:
        levelTitle = 'Advanced';
        numberOfEachChip = 4;
        numberOfPokerChips = 4;
        minNumberOfChips = 2;
        maxNumberOfChips = 5;
        isContinuous = false;
        isNumberOfEachChipRandom = true;
        possibleBets = [Straight(), Corner(), Split()];
        focus = LevelFocus.focus5;
        break;

      case LevelDifficulity.master:
        levelTitle = 'Master';
        numberOfEachChip = 6;
        numberOfPokerChips = 4;
        minNumberOfChips = 4;
        maxNumberOfChips = 6;
        isContinuous = false;
        isNumberOfEachChipRandom = true;
        possibleBets = [Straight(), Corner(), Split()];
        focus = LevelFocus.focus5;
        break;
    }
  }

  LevelState checkAns(ans) {
    LevelState state;
    if (ans == currentCorrectAns) {
      subLevelInd++;
      state = LevelState.correctAns;

      if (subLevelInd == 10) {
        state = LevelState.subLevelDone;
        subLevelInd = 0;
        levelInd++;

        if (levelInd == 1) {
          maxNumberOfChips = 5;
          var rand = Random().nextBool();
          if (rand) {
            possibleBets = [Straight(), Corner(), Split(), Street()];
          } else {
            possibleBets = [Straight(), Corner(), Split(), Line()];
          }
          focus = LevelFocus.focusAll;
          if (levelDifficulity == LevelDifficulity.master) {
            maxNumberOfChips = 12;
          }
        } else if (levelInd == 2) {
          focus = LevelFocus.focus2;
          maxNumberOfChips = 6;
          if (levelDifficulity == LevelDifficulity.master) {
            maxNumberOfChips = 15;
          }
        } else if (levelInd == 3) {
          state = LevelState.levelDone;
        }
      }
    } else {
      //subLevelInd = 0;
      state = LevelState.worngAns;
    }

    if (levelDifficulity == LevelDifficulity.beginner) {
      if (levelInd == 2) {
        if (subLevelInd < 3) {
          focus = LevelFocus.focus2and4;
        } else {
          focus = LevelFocus.focus5;
        }
      }
    } else if (levelDifficulity == LevelDifficulity.advanced) {
      if (levelInd < 2) {
        if (subLevelInd < 3) {
          focus = LevelFocus.focus2and4;
        } else {
          focus = LevelFocus.focus5;
        }
      }
    }
    return state;
  }

  List<PokerChip> nextLevel() {
    currentCorrectAns = 0;
    List<PokerChip> pokerChips = [];
    int addedChips = 0;
    if (levelInd == 5) {
      possibleBets.shuffle();
      while (addedChips < minNumberOfChips) {
        for (int i = 0; i < possibleBets.length; i++) {
          List<int> ls = [];
          var n;
          if (focus == LevelFocus.focus2) {
            n = _next(
                1, min(numberOfPokerChips, possibleBets[i].focus2.length));
          } else if (focus == LevelFocus.focus5) {
            n = _next(
                1, min(numberOfPokerChips, possibleBets[i].focus5.length));
          } else if (focus == LevelFocus.focus2and4) {
            n = _next(
                1, min(numberOfPokerChips, possibleBets[i].focus2and4.length));
          } else {
            n = _next(
                1, min(numberOfPokerChips, possibleBets[i].allPos.length));
          }

          while (n > 0) {
            var nxt;
            if (focus == LevelFocus.focus2) {
              nxt = Random().nextInt(possibleBets[i].focus2.length);
            } else if (focus == LevelFocus.focus5) {
              nxt = Random().nextInt(possibleBets[i].focus5.length);
            } else if (focus == LevelFocus.focus2and4) {
              nxt = Random().nextInt(possibleBets[i].focus2and4.length);
            } else {
              nxt = Random().nextInt(possibleBets[i].allPos.length);
            }
            if (!ls.contains(nxt)) {
              ls.add(nxt);
              n--;
            }
          }

          var numOfChp = numberOfEachChip;
          if (isNumberOfEachChipRandom && numberOfEachChip != 1) {
            numOfChp = _next(1, numberOfEachChip);
          }

          for (int j = 0; j < ls.length; j++) {
            currentCorrectAns += numOfChp * possibleBets[i].betPoint;

            if (focus == LevelFocus.focus2) {
              pokerChips.add(PokerChip(
                numberOfChips: numOfChp,
                bet: possibleBets[i],
                pos: possibleBets[i].focus2[ls[j]],
              ));
            } else if (focus == LevelFocus.focus5) {
              pokerChips.add(PokerChip(
                numberOfChips: numOfChp,
                bet: possibleBets[i],
                pos: possibleBets[i].focus5[ls[j]],
              ));
            } else if (focus == LevelFocus.focus2and4) {
              pokerChips.add(PokerChip(
                numberOfChips: numOfChp,
                bet: possibleBets[i],
                pos: possibleBets[i].focus2and4[ls[j]],
              ));
            } else {
              pokerChips.add(PokerChip(
                numberOfChips: numOfChp,
                bet: possibleBets[i],
                pos: possibleBets[i].allPos[ls[j]],
              ));
            }

            addedChips++;

            if (addedChips >= maxNumberOfChips) {
              return pokerChips;
            }
          }
        }
      }
    } else if (levelInd == 0 || levelInd == 1) {
      //var randNum = _next(0, level2FocusChoices.length);
      var randNum = 4;
      var newLs = level2FocusChoices[randNum].sublist(0);
      newLs.shuffle();
      var ls = newLs.sublist(
          0, min(maxNumberOfChips - 1, level2FocusChoices[randNum].length));

      var numOfChp = numberOfEachChip;
      if (isNumberOfEachChipRandom && numberOfEachChip != 1) {
        numOfChp = _next(1, numberOfEachChip);
      }

      for (int i = 0; i < ls.length; i++) {
        numOfChp = numberOfEachChip;
        if (isNumberOfEachChipRandom && numberOfEachChip != 1) {
          numOfChp = _next(1, numberOfEachChip);
        }
        currentCorrectAns += numOfChp * ls[i]["type"].betPoint;
        pokerChips.add(PokerChip(
          numberOfChips: numOfChp,
          bet: ls[i]["type"],
          pos: ls[i]["pos"],
        ));
      }

      switch (randNum) {
        case 0:
          currentCorrectAns += numOfChp * Split().betPoint;
          pokerChips.add(PokerChip(
            numberOfChips: numOfChp,
            bet: Split(),
            pos: SplitPos.cell_89,
          ));
          break;
        case 1:
          currentCorrectAns += numOfChp * Straight().betPoint;
          pokerChips.add(PokerChip(
            numberOfChips: numOfChp,
            bet: Straight(),
            pos: StraightPos.cell_9,
          ));
          break;
        case 2:
          currentCorrectAns += numOfChp * Split().betPoint;
          pokerChips.add(PokerChip(
            numberOfChips: numOfChp,
            bet: Split(),
            pos: SplitPos.cell_47,
          ));
          break;
        case 3:
          currentCorrectAns += numOfChp * Split().betPoint;
          pokerChips.add(PokerChip(
            numberOfChips: numOfChp,
            bet: Split(),
            pos: SplitPos.cell_69,
          ));
          break;
        case 4:
          var randomNumber = _next(0, 3);
          if (randomNumber == 0) {
            currentCorrectAns += numOfChp * Line().betPoint;
            pokerChips.add(PokerChip(
              numberOfChips: numOfChp,
              bet: Line(),
              pos: LinePos.cell_47,
            ));
          } else if (randomNumber == 1) {
            currentCorrectAns += numOfChp * Line().betPoint;
            pokerChips.add(PokerChip(
              numberOfChips: numOfChp,
              bet: Line(),
              pos: LinePos.cell_14,
            ));
          } else {
            currentCorrectAns += numOfChp * Street().betPoint;
            pokerChips.add(PokerChip(
              numberOfChips: numOfChp,
              bet: Street(),
              pos: StreetPos.cell_4,
            ));
          }

          break;
        case 5:
          currentCorrectAns += numOfChp * Line().betPoint;
          pokerChips.add(PokerChip(
            numberOfChips: numOfChp,
            bet: Line(),
            pos: LinePos.cell_14,
          ));
          break;
        case 6:
          currentCorrectAns += numOfChp * Corner().betPoint;
          pokerChips.add(PokerChip(
            numberOfChips: numOfChp,
            bet: Corner(),
            pos: CornerPos.cell_1245,
          ));
          break;
        case 7:
          currentCorrectAns += numOfChp * Corner().betPoint;
          pokerChips.add(PokerChip(
            numberOfChips: numOfChp,
            bet: Corner(),
            pos: CornerPos.cell_2356,
          ));
          break;

        case 8:
          currentCorrectAns += numOfChp * Corner().betPoint;
          pokerChips.add(PokerChip(
            numberOfChips: numOfChp,
            bet: Corner(),
            pos: CornerPos.cell_4578,
          ));
          break;
      }
    } else if (levelInd == 2) {
      //var randNum = _next(0, level3FocusChoices.length);
      var randNum = 1;
      var newLs = level3FocusChoices[randNum].sublist(0);
      newLs.shuffle();
      var ls = newLs.sublist(
          0, min(maxNumberOfChips - 1, level3FocusChoices[randNum].length - 1));

      var numOfChp = numberOfEachChip;
      if (isNumberOfEachChipRandom && numberOfEachChip != 1) {
        numOfChp = _next(1, numberOfEachChip);
      }
      bool leftFree = true;
      bool rightFree = true;
      for (int i = 0; i < ls.length; i++) {
        numOfChp = numberOfEachChip;
        if (isNumberOfEachChipRandom && numberOfEachChip != 1) {
          numOfChp = _next(1, numberOfEachChip);
        }
        currentCorrectAns += numOfChp * ls[i]["type"].betPoint;
        pokerChips.add(PokerChip(
          numberOfChips: numOfChp,
          bet: ls[i]["type"],
          pos: ls[i]["pos"],
        ));

        if (ls[i]["pos"] == CornerPos.cell_1245) {
          leftFree = false;
        }

        if (ls[i]["pos"] == CornerPos.cell_2356) {
          rightFree = false;
        }
      }

      switch (randNum) {
        case 0:
          currentCorrectAns += numOfChp * Split().betPoint;
          pokerChips.add(PokerChip(
            numberOfChips: numOfChp,
            bet: Split(),
            pos: SplitPos.cell_89,
          ));
          break;
        case 1:
          var randomNumber = _next(0, 3);
          if (randomNumber == 0) {
            currentCorrectAns += numOfChp * Basket().betPoint;
            pokerChips.add(PokerChip(
              numberOfChips: numOfChp,
              bet: Basket(),
              pos: LinePos.cell_14,
            ));
          } else if (randomNumber == 1) {
            currentCorrectAns += numOfChp * Street().betPoint;
            pokerChips.add(PokerChip(
              numberOfChips: numOfChp,
              bet: Street(),
              pos: StreetPos.cell_4,
            ));
          } else {
            currentCorrectAns += numOfChp * Line().betPoint;
            pokerChips.add(PokerChip(
              numberOfChips: numOfChp,
              bet: Line(),
              pos: LinePos.cell_47,
            ));
          }

          if (leftFree) {
            currentCorrectAns += numOfChp * Split().betPoint;
            pokerChips.add(PokerChip(
              numberOfChips: numOfChp,
              bet: Split(),
              pos: SpecialPos.cell_02,
            ));
          }
          if (rightFree) {
            currentCorrectAns += numOfChp * Split().betPoint;
            pokerChips.add(PokerChip(
              numberOfChips: numOfChp,
              bet: Split(),
              pos: SpecialPos.cell_002,
            ));
          }

          if (!leftFree && !rightFree) {
            currentCorrectAns += numOfChp * Street().betPoint;
            pokerChips.add(PokerChip(
              numberOfChips: numOfChp,
              bet: Street(),
              pos: SplitPos.cell_25,
            ));
          }

          break;
        case 2:
          currentCorrectAns += numOfChp * Split().betPoint;
          pokerChips.add(PokerChip(
            numberOfChips: numOfChp,
            bet: Split(),
            pos: SplitPos.cell_47,
          ));
          break;
        case 3:
          currentCorrectAns += numOfChp * Split().betPoint;
          pokerChips.add(PokerChip(
            numberOfChips: numOfChp,
            bet: Split(),
            pos: SplitPos.cell_69,
          ));
          break;
        case 4:
          currentCorrectAns += numOfChp * Line().betPoint;
          pokerChips.add(PokerChip(
            numberOfChips: numOfChp,
            bet: Line(),
            pos: LinePos.cell_47,
          ));
          break;
        case 5:
          currentCorrectAns += numOfChp * Line().betPoint;
          pokerChips.add(PokerChip(
            numberOfChips: numOfChp,
            bet: Line(),
            pos: LinePos.cell_47,
          ));
          break;
      }
    }
    //print(currentCorrectAns);
    return pokerChips;
  }
}
