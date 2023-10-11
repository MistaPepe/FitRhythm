import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitrhythm/dashboard/workout/workoutlist/storage/progress.dart';
import 'package:fitrhythm/dashboard/workout/workoutlist/workoutframe.dart';
import 'package:flutter/material.dart';
import 'package:fitrhythm/dashboard/workout/workoutlist/storage/storage.dart';
import 'package:fitrhythm/info_var.dart';
import '../../Dash_nav.dart';

class exerPage extends StatefulWidget {
  const exerPage({Key? key}) : super(key: key);

  @override
  State<exerPage> createState() => _exerPageState();
}

class _exerPageState extends State<exerPage> {
  static int choice = 1;
  static int index = -1;
  static List<String> listexer = [];


  @override
  void initState() {
    super.initState();
    index++;
    print(index);
    titleExer(exerStorage.actplan);
    choice = exerStorage.actplan;
    listexer = exer.exerPick(choice);
  }

  static titleExer(int i){
    if(i == 1){return 'Abs Strengthening Workout';}
    else if(i == 2){return 'Chest and Triceps Workout';}
    else if(i == 3){return 'Lower Body Workout';}
    else if(i == 4){return 'Cardio and Endurance Workout';}
    else if(i == 5){return 'Simple Home Exercises';}
    else{}
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
            child: Container(
              width: 500,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage((index != 6) ? listexer[index]: 'lib/assets/gif/done.gif'),
                ),
              ),
            ),
          ),
          Positioned(
              left: 30,
              top: 30,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Dashboard(),
                    ),
                  );
                },
                child: Icon(Icons.arrow_back, color: Colors.red, size: 40),
              )),
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
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      children: <Widget>[
                        Container(
                            margin:
                                const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 90,
                            alignment: Alignment.center,
                            child: AutoSizeText((index != 6) ?
                              titleExer(exerStorage.actplan) : 'YAYYY! YOUWVE DWUONE DUWA EKSUSAISU UWU',
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: 'beegFont',
                                color: Colors.black54,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            )),
                        progBar(),
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
        onPressed: () {
          if (index != 6) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => workoutPage(),
                )
            );
          }
          else if (index == 6){
            doneExer();
            exerStorage.progcal();
            exerStorage.saveData();
            exerStorage.eday = exerStorage.currDay;
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => Dashboard(),
                ));
          }
        },
        label:Text((index != 6)?'Play':'Go back to HOME'),
        icon: Icon((index != 6)?Icons.play_arrow:Icons.home),
        backgroundColor: Colors.pink,
      ),
    );
  }
  static doneExer(){
    for (int i = 0; i < listexer.length;i++){
      exerStorage.dayProg =  exerStorage.dayProg + progBar.prog[i];
    }
  }

}
