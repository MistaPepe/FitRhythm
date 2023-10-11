import 'package:fitrhythm/info_var.dart';
import 'package:flutter/material.dart';
import '../../dashboard/Dash_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';



class page_4 extends StatefulWidget {
  const page_4({Key? key}) : super(key: key);

  @override
  State<page_4> createState() => _page_4State();
}

class _page_4State extends State<page_4> with AutomaticKeepAliveClientMixin<page_4> {
  var check = false;
  var val = 4.0;
  var _value = 5.0;
  var color = 0.0;
  var show = ['Endless Plan', '1 month plan','3 month plan','6 month plan','9 month plan',];
  var descript = ['Plan Doesn\'t have end the application will continue to apply workout.',
  '1 month plan includes 30 days of activity and with only 1 day break',
  '3 month plan include 5 day workout within weekdays',
  '6 monthh plan includes 5 day workout during weekdays only',
  '9 month plan includes 5 days of workout during the week'];
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;



  @override
  Widget build(BuildContext context) {
    Color intenseColor() {
      if (color == 1) {
        return Colors.white30;
      } else if (_value == 4) {
        return Colors.yellow;
      } else if (_value == 3) {
        return Colors.orangeAccent;
      } else if (_value == 2) {
        return Colors.orange;
      } else if (_value == 5) {
        return Colors.white;
      } else {
        return Colors.red;
      }
    }

    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
                child: Column(
              children: [
                Center(
                  child: Text('Choose your Activity Plan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      )),
                ),
                AbsorbPointer(
                  absorbing: check,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slider(
                        min: 1,
                        max: 5,
                        value: _value,
                        divisions: 4,
                        label: '${_value.round()}',
                        activeColor: intenseColor(),
                        onChanged: (var value) {
                          setState(() {
                            _value = value;
                            val = _value - 1;
                            Personal_info.choice = val;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(),
                  onPressed: () {},
                  child: Text(
                    "${_value.toStringAsFixed(0)}",
                    style: TextStyle(fontSize: 40, color: intenseColor()),
                  ),
                ),

            Text(
              '${show[val.toInt()]}',
              style: TextStyle(fontSize: 25, color: intenseColor())),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                      '${descript[val.toInt()]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: intenseColor())),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 0, 30),
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: const Text(
                      'Later or nah?',
                      style: TextStyle(fontSize: 17.0, color: Colors.white),
                    ),
                    subtitle: const Text(
                      'Check this if not planning to register a planned activity workout and here for casual '
                          'activity. Note that you can register later.',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: this.check,
                    onChanged: (value) {
                      setState(() {
                        this.check = value!;
                        Personal_info.choice = 5;
                        if(value == true){color = 1;}
                        else{color = 0;}
                      });
                    },
                  ),
                ),
          ElevatedButton(onPressed:() async {
            getData.saveData();
            exerStorage.saveData();
            getData.loadData();
            exerStorage.loadData();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));
          } , child: Text('Finish Registration'))
              ],
            )
            )
        )
    );
  }
}



