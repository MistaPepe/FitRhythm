import 'package:fitrhythm/startup/page3/pace.dart';
import 'package:fitrhythm/startup/page3/student_teacher.dart';
import 'package:flutter/material.dart';
import 'package:fitrhythm/info_var.dart';
import 'package:fitrhythm/assets/icons/my_flutter_app_icons.dart';

import '../page4/page4.dart';

class page_3 extends StatefulWidget {
  const page_3({Key? key}) : super(key: key);

  @override
  State<page_3> createState() => _page_3State();
}

class _page_3State extends State<page_3>
    with AutomaticKeepAliveClientMixin<page_3> {
  bool first = false;
  bool second = false;
  bool basketball = false;
  bool running = false;
  bool cycling = false;
  bool tennis = false;
  bool volleyball = false;
  bool lifting = false;
  bool fast = false;
  bool slow = false;
  String pace = '0';
  int counter = 0;
  double _currentSliderValue = 20;
  static int dweight = 50;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {

    Color eneColor() {
      if (first == false) {
        return Colors.white10;
      } else {
        return Colors.red;
      }
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.transparent,
          padding: new EdgeInsets.all(22.0),
          child: ListView(
            children: <Widget>[
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Choose a role',
                style: TextStyle(fontSize: 20.0, color: Colors.amberAccent),
              ),
              SetRole(),
              const Text(
                '\nChoose your Preference for your activity',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.amberAccent,
                ),
              ),
              CheckboxListTile(
                secondary: const Icon(MyFlutterApp.heartbeat,
                    color: Colors.deepOrange),
                title: const Text(
                  'Loose weight',
                  style: TextStyle(fontSize: 17.0, color: Colors.white),
                ),
                subtitle: const Text(
                  'Cardio and endurance (select desired weight)',
                  style: TextStyle(color: Colors.white),
                ),
                value: this.first,
                onChanged: (value) {
                  setState(() {
                    this.first = value!;
                    if(this.first == false){Personal_info.intensity = 0;}
                  });
                },
              ),
              AbsorbPointer(
                absorbing: !first,
                child: Text(
                  dweight.toString() + ' kg',
                  style: TextStyle(fontSize: 20, color: eneColor()),
                ),
              ),
              AbsorbPointer(
                absorbing: !first,
                child: Slider(
                  activeColor: eneColor(),
                  thumbColor: Colors.white,
                  value: _currentSliderValue,
                  min: 20,
                  label: _currentSliderValue.round().toString(),
                  max: Personal_info.weight.toDouble() -1,
                  onChanged: (value) {
                    setState(() {
                      _currentSliderValue = value;
                      dweight = value.ceil();
                      Personal_info.intensity = Personal_info.weight - dweight;
                    });
                  },
                ),
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: const Icon(MyFlutterApp.weight_hanging,
                    color: Colors.deepOrange),
                title: const Text(
                  'Muscle train',
                  style: TextStyle(fontSize: 17.0, color: Colors.white),
                ),
                subtitle: const Text(
                  'Toning muscle. This can include weight gain\n',
                  style: TextStyle(color: Colors.white),
                ),
                value: this.second,
                onChanged: (value) {
                  setState(() {
                    this.second = value!;
                    Personal_info.muscle = this.second;
                  });
                },
              ),


                                                          //athletic pref
              Row(
                children: [
                  Text(
                    'Athletic Preference',
                    style: TextStyle(fontSize: 20.0, color: Colors.lightBlue),
                  ),
                 Text(
                   ' (Maximum of 3)',
                   style: TextStyle(fontSize: 13.0, color: Colors.lightBlue),
                 ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 200.0,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[


                Stack(
                alignment: Alignment.topCenter,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          if(counter<3) {
                            basketball = !basketball;
                            if(basketball == true){
                              counter++;
                              exerStorage.basketball = basketball;
                            }
                            else {counter--; exerStorage.basketball = basketball;}
                          }
                          else if (counter == 3){
                            if(basketball == true) {basketball = false; counter--;exerStorage.basketball = basketball;}
                          }
                        });
                        },
                      child: Column(
                        children: [
                          Container(
                              width: 160.0,
                              height:170,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.purple[400]!, Colors.amber],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Image.asset(
                                      'styles/img/basketball.jpg',
                                      height: 100,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'BASKETBALL',
                                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.bottomCenter,
                            child: Icon((basketball == false) ?
                            Icons.circle_outlined : Icons.circle_rounded,
                              size: 20.0,
                              color: (basketball == false) ? Colors.white: Colors.orangeAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(width: 20.0,),


                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          if(counter<3) {
                            cycling = !cycling;
                            if(cycling == true){
                              counter++;
                              exerStorage.cycling = cycling;
                            }
                            else {counter--;
                            exerStorage.cycling = cycling;}
                          }
                          else if (counter == 3){
                            if(cycling == true) {cycling = false; counter--;exerStorage.cycling = cycling;}
                          }
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                              width: 160.0,
                              height:170,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.purple[400]!, Colors.redAccent],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Image.asset(
                                      'styles/img/cycling.jpg',
                                      height: 100,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'CYCLING',
                                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.bottomCenter,
                            child: Icon((cycling == false) ?
                            Icons.circle_outlined : Icons.circle_rounded,
                              size: 20.0,
                              color: (cycling == false) ? Colors.white: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(width: 20.0,),



                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              if(counter<3) {
                                running = !running;
                                if(running == true){
                                  counter++;
                                  exerStorage.running = running;
                                }
                                else {counter--;exerStorage.running = running;}
                              }
                              else if (counter == 3){
                                if(running == true) {running = false; counter--;exerStorage.running = running;}
                              }
                            });

                          },
                          child: Column(
                            children: [
                              Container(
                                  width: 160.0,
                                  height:170,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [Colors.purple[400]!, Colors.lightGreen],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Image.asset(
                                          'styles/img/running.png',
                                          height: 100,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'RUNNING',
                                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                alignment: Alignment.bottomCenter,
                                child: Icon((running == false) ?
                                Icons.circle_outlined : Icons.circle_rounded,
                                  size: 20.0,
                                  color: (running == false) ? Colors.white: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(width: 20.0,),


                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              if(counter<3) {
                                tennis = !tennis;
                                if(tennis == true){
                                  counter++;
                                  exerStorage.tennis = tennis;
                                }
                                else {counter--;exerStorage.tennis = tennis;}
                              }
                              else if (counter == 3){
                                if(tennis == true) {tennis = false; counter--;exerStorage.tennis = tennis;}
                              }
                            });

                          },
                          child: Column(
                            children: [
                              Container(
                                  width: 160.0,
                                  height:170,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [Colors.purple[400]!, Colors.lightBlue],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Image.asset(
                                          'styles/img/tennis.jpg',
                                          height: 100,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'TENNIS',
                                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                alignment: Alignment.bottomCenter,
                                child: Icon((tennis == false) ?
                                Icons.circle_outlined : Icons.circle_rounded,
                                  size: 20.0,
                                  color: (tennis == false) ? Colors.white: Colors.lightBlue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(width: 20.0,),


                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              if(counter<3) {
                                volleyball = !volleyball;
                                if(volleyball == true){
                                  counter++;
                                  exerStorage.volleyball = volleyball;
                                }
                                else {counter--;exerStorage.volleyball = volleyball;}
                              }
                              else if (counter == 3){
                                if(volleyball == true) {volleyball = false; counter--;exerStorage.volleyball = volleyball;}
                              }
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                  width: 160.0,
                                  height:170,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [Colors.purple[400]!, Colors.purple[100]!],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Image.asset(
                                          'styles/img/volleyball.jpg',
                                          height: 100,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'VOLLEYBALL',
                                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                alignment: Alignment.bottomCenter,
                                child: Icon((volleyball == false) ?
                                Icons.circle_outlined : Icons.circle_rounded,
                                  size: 20.0,
                                  color: (volleyball == false) ? Colors.white: Colors.purple[100]!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(width: 20.0,),


                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              if(counter<3) {
                                lifting = !lifting;
                                if(lifting == true){
                                  counter++;
                                  exerStorage.lifting = lifting;
                                }
                                else {counter--;exerStorage.lifting = lifting;}
                              }
                              else if (counter == 3){
                                if(lifting== true) {lifting = false; counter--;exerStorage.lifting = lifting;}
                              }
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                  width: 160.0,
                                  height:170,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [Colors.purple[400]!, Colors.blueGrey[300]!],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Image.asset(
                                          'styles/img/lifting.jpg',
                                          height: 100,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'LIFTING',
                                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                alignment: Alignment.bottomCenter,
                                child: Icon((lifting == false) ?
                                Icons.circle_outlined : Icons.circle_rounded,
                                  size: 20.0,
                                  color: (lifting == false) ? Colors.white: Colors.blueGrey[300]!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Text(
                '\nChoose your pacing',
                style: TextStyle(fontSize: 20.0, color: Colors.lightBlue),
              ),

              paceCall(),

              FractionallySizedBox(
                alignment: Alignment.topCenter,
                widthFactor: 0.5,
                child: Container(
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



