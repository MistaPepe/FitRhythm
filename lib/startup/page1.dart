import 'package:flutter/material.dart';


class page_1 extends StatelessWidget {
  const page_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('To start the application, you need to register an Offline account.\n'
                'Later, you can register an Online account along with the data that is register in offline account.\n\n'
                'Throught out the course of registration, you can calculate your BMI, set planner, set role and many more.'
                '\n',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17.0, color: Colors.white),
            ),
          ),
    Text('To navigate the registration form, swipe left or right of your screen. Or you can navigate by clicking the STEPS on the left screen',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 17.0, color: Colors.amberAccent),
    ),
          Image.asset(
            "styles/img/swipeGuide.gif",
            height: 250.0,
            width: 250.0,
            color: Colors.amberAccent,
          ),
    Text('*Your information will be confidential*', style: TextStyle(fontSize: 17.0, color: Colors.red),),
        ],
      ),
    );
  }
}
