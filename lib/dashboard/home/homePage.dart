import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../Dash_nav.dart';
import '../workout/schedule.dart';
import 'package:fitrhythm/info_var.dart';

import '../workout/workoutlist/workouts.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List days = exerStorage.days;
  String name = Personal_info.Fullname;
  var index = Random().nextInt(3);

  imageSelect() {
    index = Random().nextInt(3);
    if (index == 0) {
      return 'styles/img/home1.jpg';
    } else if (index == 1) {
      return 'styles/img/home2.jpg';
    } else if (index == 2) {
      return 'styles/img/home3.jpg';
    }
  }

  textSelect() {
    if (index == 0) {
      return 'Motivation is what gets you started. Habit is what keeps you going.\n-Jim Ryun';
    } else if (index == 1) {
      return 'Once you are exercising regularly, the hardest thing is to stop it.\n– Erin Gray';
    } else if (index == 2) {
      return 'Build together, Help each other, be healthy with everyone';

    }
  }

  dayColor() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                child: ClipRRect(
                  child: Container(
                      child: Stack(
                        children: <Widget>[
                          //Stack helps to overlap widgets
                          Positioned(
                              child: Container(
                                width: 1000,
                                height: 400,
                                child: ShaderMask(
                                  shaderCallback: (rect) {
                                    return LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Colors.purpleAccent, Colors.transparent],
                                    ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                                  },
                                  blendMode: BlendMode.dstIn,
                                  child: Image.asset(
                                    imageSelect(),
                                    height: 400,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )),
                          Positioned(
                            child: Container(
                                height: 250,
                                alignment: Alignment.center,
                                child: Stack(children: [
                                  Opacity(
                                    opacity:0.5,
                                    child: Text(
                                      textSelect(),
                                      style: TextStyle(
                                        fontFamily: 'beegFont',
                                        color: Colors.purpleAccent,
                                        fontSize: 24,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    textSelect(),
                                    style: TextStyle(
                                      fontFamily: 'beegFont',
                                      color: Colors.white,
                                      fontSize: 23,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ])),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 15, 30),
                child: Column(
                  children: [
                    Text(
                      'Welcome, ',
                      style: TextStyle(
                        fontFamily: 'normFont',
                        color: Colors.white70,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      (Personal_info.Fullname == '' || Personal_info.Fullname == '  '
                          || Personal_info.Fullname == '    ' || Personal_info.Fullname == '    '
                      ) ? 'User-san!' : '$name',
                      style: TextStyle(
                        fontFamily: 'normFont',
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: Text(
                  (Personal_info.choice != 6)
                      ? 'Before Engaging on any exercise, please refer to the warm up exercise first'
                      : '*You are not in a Planned Program - See in activities section to start one',
                  style: TextStyle(
                    fontFamily: 'normFont',
                    color: Colors.red,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                '^',
                style: TextStyle(
                  fontFamily: 'beegFont',
                  color: Colors.white,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0,25,0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Day',
                                    style: TextStyle(
                                      color: Colors.greenAccent,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${days[0]}',
                                  style: TextStyle(
                                      color:(days[0] == exerStorage.currDay) ? Colors.red : Colors.white,
                                      fontSize:(days[0] == exerStorage.currDay) ? 20: 15),
                                ),
                                Text(
                                  '${days[1]}',
                                  style: TextStyle(
                                      color:(days[1] == exerStorage.currDay) ? Colors.red : Colors.white,
                                      fontSize:(days[1] == exerStorage.currDay) ? 20: 15),
                                ),
                                Text(
                                  '${days[2]}',
                                  style: TextStyle(
                                      color:(days[2] == exerStorage.currDay) ? Colors.red : Colors.white,
                                      fontSize:(days[2] == exerStorage.currDay) ? 20: 15),
                                ),
                                Text(
                                  '${days[3]}',
                                  style: TextStyle(
                                      color:(days[3] == exerStorage.currDay) ? Colors.red : Colors.white,
                                      fontSize:(days[3] == exerStorage.currDay) ? 20: 15),
                                ),
                                Text(
                                  '${days[4]}',
                                  style: TextStyle(
                                      color:(days[4] == exerStorage.currDay) ? Colors.red : Colors.white,
                                      fontSize:(days[4] == exerStorage.currDay) ? 20: 15),
                                ),
                                Text(
                                  '${days[5]}',
                                  style: TextStyle(
                                      color:(days[5] == exerStorage.currDay) ? Colors.red : Colors.white,
                                      fontSize:(days[5] == exerStorage.currDay) ? 20: 15),
                                ),
                                Text(
                                  '${days[6]}',
                                  style: TextStyle(
                                      color:(days[6] == exerStorage.currDay) ? Colors.red : Colors.white,
                                      fontSize:(days[6] == exerStorage.currDay) ? 20: 15),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            width: 400.00,
                            height: 75,
                            decoration: BoxDecoration(
                              //decoration for the outer wrapper
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(10),
                              //border radius exactly to ClipRRect
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  //color of shadow
                                  spreadRadius: 5,
                                  //spread radius
                                  blurRadius: 7,
                                  // blur radius
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                  //first paramerter of offset is left-right
                                  //second parameter is top to down
                                ),
                                //you can set more BoxShadow() here
                              ],
                            ),
                          ),
                        ),
                        VerticalDivider(),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              if(Personal_info.choice == 5){showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title:  Text('No exercises!'),
                                    content: Text('Either you have finish the plan course or didn\'t start a planned activity'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'DONE'),
                                        child: const Text('DONE'),
                                      ),
                                    ],
                                  ));}
                              else if(exerStorage.eday == null){
                                exerStorage.reqAct();
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder:
                                        (context) => exerPage(),
                                    )
                                );}
                              else{showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title:  Text('Done for today'),
                                    content: Text('You have already done the exercise for today'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'DONE'),
                                        child: const Text('DONE'),
                                      ),
                                    ],
                                  ));}
                              },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: AutoSizeText('Play',
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10)),
                                  ),
                                  Flexible(child: Icon(Icons.play_arrow)),
                                ],
                              ),
                              alignment: Alignment.center,
                              width: 100.00,
                              height: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [],
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.purpleAccent,
                                    Colors.white,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: schedPage(),
                    ),
                  ],
                ),
              ),
              Container(height:50,),

            ],
          ),
        ),
      ]),
    );
  }
}

