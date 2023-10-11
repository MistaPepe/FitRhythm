import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fitrhythm/info_var.dart';


class BmiResCal extends StatefulWidget {
  const BmiResCal({Key? key}) : super(key: key);


  @override
  State<BmiResCal> createState() => _BmiResCalState();
}

class _BmiResCalState extends State<BmiResCal>  with AutomaticKeepAliveClientMixin<BmiResCal>{
  static double slope = 0;

  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: FloatingActionButton(
        tooltip: 'Calculate my BMI',
        onPressed: () {
          Personal_info.Bmical = Personal_info.weight / pow(Personal_info.height / 100, 2);

          if (Personal_info.Age < 20 && Personal_info.gender == 1) {

            if(Personal_info.Age>=2 && Personal_info.Age<=5)
            {
              slope = ((Personal_info.Age - 2) * .4);

              if ((14.8 - slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Under Weight';
              }
              else if ((18.2 - slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Normal';
              }
              else if ((19.2 - slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Over Weight';
              }
              else {
                Personal_info.BMIres = 'Obese';
              }
            }

            else if(Personal_info.Age>=6 && Personal_info.Age<=10)
            {
              slope = ((Personal_info.Age - 6) * .3);

              if ((13.8 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Under Weight';
              }
              else if ((17 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Normal';
              }
              else if ((18.2 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Over Weight';
              }
              else {
                Personal_info.BMIres = 'Obese';
              }
            }
            else if(Personal_info.Age>=11 && Personal_info.Age<=15)
            {
              slope = ((Personal_info.Age - 11) * .65 );

              if ((14.6 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Under Weight';
              }
              else if ((20.2 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Normal';
              }
              else if ((23.2 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Over Weight';
              }
              else {
                Personal_info.BMIres = 'Obese';
              }
            }
            else if(Personal_info.Age>=16 && Personal_info.Age<=19)
            {
              slope = ((Personal_info.Age - 16) * .6 );

              if ((17 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Under Weight';
              }
              else if ((24.2 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Normal';
              }
              else if ((27.4 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Over Weight';
              }
              else {
                Personal_info.BMIres = 'Obese';
              }
            }
          }


          else if (Personal_info.Age < 20 && Personal_info.gender == 2){
            if(Personal_info.Age>=2 && Personal_info.Age<=5) {
              slope = ((Personal_info.Age - 2) * .4);

              if ((14.4 - slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Under Weight';
              }
              else if ((18 - slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Normal';
              }
              else if ((19 - slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Over Weight';
              }
              else {
                Personal_info.BMIres = 'Obese';
              }
            }
            else if (Personal_info.Age >= 6 && Personal_info.Age <= 10) {
              slope = ((Personal_info.Age - 6) * .4 );

              if ((13.2 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Under Weight';
              }
              else if ((17 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Normal';
              }
              else if ((18.8 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Over Weight';
              }
              else {
                Personal_info.BMIres = 'Obese';
              }
            }
            else if (Personal_info.Age >= 11 && Personal_info.Age <= 15) {
              slope = ((Personal_info.Age - 11) * .65 );

              if ((14.4 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Under Weight';
              }
              else if ((20.8 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Normal';
              }
              else if ((24 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Over Weight';
              }
              else {
                Personal_info.BMIres = 'Obese';
              }
            }
            else if (Personal_info.Age >= 16 && Personal_info.Age <= 19) {
              slope = ((Personal_info.Age - 16) * .4 );

              if ((16.8 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Under Weight';
              }
              else if ((24.8 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Normal';
              }
              else if ((28.8 + slope) > Personal_info.Bmical) {
                Personal_info.BMIres = 'Over Weight';
              }
              else {
                Personal_info.BMIres = 'Obese';
              }
            }
          }

          else{
            if (18.5 > Personal_info.Bmical) {
              Personal_info.BMIres = 'Under Weight';
            }
            else if (24.9 > Personal_info.Bmical) {
              Personal_info.BMIres = 'Normal';
            }
            else if (29.9 > Personal_info.Bmical) {
              Personal_info.BMIres = 'Over Weight';
            }
            else{
              Personal_info.BMIres = 'Obese';
            }
          }
          print(slope);
          print(Personal_info.height);
          print(Personal_info.weight);
          print(Personal_info.Bmical);
          print(Personal_info.BMIres);
          showAlertDialog(context);

        },
        backgroundColor: Colors.orangeAccent,
        child: const Text('BMI'),

      ),

    );

  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        setState(() {
        });
        Navigator.of(context).pop();
      },
    );

    showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) => AlertDialog(
              title: Text('BODY MASS INDEX result: '),
              content: Row(
                children: [
                  Flexible(
                    flex:1,
                    child: Text(
                      "${Personal_info.Bmical.toStringAsFixed(1)}      :      ${Personal_info.BMIres}",
                    ),
                  ),
                ],
              ),
              actions: [
                okButton,
              ]
          ),
        )
    );
  }
}