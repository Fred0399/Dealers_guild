import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepProgress extends StatelessWidget {
  const StepProgress(
      {@required this.currentStep,
      @required this.totalSteps,
      @required this.padding});

  final int currentStep;
  final int totalSteps;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 65),
      child: StepProgressIndicator(
        totalSteps: totalSteps,
        padding: padding,
        currentStep: currentStep,
        customColor: (ind) => Theme.of(context).primaryColor,
        customSize: (ind,bool) => 13,
        customStep: (index, color, size) {
          if (index <= currentStep) {
            return Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 0),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: color,
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 0.7),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            );
          }
        },
      ),
    );
  }
}
