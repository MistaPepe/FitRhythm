
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitrhythm/dashboard/workout/workoutlist/timer.dart';
import 'package:fitrhythm/dashboard/workout/workoutlist/workouts.dart';
import 'package:flutter/material.dart';
import 'package:fitrhythm/dashboard/workout/workoutlist/storage/storage.dart';
import 'package:fitrhythm/info_var.dart';

class workoutPage extends StatefulWidget {
  const workoutPage({Key? key}) : super(key: key);

  static List progress = [0, 0, 0, 0, 0, 0];

  @override
  State<workoutPage> createState() => _workoutPageState();
}

class _workoutPageState extends State<workoutPage> {
  static int choice = 1;
  static List<String> currExer = [];
  static int index = 0;
  static List<String> listexer = [];

  @override
  void initState() {
    super.initState();
    choice = exerStorage.actplan;
    listexer = exer.exerPick(choice);
    currExer = exer.exerDes(choice);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox.expand(
            child: Container(
              color: Colors.white,
            ),
          ),
          Positioned(
            child: IntrinsicWidth(
              child: Container(
                width: 500,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(listexer[index]),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: 280,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Today\'s Workout',
                      style: TextStyle(
                        fontFamily: 'normFont',
                        color: Colors.black,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                      children: <Widget>[
                        Container(
                            margin:
                                const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 50,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    currExer[index],
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontFamily: 'beegFont',
                                      color: Colors.black,
                                      fontSize: 25,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    exer.repsets(currExer[index]),
                                    style: TextStyle(
                                      fontFamily: 'normFont',
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin:
                                const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            alignment: Alignment.center,
                            child: Text(
                              exer.subDesc(currExer[index]),
                              style: TextStyle(
                                fontFamily: 'normFont',
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            )),
                        FloatingActionButton.extended(
                          heroTag: "btn1",
                            backgroundColor: Colors.orangeAccent,
                            onPressed: () {
                            exerStorage.cuExer = currExer[index];
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => timer());
                            },
                            label: Text('Start Exercise'),
                          ),
                        Container(
                            height: 200,
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "btn2",
        onPressed: () {
          setState(() {
            workoutPage.progress[index] = exer.calCal(choice);
            index++;
          });
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => exerPage(),
              ));
        },
        label: const Text('Next'),
        icon: const Icon(Icons.play_arrow),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
