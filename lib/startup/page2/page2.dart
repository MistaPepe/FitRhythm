import 'package:flutter/material.dart';
import 'package:fitrhythm/startup/page2/bmi_cal.dart';
import '../../info_var.dart';
import 'age_wid.dart';
import 'gender.dart';
import 'measurements.dart';

class page_2 extends StatefulWidget {
  const page_2({super.key});

  @override
  State<page_2> createState() => _page_2State();
}

class _page_2State extends State<page_2> with AutomaticKeepAliveClientMixin<page_2> {
  static int _age = 30;
  late String fname;
  String mname = '';
  String lname = '';

  final _fncontroller = TextEditingController();
  final _lncontroller = TextEditingController();
  final _mncontroller = TextEditingController();

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _fncontroller.dispose();
    _lncontroller.dispose();
    _mncontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: _fncontroller,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.amberAccent, width: 1),
                      ),
                      border: UnderlineInputBorder(),
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.white)),
                  onChanged:(text){
                    setState(() {
                      fname = text;
                      Personal_info.Fullname = fname + ' ' + mname + ' ' + lname;
                    });},
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: _mncontroller,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.amberAccent, width: 1),
                      ),
                      border: UnderlineInputBorder(),
                      labelText: 'Middle',
                      labelStyle: TextStyle(color: Colors.white)),
                  onChanged:(text){
                    setState(() {
                      mname = text;
                      Personal_info.Fullname = fname + ' ' + mname + ' ' + lname;

                    });},
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: _lncontroller,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent, width: 1),
                ),
                border: UnderlineInputBorder(),
                labelText: 'Last Name',
                labelStyle: TextStyle(color: Colors.white)),
            onChanged:(text){
              setState(() {
                lname = text;
                Personal_info.Fullname = fname + ' ' + mname + ' ' + lname;
              });},
          ),
        ),
        Row(
          children: [
            Expanded(child: HeightButt()),
            Expanded(child: WeightButt()),
          ],
        ),
        GenderCall(),
        AgeWeightWidget(
            onChange: (ageVal) {
              _age = ageVal;
              Personal_info.Age = _age;
            },
            title: "Age",
            initValue: 20,
            min: 0,
            max: 200),
        Row(
          children: const [
            Flexible(
              flex: 1,
              child: Center(child: BmiResCal()),
            ),
          ],
        ),
      ],
    );
  }
}

