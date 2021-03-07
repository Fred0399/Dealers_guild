import 'package:flutter/material.dart';
import 'package:roulette_teacher/helper/picture_bet_detail.dart';
import 'package:roulette_teacher/widgets/ddrawer.dart';
import 'package:roulette_teacher/widgets/picture_bet.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class PictureBetsScreen extends StatefulWidget {
  static const routeName = 'PicutreBetsScreen';

  @override
  _PictureBetsScreenState createState() => _PictureBetsScreenState();
}

class _PictureBetsScreenState extends State<PictureBetsScreen> {
  List<PictureBetDetail> pages = pageDetails;
  int currentStep = 0;

  changePage(ind) {
    setState(() {
      currentStep = ind;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Ddrawer(),
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Picture Bets',
              style: TextStyle(
                //fontSize: 30,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 30),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 65),
                  child: StepProgressIndicator(
                    totalSteps: pages.length,
                    padding: 3,
                    currentStep: currentStep,
                    customColor: (ind) => Theme.of(context).primaryColor,
                    customSize: (ind,bool) => 13,
                    customStep: (index, color, size) {
                      if (index <= currentStep) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 0),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: color,
                          ),
                        );
                      } else {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 0.7),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            )),
        body: Container(
          //
          child: PageView.builder(
            controller: PageController(keepPage: true),
            onPageChanged: changePage,
            itemCount: pages.length,
            itemBuilder: (ctx, ind) {
              //changePage(ind);
              return PictureBet(
                detail: pages[ind],
                key: Key(ind.toString()),
                tablePath: pages[ind].tablePath,
              );
            },
          ),
        ),
      ),
    );
  }
}
