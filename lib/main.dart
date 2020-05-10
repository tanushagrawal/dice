import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;
  var Win_l = [""];
  var Win_r = [""];
  var turn = ["left"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(" Roll A DICE")),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (turn[0] == "win")
                Text(
                  "Game Finised and won by " + turn[0],
                  style: TextStyle(fontSize: 30),
                ),
              if (turn[0] == "left")
                Text(
                  "left's Turn",
                  style: TextStyle(fontSize: 30),
                ),
              if (turn[0] == "right")
                Text(
                  "Right's Turn",
                  style: TextStyle(fontSize: 30),
                ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            if (turn[0] == "left") {
                              leftDiceNumber = Random().nextInt(6) + 1;
                              turn.clear();
                              turn.add("right");
                              if (leftDiceNumber == 6) {
                                Win_l.clear();
                                Win_l.add("WIN");
                                turn.clear();
                                turn.add("win");
                              }
                            }
                          });
                        },
                        child: Image(
                          image: AssetImage("images/dice$leftDiceNumber.png"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        Win_l[0],
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            if (turn[0] == "right") {
                              rightDiceNumber = Random().nextInt(6) + 1;
                              turn.clear();
                              turn.add("left");
                              if (rightDiceNumber == 6) {
                                Win_r.clear();
                                Win_r.add("WIN");
                                turn.clear();
                                turn.add("win");
                              }
                            }
                          });
                        },
                        child: Image(
                          image: AssetImage("images/dice$rightDiceNumber.png"),
                        ),
//                onPressed: check,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        Win_r[0],
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text(
                  "Start A New Game",
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
                color: Colors.red,
                hoverColor: Colors.teal,
                highlightColor: Colors.yellow,
                onPressed: () {
                  setState(() {
                    Win_r.clear();
                    Win_r.add("");
                    Win_l.clear();
                    Win_l.add("");
                    turn.clear();
                    turn.add("right");
                    leftDiceNumber = 1;
                    rightDiceNumber = 1;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
