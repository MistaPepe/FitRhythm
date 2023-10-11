import 'package:fitrhythm/startup/page1.dart';
import 'package:fitrhythm/startup/page2/page2.dart';
import 'package:fitrhythm/startup/page3/page3.dart';
import 'package:fitrhythm/startup/page4/page4.dart';
import 'package:flutter/material.dart';


class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('FitRhythm Account Registration'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF1C0236),
                Color(0xFF50069F),
              ],
            )
        ),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(),
                        RotatedBox(
                          quarterTurns: 1,
                          child: Container(
                            width: 400,
                            margin: const EdgeInsets.only(left: 10.0, right:0.0, top:10.0, bottom:0),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(3)),
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: TabBar(
                                  isScrollable: true,
                                  unselectedLabelColor: Colors.white,
                                  labelColor: Colors.black,
                                  indicatorColor: Colors.black,
                                  indicatorWeight: 2,
                                  indicator: BoxDecoration(
                                    color: Colors.amberAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  controller: tabController,
                                  tabs: [
                                    Tab(
                                      text: 'STEP 1',

                                    ),
                                    Tab(
                                      text: 'STEP 2',
                                    ),
                                    Tab(
                                      text: 'STEP 3',
                                    ),
                                    Tab(
                                      text: 'STEP 4',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        Flexible(
                          child: TabBarView(
                            controller: tabController,
                            children: <Widget>[
                              page_1(),
                              page_2(),
                              page_3(),
                              page_4(),
                            ],
                          ),
                        ),
                       ],
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





