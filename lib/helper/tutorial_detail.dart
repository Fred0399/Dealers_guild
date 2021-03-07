import 'package:flutter/material.dart';

class TutorialDetail {
  final String image_1;
  final String image_2;
  final String title;
  final String description;

  TutorialDetail({
    @required this.image_1,
    @required this.image_2,
    this.title,
    this.description,
  });
}

List<TutorialDetail> tutorialList = [
  TutorialDetail(
    image_1: '/tutorial/bet_btn.png',
    image_2: '/tutorial/bet_scr.png',
    title: 'Practice Times Tables:',
    description: '35, 17, 11, 8 and 5\n In Order or Random',
  ),
  TutorialDetail(
    image_1: '/tutorial/bet_pic_btn.png',
    image_2: '/tutorial/bet_pic_scr.png',
    title: '15 Common Picture Bets',
    description: 'Slider/Flash Card Style',
  ),
  TutorialDetail(
    image_1: '/tutorial/level_btn.png',
    image_2: '/tutorial/lvl_bgn.png',
    title: 'Beginner',
    description: 'Continuous Random Patterns Using 1 Chip For Each Bet',
  ),
  TutorialDetail(
    image_1: '/tutorial/level_btn.png',
    image_2: '/tutorial/lvl_int.png',
    title: 'Intermediate',
    description:
        'All Bets Will have An Equal Number of Chips. Must Correcly Answer 10 In-A-Row for Next Level',
  ),
  TutorialDetail(
    image_1: '/tutorial/level_btn.png',
    image_2: '/tutorial/lvl_adv.png',
    title: 'Advanced',
    description:
        'Bets Will Be A Variety of Amounts. Must Correctly Answer 10 In-A-Row for Next Level',
  ),
  TutorialDetail(
    image_1: '/tutorial/level_btn.png',
    image_2: '/tutorial/lvl_mas.png',
    title: 'Master',
    description:
        'Same As Advanced but With Streets, Six Line and Beskets. Must Correctly Answer 10 In-A-Row for Next Level',
  ),
  TutorialDetail(
    image_1: '/tutorial/calc_btn.png',
    image_2: '/tutorial/calc_scr.png',
    title: 'Calculator',
    description: 'Roulette Payout Calculator',
  ),
];
