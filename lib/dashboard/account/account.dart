
import 'package:fitrhythm/online/auth/Mainpage.dart';
import 'package:fitrhythm/startup/page4/page4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import '../../info_var.dart';
import '../../main.dart';



class accPage extends StatefulWidget {
  const accPage({Key? key}) : super(key: key);

  @override
  State<accPage> createState() => _accPageState();
}

class _accPageState extends State<accPage> {
  static var day = exerStorage.counter;
  String name = Personal_info.Fullname;


  @override
  void initState() {
    day = exerStorage.counter;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                child: SimpleUserCard(
                  userName: (Personal_info.Fullname == '' || Personal_info.Fullname == '  '
          || Personal_info.Fullname == '    ' || Personal_info.Fullname == '    '
          ) ? 'User-san' : '$name',
                  textStyle: TextStyle(color: Colors.white, fontSize: 40,),
                  userProfilePic: AssetImage("styles/img/account-25.png",),
                ),
              ),

              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      if(Personal_info.choice != 5){showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title:  Text('Still on planned exercise'),
                            content: Text('You have $day days of exercise'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'DONE'),
                                child: const Text('DONE'),
                              ),
                            ],
                          ));}
                      else{{showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title:  Text('Start a new Planned exercise?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'No'),
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () =>Navigator.pushReplacement(context,
                      MaterialPageRoute(builder:
                      (context) => page_4())),
                                child: const Text('Yes'),
                              ),
                            ],
                          ));}}
                    },
                    icons: Icons.co_present,
                    title: "Planned Exercise",
                  ),
                  SettingsItem(
                    onTap: () async {  Navigator.pushReplacement(context,
                        MaterialPageRoute(builder:
                        (context) => MainPage()));
                    },
                    icons: CupertinoIcons.repeat,
                    title: "Change to Online",
                  ),
                  SettingsItem(
                    onTap: () {

                    exerStorage.deleteData();
                      getData.deleteData();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder:
                            (context) => SelectionPage(),
                        )
                    );
                      },
                    icons: CupertinoIcons.delete_solid,
                    title: "Delete account",
                    titleStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],

              ),
            ],
          ),
    );

  }
}


