import 'package:flutter/material.dart';

import 'package:roulette_teacher/widgets/ddrawer.dart';

class DealersGuild extends StatelessWidget {
  static const routeName = 'dealersGuild';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Ddrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text("Dealers Guild"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image.asset("assets/about.jpg"),
        ),
      ),
    );
  }
}
