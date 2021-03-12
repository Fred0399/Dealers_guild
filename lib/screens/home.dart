import 'package:flutter/material.dart';

import 'package:roulette_teacher/widgets/ddrawer.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Ddrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text("Home"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        height: double.infinity,
        width: double.infinity,
        color: Color.fromARGB(255, 130, 27, 32),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/logo.png'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchURL("dealers-guild.work");
                    },
                    child: Image.asset(
                      'assets/www.png',
                      height: 50,
                    ),
                  ),
                  
                  
                  GestureDetector(
                    onTap: () {
                      //_launchURL("www.facebook.com");
                    },
                    child: Image.asset(
                      'assets/facebook.png',
                      height: 50,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Share.share("https://dealers-guild.work");
                    },
                    child: Image.asset(
                      'assets/line_logo.png',
                      height: 50,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //_launchURL("www.instagram.com");
                    },
                    child: Image.asset(
                      'assets/instagram.png',
                      height: 50,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

_launchURL(String url) async {
  //const url = 'https://flutter.dev';
  await launch(Uri.encodeFull('https://' + url), forceWebView: true);
}
