import 'package:fitrhythm/dashboard/workout/workoutlist/activities.dart';

import 'package:fitrhythm/dashboard/workout/workoutlist/workouts.dart';
import 'package:fitrhythm/info_var.dart';
import 'package:flutter/material.dart';
import 'package:fitrhythm/assets/icons/my_flutter_app_icons.dart';
import 'account/account.dart';
import 'home/homePage.dart';
import 'package:flutter/cupertino.dart';

import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static var selected = 0;
  static PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: selected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF1C0236),
            Color(0xFF3D067A),
          ],
        )),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: const [
            homePage(),
            actPage(),
            accPage(),
          ],
        ),
      ),
      bottomNavigationBar: StylishBottomBar(
        items: [
          BubbleBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          BubbleBarItem(
            icon: const Icon(Icons.accessibility),
            title: const Text('Activities'),
          ),
          BubbleBarItem(
            icon: const Icon(Icons.account_circle),
            title: const Text('Account'),
          ),
        ],
        fabLocation: StylishBarFabLocation.end,
        hasNotch: true,
        iconSize: 32,
        barStyle: BubbleBarStyle.horizotnal,
        bubbleFillStyle: BubbleFillStyle.outlined,
        backgroundColor: Colors.white,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index!;
            controller.jumpToPage(index);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
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
          else if(exerStorage.eday == null) {
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
          }
        },
        child: const Icon(MyFlutterApp.heartbeat, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
