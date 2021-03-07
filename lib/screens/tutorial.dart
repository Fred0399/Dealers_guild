import 'package:flutter/material.dart';
import 'package:roulette_teacher/helper/tutorial_detail.dart';
import 'package:roulette_teacher/widgets/ddrawer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Tutorial extends StatefulWidget {
  static const routeName = 'Tutorial';

  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  List<TutorialDetail> details = tutorialList;
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
                    totalSteps: details.length,
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
          child: PageView.builder(
            controller: PageController(keepPage: true),
            onPageChanged: changePage,
            itemCount: details.length,
            itemBuilder: (ctx, ind) {
              return Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: double.infinity,
                color: Colors.red,
                child: Stack(
                  children: [
                    Positioned(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Image.asset('assets' + details[ind].image_1),
                    ),
                    Positioned(
                      height: MediaQuery.of(context).size.height * 0.58,
                      bottom: 0,
                      right: 0,
                      child: Image.asset('assets' + details[ind].image_2),
                    ),
                    Positioned(
                      //height: MediaQuery.of(context).size.height * 0.58,
                      top: 0,
                      right: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Column(
                          children: [
                            Text(
                              details[ind].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              details[ind].description,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
