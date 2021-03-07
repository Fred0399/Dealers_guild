import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roulette_teacher/widgets/ddrawer.dart';

class Calculator extends StatefulWidget {
  static const routeName = 'Calculator';

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List<TextEditingController> controllers = List<TextEditingController>();
  int basket = 0;

  var fields = [
    'Straight up',
    'Splits',
    'Corners',
    'Streets',
    'Six line',
  ];

  var factors = [35, 17, 8, 11, 5];

  void calculate() {
    var sum = 0;
    for (int i = 0; i < controllers.length; i++) {
      if (controllers[i].text != '') {
        sum += int.parse(controllers[i].text) * factors[i];
      }
    }

    setState(() {
      basket = sum;
    });
  }

  void reset() {
    for (int i = 0; i < controllers.length; i++) {
      controllers.clear();
    }
    setState(() {
      basket = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Ddrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          "Calculator",
          style: TextStyle(
            //fontSize: 25,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35.0, 10, 35.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: fields.mapIndex((aField, ind) {
                    controllers.add(TextEditingController());
                    return Container(
                      //padding: EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            aField,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            width: min(
                                100, MediaQuery.of(context).size.height * 0.15),
                            height: min(
                                40, MediaQuery.of(context).size.height * 0.06),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w100,
                                color: Theme.of(context).primaryColor,
                              ),
                              textAlign: TextAlign.center,
                              onSubmitted: (str) {
                                //print(str);
                              },
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: false,
                                signed: false,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: controllers[ind],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '0',
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w100,
                                  color: Theme.of(context).primaryColor,
                                ),
                                filled: false,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: -20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                thickness: 2,
              ),
              Container(
                //padding: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Basket",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 50),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      // width: 100,
                      //height: 40,
                      //margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          basket.toString(),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 25,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                //width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/chip.png',
                            alignment: Alignment.center,
                            width: 50,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\$" + (basket).toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/chip_r.png',
                            alignment: Alignment.center,
                            width: 50,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\$" + (basket * 5).toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/chip_g.png',
                            alignment: Alignment.center,
                            width: 50,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\$" + (basket * 25).toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonTheme(
                      padding: EdgeInsets.all(0),
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        color: Theme.of(context).primaryColor,
                        iconSize: 60,
                        icon: Icon(
                          Icons.replay,
                        ),
                        onPressed: () {
                          reset();
                        },
                      ),
                    ),
                    ButtonTheme(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                      minWidth: 180.0,
                      height: 60.0,
                      child: RaisedButton(
                        onPressed: () {
                          calculate();
                        },
                        child: Text(
                          "CALCULATE",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension ExtendedIterable<E> on Iterable<E> {
  /// Like Iterable<T>.map but callback have index as second argument
  Iterable<T> mapIndex<T>(T f(E e, int i)) {
    var i = 0;
    return this.map((e) => f(e, i++));
  }

  void forEachIndex(void f(E e, int i)) {
    var i = 0;
    this.forEach((e) => f(e, i++));
  }
}
