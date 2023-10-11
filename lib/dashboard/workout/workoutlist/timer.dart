import 'dart:async';
import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

import '../../../info_var.dart';

class timer extends StatefulWidget {
  const timer({Key? key}) : super(key: key);


  @override
  State<timer> createState() => _timerState();
}

class _timerState extends State<timer> {
  final CountDownController controller = new CountDownController();
  static var timeset = 30;

  @override
  void initState() {
    super.initState();
    timeset = sett(exerStorage.cuExer);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                  title:  Text('$timeset seconds'),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NeonCircularTimer(
                          autoStart: false,
                          onComplete: () {},
                          width: 200,
                          controller: controller,
                          duration: timeset,
                          strokeWidth: 10,
                          isTimerTextShown: true,
                          neumorphicEffect: true,
                          outerStrokeColor: Colors.grey.shade100,
                          innerFillGradient: LinearGradient(colors: [
                            Colors.greenAccent.shade200,
                            Colors.blueAccent.shade400
                          ]),
                          neonGradient: LinearGradient(colors: [
                            Colors.greenAccent.shade200,
                            Colors.blueAccent.shade400
                          ]),
                          strokeCap: StrokeCap.round,
                          innerFillColor: Colors.black12,
                          backgroudColor: Colors.grey.shade100,
                          neonColor: Colors.blue.shade900),
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.play_arrow),
                                  onPressed: () {
                                    controller.resume();
                                  }),
                              IconButton(
                                  icon: Icon(Icons.pause),
                                  onPressed: () {
                                    controller.pause();
                                  }),
                              IconButton(
                                  icon: Icon(Icons.repeat),
                                  onPressed: () {
                                    controller.restart();
                                  }),
                            ]),
                      )
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'DONE'),
                      child: const Text('DONE'),
                    ),
                  ],
    );
  }  static sett(c){
    List minset = ['Forearm Plank', 'Plank Crunch', 'Plank Jacks',
      'Plank Piston', 'Plank-Walkout','Iron Cross'];
    List min3set = ['Stair Climbing', 'Skipping', 'Squat Jump',
      'Side Jumping', 'Plank-Walkout', 'Burpee'];
    if(minset.contains(c)){return 60;}
    if(min3set.contains(c)){return 180;}
    else{return 30;}
  }
}



