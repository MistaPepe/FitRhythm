import 'package:fitrhythm/info_var.dart';
import 'package:flutter/material.dart';
import '../../Dash_nav.dart';

class warmuppick extends StatefulWidget {
  final String listpick;

  const warmuppick(this.listpick);

  @override
  State<warmuppick> createState() => _warmuppickState();
}

class _warmuppickState extends State<warmuppick> {
  static var tapPick = 0;

  static List imgpick = [];
  static List despick = [];

  static List genWarm = [
    'lib/assets/gif/warmups/arm-circles.gif',
    'lib/assets/gif/warmups/arm strech.gif',
    'lib/assets/gif/warmups/Jumping Jacks.gif',
    'lib/assets/gif/warmups/walking-jacks-bodyweight-exercise.gif',
    'lib/assets/gif/warmups/march-arm-swing.gif',
    'lib/assets/gif/warmups/rotational jack.gif',
    'lib/assets/gif/warmups/Shoulder-roll.gif'
  ];

  static List genDes = [
    'Arm-Circles',
    'Arm Stretch',
    'Jumping Jacks',
    'Side Walk Jacks',
    'March Arm Swing',
    'Rotational Jack',
    'Shoulder roll'
  ];

  static List abb = [
    'lib/assets/gif/warmups/anklepops.gif',
    'lib/assets/gif/warmups/arm-circles.gif',
    'lib/assets/gif/warmups/frankenwalk.gif',
    'lib/assets/gif/warmups/Jumping Jacks.gif',
    'lib/assets/gif/warmups/kneehugs.gif',
    'lib/assets/gif/warmups/walkinghighknees.gif',
    'lib/assets/gif/warmups/rotational jack.gif'
  ];

  static List bb = [
    'Ankle Pop',
    'Arm-Circles',
    'Frankenstein March',
    'Jumping Jacks',
    'Knee Hugs',
    'Walking High Knees',
    'Shoulder roll'
  ];

  static List ar = [
    'lib/assets/gif/warmups/lunges.gif',
    'lib/assets/gif/warmups/cradleleg.gif',
    'lib/assets/gif/warmups/kneehugs.gif',
    'lib/assets/gif/warmups/Jumping Jacks.gif',
    'lib/assets/gif/warmups/walkinghighknees.gif'
  ];
  static List r = [
    'Lunges',
    'Cradle Leg',
    'Knee Hugs',
    'Jumping Jacks',
    'Walking High Knees'
  ];

  static List ac = [
    'lib/assets/gif/warmups/lunges.gif',
    'lib/assets/gif/warmups/cradleleg.gif',
    'lib/assets/gif/warmups/sidelunge.gif',
    'lib/assets/gif/warmups/Jumping Jacks.gif',
    'lib/assets/gif/warmups/walkinghighknees.gif',
    'lib/assets/gif/warmups/squat.gif'
  ];
  static List c = [
    'Lunges',
    'Cradle Leg',
    'Side Lunge',
    'Jumping Jacks',
    'Walking High Knees',
    'Standard Squat'
  ];

  static List at = [
    'lib/assets/gif/warmups/arm-circles.gif',
    'lib/assets/gif/warmups/arm strech.gif',
    'lib/assets/gif/warmups/rotational jack.gif',
    'lib/assets/gif/warmups/kneehugs.gif',
    'lib/assets/gif/warmups/shuffle.gif',
    'lib/assets/gif/warmups/shadowtennis.gif'
  ];
  static List t = [
    'Arm-Circles',
    'Arm Stretch',
    'Rotational Jack',
    'Knee Hugs',
    'Shuffle',
    'Shadowing'
  ];

  static List av = [
    'lib/assets/gif/warmups/arm-circles.gif',
    'lib/assets/gif/warmups/arm strech.gif',
    'lib/assets/gif/warmups/rotational jack.gif',
    'lib/assets/gif/warmups/kneehugs.gif',
    'lib/assets/gif/warmups/walkinghighknees.gif',
    'lib/assets/gif/warmups/shuffle.gif',
  ];
  static List v = [
    'Arm-Circles',
    'Arm Stretch',
    'Rotational Jack',
    'Knee Hugs',
    'Walking High Knees',
    'Shuffle'
  ];

  static List al = [
    'lib/assets/gif/warmups/arm-circles.gif',
    'lib/assets/gif/warmups/walking-jacks-bodyweight-exercise.gif',
    'lib/assets/gif/warmups/arm strech.gif',
    'lib/assets/gif/warmups/squat.gif',
    'lib/assets/gif/warmups/rotational jack.gif'
  ];
  static List l = [
    'Arm-Circles',
    'Side Walk Jacks',
    'Arm Stretch',
    'Standard Squat',
    'Rotational Jack'
  ];

  static picker(wow) {
    if (wow == 'Basketball') {
      imgpick = abb;
      despick = bb;
    }
    if (wow == 'Running') {
      imgpick = ar;
      despick = r;
    }
    if (wow == 'Cycling') {
      imgpick = ac;
      despick = c;
    }
    if (wow == 'Tennis') {
      imgpick = at;
      despick = t;
    }
    if (wow == 'Volleyball') {
      imgpick = av;
      despick = v;
    }
    if (wow == 'Lifting') {
      imgpick = al;
      despick = l;
    }
    if(wow == 'General Warm Up') {
      imgpick = genWarm;
      despick = genDes;
    }
  }

  @override
  void initState() {
    super.initState();
    picker(widget.listpick);
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
                width: 1000,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(imgpick[tapPick]),
                  ),
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
                      builder: (BuildContext context) => Buttselect(),
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
                      'Select a prefered WarmUp',
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
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: despick.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      warmpage(imgpick[index], despick[index]),
                                ));
                          },
                          child: Container(
                            color: Colors.black12,
                            height: 70,
                            child: Center(child: Text('${despick[index]}')),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
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

class Buttselect extends StatefulWidget {
  Buttselect();

  @override
  State<Buttselect> createState() => _ButtselectState();
}

class _ButtselectState extends State<Buttselect> {
  static List warmlist = [];

  @override
  void initState() {
    super.initState();
    warmlist = exerStorage.actChoise;
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
                width: 1000,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('styles/img/warmUP.jpg'),
                  ),
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
                      'Select a preferred exercise',
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
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: warmlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      warmuppick(warmlist[index]),
                                ));
                          },
                          child: Container(
                            color: Colors.black12,
                            height: 70,
                            child: Center(child: Text('${warmlist[index]}')),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
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

class warmpage extends StatefulWidget {
  final String desc;
  final String img;

  warmpage(this.img, this.desc);

  @override
  State<warmpage> createState() => _warmpageState();
}

class _warmpageState extends State<warmpage> {
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
                width: 1000,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(widget.img),
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
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '16 counts, 2 sets',
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
                              subDesc(widget.desc),
                              style: TextStyle(
                                fontFamily: 'normFont',
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            )),
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
          setState(() {});
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => warmuppick(widget.desc),
              ));
        },
        label: const Text('Done'),
        icon: const Icon(Icons.play_arrow),
        backgroundColor: Colors.pink,
      ),
    );
  }

  static subDesc(var s) {
    var handle;
    switch (s) {
      case 'Arm-Circles':
        handle =
        '1. Straighten up your posture then raise your both hands perpendicular to your body.\n'
            '2. Circle your hands by moving your shoulders in all direction\n'
            '3. Do the same with opposite direction of rolls this time.';
        break;
      case 'Arm Stretch':
        handle =
        '1. Straighten up your posture then raise your one of your arms in front of you.\n'
            '2. Use your other hand to grab your elbow and land it with your wrist.\n'
            '3. Twist your upper body to the opposite direction of one of your hands whose raised.';
        break;
      case 'Jumping Jacks':
        handle = '1. Start in a standing position.\n'
            '2. Jump, while midair, raise your hands over to head parallel to body and spread your legs to your side.\n'
            '3. Jump again while going back with a standing position.';
        break;
      case 'Side Walk Jacks':
        handle = '1. Start in a standing position.\n'
            '2. Step one foot to its side and then followed by the other foot, simultaneously both your hand raise above your head.\n'
            '3. Step with the other foot to go back to starting position, simultaneously both hands are raise down to waist level.';
        break;
      case 'March Arm Swing':
        handle = '1. in a standing position, raise and bend a foot.\n'
            '2. While raising a foot, both hands swing to front creating a cross.\n'
            '3. Raise down the leg with both hands setting to your side. Do the same with the other foot with same steps.';
        break;
      case 'Rotational Jack':
        handle = '1. in a standing position, raise both your hands perpendicular to your body.\n'
            '2. Bend your upper body facing the ground. While bending, Start twisting your stomach to your right or left\n'
            '3. Go back to starting position and end it with a jack motion to your legs.';
        break;
      case 'Shoulder roll':
        handle = '1. in a standing position, close both your hands parallel to your body.\n'
            '2. Keep your hands on side and start lifting your shoulders upward.\n'
            '3. Raise down your shoulder by doing a circle motion.';
        break;
      case 'Ankle Pop':
        handle = '1. Assume in a straight standing position.\n'
            '2. Use one of your legs and jump using only your ankle.\n'
            '3. When landing, assume in a tip toes action and then progressively jump around.';
        break;
      case 'Frankenstein March':
        handle = '1. Assume in a straight standing position.\n'
            '2. Raise one of your legs in front.\n'
            '3. While raising a leg, reach your leg with a hand. Preferably, must touch your toe.';
        break;
      case 'Knee Hugs':
        handle = '1. Assume in a straight standing position.\n'
            '2. Raise a leg and then grab its knee with both hands.\n'
            '3. Hold it tight to your center and then release.';
        break;
      case 'Walking High Knees':
        handle = '1. Assume in a straight standing position.\n'
            '2. Raise a leg up to the level of your stomach.\n'
            '3. Walk down and then do the same with the other leg.';
        break;
      case 'Lunges':
        handle = '1. On standing position, step your left foot backwards.\n'
            '2. Bend your right foot and your left foot so that your body goes down.\n'
            '3. Go back again and do the same with right foot stepping in the back.';
        break;
      case 'Cradle Leg':
        handle = '1. Assume in a standing position.\n'
            '2. Bend one of your foot in the direction of the other foot.\n'
            '3. Use your hands to lift your foot further and then stretch.';
        break;
      case 'Side Lunge':
        handle = '1. Assume in a standing position.\n'
            '2. Bend one of your foot in the direction of the side of your foot.\n'
            '3. When in place, lower down your body.';
        break;
      case 'Standard Squat':
        handle = '1. On standing position, rest your feet flat ground and pointing forwards.\n'
            '2. Bend down both your knees into a 90 degrees angle or more.\n'
            '3. Go back and straighten up again your position.';
        break;
      case 'Shuffle':
        handle = '1.Stand with your feet a little wider than hip-width apart, bend your hips and knees back and point your toes forward..\n'
            '2. Take a few quick steps to the left and then touch your left foot with your left hand.\n'
            '3. Repeat on the right side.';
        break;
      case 'Shadowing':
        handle = 'Mimic an action of striking and maneuvering like in game.\n'
            'Do this with and without a racket';
        break;
      case 'Shuffle':
        handle = '1.Stand with your feet a little wider than hip-width apart, bend your hips and knees back and point your toes forward..\n'
            '2. Take a few quick steps to the left and then touch your left foot with your left hand.\n'
            '3. Repeat on the right side.';
        break;
    }
    return handle;
  }
}

