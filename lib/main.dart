import 'package:flutter/material.dart';
import 'package:dashboarddesign/grass/splashscreen.dart' as flowerSplash;
import 'package:dashboarddesign/about/splashscreen.dart' as leafSplash;
import 'package:dashboarddesign/about_us/splashscreen.dart' as vegetableSplash;
import 'package:dashboarddesign/feedback/splashscreen.dart' as fruitSplash;

void main() => runApp(MaterialApp(
      title: 'Grass Identification',
      home: Dashboard(),
    ));

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 21, 21, 21),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Welcome, Grass Identification \nSelect an option",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                    color: Colors.white,
                    fontFamily: "Signatra",
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20.0,
                    children: <Widget>[
                      SizedBox(
                        child: TextButton(
                          child: SizedBox(
                            width: 160.0,
                            height: 140.0,
                            child: Card(
                              color: Color.fromARGB(255, 21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/leaf.png",
                                        width: 64.0,
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        "Grass Identification",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => flowerSplash.MySplashFlower(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        child: TextButton(
                          child: SizedBox(
                            width: 160.0,
                            height: 140.0,
                            child: Card(
                              color: Color.fromARGB(255, 21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/about.png",
                                        width: 64.0,
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        "About the App",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => leafSplash.MySplashLeaves(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        child: TextButton(
                          child: SizedBox(
                            width: 160.0,
                            height: 140.0,
                            child: Card(
                              color: Color.fromARGB(255, 21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/about_us.png",
                                        width: 64.0,
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        "About the author",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => vegetableSplash.MySplashVegetable(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        child: TextButton(
                          child: SizedBox(
                            width: 160.0,
                            height: 140.0,
                            child: Card(
                              color: Color.fromARGB(255, 21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/feedback.png",
                                        width: 64.0,
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        "FeedBack",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => fruitSplash.MySplashFruit(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
