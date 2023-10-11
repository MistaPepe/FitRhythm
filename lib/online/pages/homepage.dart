import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitrhythm/dashboard/Dash_nav.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_board/list_acc.dart';
import 'home_board/list_post.dart';
import 'home_board/video_confe/src/pages/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  List<String> docIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('post')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
            }));
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
            backgroundColor: Colors.black87,
            leading: null,
            actions: [
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Icon(Icons.logout),
              )
            ],
            bottom: TabBar(
              indicatorColor: Colors.amberAccent,
              tabs: [
                Tab(icon: Icon(Icons.supervisor_account)),
                Tab(icon: Icon(Icons.signpost)),
              ],
            ),
            title: AutoSizeText(
              'Welcome! ' + user.email!,
              style: TextStyle(fontSize: 20),
              maxLines: 1,
            )),
        body: TabBarView(
          children: [
            list_accounts(),
            list_post(),
          ],
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(heroTag: 'dash',
              backgroundColor: Colors.blue,
              onPressed: () {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('Offline Dashboard'),
                      content:
                      Text('Go to Offline Dashboard?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: ()  => Navigator.pop(context, 'No'),
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Dashboard(),
                                ));
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    ));
              },
              child: const Icon(Icons.dashboard),
            ),
            SizedBox(height: 20,),
            FloatingActionButton(
              heroTag: 'vid',
              backgroundColor: Colors.deepOrange,
              onPressed: () {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text('Video Conference'),
                          content:
                              Text('Go to Video Conference?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: ()  => Navigator.pop(context, 'No'),
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => IndexPage(),
                                    ));
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        ));
              },
              child: const Icon(Icons.remember_me_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
