
import 'package:flutter/material.dart';
import 'package:fitrhythm/dashboard/workout/workoutlist/storage/storageAlone.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import '../../Dash_nav.dart';

class actlistpick extends StatefulWidget {
  const actlistpick({Key? key}) : super(key: key);


  @override
  State<actlistpick> createState() => _actlistpickState();
}

class _actlistpickState extends State<actlistpick> {
  static var tapPick = 0;

  static List activities =  ['lib/assets/gif/exer/plank.gif','lib/assets/gif/exer/plank1.gif','lib/assets/gif/exer/plank2.gif',
  'lib/assets/gif/exer/plank3.gif','lib/assets/gif/exer/plank-walkout.gif','lib/assets/gif/exer/ironcrosses.gif',

  'lib/assets/gif/exer/pushups.gif','lib/assets/gif/exer/pushupsdecline.gif','lib/assets/gif/exer/pushupincline.gif',
  'lib/assets/gif/exer/pushupdiamond.gif','lib/assets/gif/exer/pushupwide.gif','lib/assets/gif/exer/overhead.gif',

  'lib/assets/gif/exer/lunges.gif','lib/assets/gif/exer/calf raises.gif','lib/assets/gif/exer/squat.gif',
  'lib/assets/gif/exer/squat jump.gif','lib/assets/gif/exer/wallsquat.gif','lib/assets/gif/exer/bridges.gif',

  'lib/assets/gif/exer/plankcrawl.gif','lib/assets/gif/exer/side jumping.gif',
  'lib/assets/gif/exer/skipping.gif','lib/assets/gif/exer/squat jump.gif','lib/assets/gif/exer/stair climbing.gif',

  'lib/assets/gif/exer/burpee.gif','lib/assets/gif/exer/lunges.gif','lib/assets/gif/exer/mountainclimbPlank.gif',
  'lib/assets/gif/exer/skipping.gif'
  ];
  static List actDesc = [
    'Forearm Plank', 'Plank Crunch', 'Plank Jacks',
    'Plank Piston', 'Plank-Walkout','Iron Cross',

    'Standard Push', 'Decline Push Up', 'Incline Push Up',
    'Diamond Push Up', 'Wide Push Up', 'Side Push up',

    'Back Lunges','Calf Raises','Standard Squat',
    'Squat Jump','Wall Squat','Bridges',

    'Plank Crawl','Side Jumping',
    'Skipping','Squat Jump','Stair Climbing',
    'Burpee', 'Back Lunges', 'Mountain Climb Plank', 'Skipping'

  ];

  @override
  void initState() {
    super.initState();
    tapPick = -1;
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
              height: 260,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage((tapPick == -1) ? 'styles/img/standAlone.jpg' : activities[tapPick] ),
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
            top: 240,
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
                    'Tap to preview, Double Tap to select',
                    style: TextStyle(
                      fontFamily: 'normFont',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: actDesc.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                            tapPick = index;
                          });
                            },
                          onDoubleTap: (){
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder:
                                    (context) => alonePage(activities[index],actDesc[index]),
                                )
                            );
                          },
                          child: Container(
                            color: Colors.black12,
                            height: 70,
                            child: Center(child: Text('${actDesc[index]}')),
                          ),
                        );
                      },

                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class alonePage extends StatefulWidget {
  final String desc;
  final String img;

  alonePage(this.img, this.desc);

  @override
  State<alonePage> createState() => _alonePageState();
}

class _alonePageState extends State<alonePage> {

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
                  image: AssetImage(widget.img),
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
                      'Your Chosen Workout',
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
                                  child: Text(
                                    widget.desc,
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
                                    exer.repsets(widget.desc),
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
                              exer.subDesc(widget.desc),
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
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => timer(widget.desc));
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
          });
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => actlistpick(),
              ));
        },
        label: const Text('Done'),
        icon: const Icon(Icons.play_arrow),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

class timer extends StatefulWidget {
  final timeset;
 timer(this.timeset);


  @override
  State<timer> createState() => _timerState();
}

class _timerState extends State<timer> {
  final CountDownController controller = new CountDownController();
  static var timeset = 30;

  @override
  void initState() {
    super.initState();
    timeset = sett(widget.timeset);
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

