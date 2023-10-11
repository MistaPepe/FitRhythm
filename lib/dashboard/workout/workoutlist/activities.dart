import 'package:fitrhythm/dashboard/workout/workoutlist/warmupPick.dart';
import 'package:fitrhythm/dashboard/workout/workoutlist/workoutframe.dart';
import 'package:fitrhythm/dashboard/workout/workoutlist/workouts.dart';
import 'package:flutter/material.dart';
import 'package:fitrhythm/info_var.dart';
import 'actAlonepick.dart';

class actPage extends StatefulWidget {
  const actPage({Key? key}) : super(key: key);

  @override
  State<actPage> createState() => _actPageState();
}

class _actPageState extends State<actPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              'ACTIVITIES',
              style: TextStyle(
                fontFamily: 'normFont',
                color: Colors.purple[100],
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => actlistpick(),
                        ));
                  },
                  child: Column(
                    children: [
                      Stack(
                        children: <Widget>[
                          //Stack helps to overlap widgets
                          Positioned(
                              //positioned helps to position widget wherever we want.
                              child: Container(
                            width: 1000,
                            height: 220,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                colorFilter: const ColorFilter.mode(
                                  Colors.lightGreenAccent,
                                  BlendMode.modulate,
                                ),
                                fit: BoxFit.fill,
                                image: AssetImage('styles/img/standAlone.jpg'),
                              ),
                            ),
                          )),
                          Positioned(
                            //main content container postition.
                            child: Container(
                                height: 200,
                                alignment: Alignment.center,
                                child: Text(
                                  "Stand Alone Activities",
                                  style: TextStyle(
                                    fontFamily: 'beegFont',
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Buttselect(),
                        ));
                  },
                  child: Column(
                    children: [
                      Stack(
                        children: <Widget>[
                          Positioned(
                              child: Container(
                            width: 1000,
                            height: 220,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                colorFilter: const ColorFilter.mode(
                                  Colors.lightBlueAccent,
                                  BlendMode.multiply,
                                ),
                                fit: BoxFit.fill,
                                image: AssetImage('styles/img/warmUP.jpg'),
                              ),
                            ),
                          )),
                          Positioned(
                            //main content container postition.
                            child: Container(
                                height: 200,
                                alignment: Alignment.center,
                                child: Text(
                                  'Warm Up Exercises',
                                  style: TextStyle(
                                    fontFamily: 'beegFont',
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){ if (exerStorage.eday == null) {
                    exerStorage.reqAct();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => exerPage(),
                        ));
                  } else {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('Done for today'),
                          content:
                          Text('You have already done the exercise for today'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'DONE'),
                              child: const Text('DONE'),
                            ),
                          ],
                        ));
                  }},
                  child: Stack(
                    children: <Widget>[
                      //Stack helps to overlap widgets
                      Positioned(
                          //positioned helps to position widget wherever we want.
                          child: Container(
                        width: 1000,
                        height: 220,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: const ColorFilter.mode(
                              Colors.redAccent,
                              BlendMode.modulate,
                            ),
                            fit: BoxFit.fill,
                            image: AssetImage('styles/img/workout.png'),
                          ),
                        ),
                      )),
                      Positioned(
                        //main content container postition.
                        child: Container(
                            height: 200,
                            alignment: Alignment.center,
                            child: Text(
                              "Start Planned Activity",
                              style: TextStyle(
                                fontFamily: 'beegFont',
                                color: Colors.white,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            )),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
