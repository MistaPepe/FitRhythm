import 'package:fitrhythm/startup/tabbarPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fitrhythm/info_var.dart';
import 'dart:async';
import 'dashboard/Dash_nav.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectionPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SelectionPage extends StatefulWidget {
  @override
  _SelectionPageState createState() => _SelectionPageState();
}
class _SelectionPageState extends State<SelectionPage> {

  @override
  void initState() {
    super.initState();
    getData.loadData();
    exerStorage.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
      gradient: LinearGradient(
      colors: [Colors.lightBlue.shade800, Colors.purple.shade800],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      )),

      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter:
              ColorFilter.mode(Colors.transparent.withOpacity(0.4),
                  BlendMode.srcATop),
              image: AssetImage('styles/img/logopic.png'))
        ),
        child: Scaffold(
          backgroundColor:Colors.transparent,
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Image.asset('styles/img/logotitle.png'),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
                      child: Text('Press anywhere on the screen! (exept for back button and the others)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              if(Personal_info.hasAcc == false){

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:
                    (context) => TabBarPage()
              )
                );
              }
              if(Personal_info.hasAcc == true){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:
                    (context) => Dashboard()
                    )
                );
              }
            },
          ),
        ),
      ),
    );

  }
}

