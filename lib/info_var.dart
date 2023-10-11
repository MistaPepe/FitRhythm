library fitrhythm.globals;
import 'dart:convert';
import 'dart:core';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class Personal_info {
  static int pick = 0;
  static bool hasAcc = false; //0
  static int Age = 20; //1
  static late String Fullname; //2
  static double weight = 30; //3
  static double height = 130; //4
  static int gender = 1; //1 boy 2 girl
  static var BMIres; //6
  static var Bmical; //7
  static String Role = 'Student'; //8
  static double intensity = 0; //9
  static bool muscle = false;
  static double choice = 4; // ['1 day','1 month','3 mothns','6 months','9 months','non'];
  //10
  static int pacing = 1; //11
  static List<String> athPref = []; //1 basketball 2 cycling 3 running 4 tennis 5 volleyball 6 lifting
  //12
  static double Progress = 0;
}

class getData {


  static Future loadData() async {
    final prefs = await SharedPreferences.getInstance();
    Personal_info.hasAcc = (prefs.getBool('hasAcc') ?? false); //0
    Personal_info.Age = (prefs.getInt('Age') ?? 20);//1
    Personal_info.Fullname = (prefs.getString('Fullname')) ?? ''; //2
    Personal_info.weight = (prefs.getDouble('weight'))?? 30; //3
    Personal_info.height = (prefs.getDouble('height'))?? 130; //4
    Personal_info.gender = (prefs.getInt('gender')) ?? 1; //1 boy 2 girl         //5
    Personal_info.BMIres = (prefs.getString('BMIres')) ?? 0;//6
    Personal_info.Bmical = (prefs.getInt('Bmical'))?? 0;//7
    Personal_info.Role = (prefs.getString('Role')) ?? 'Student'; //8
    Personal_info.intensity = (prefs.getDouble('intensity')) ?? 0; //9
    Personal_info.muscle = (prefs.getBool('muscle')) ?? false; //9
    Personal_info.choice = (prefs.getDouble('choice')) ?? 5; // ['1 day','1 month','3 mothns','6 months','9 months','non'];
    //10
    Personal_info.pacing = (prefs.getInt('pacing')) ?? 1; //11
    //12
    Personal_info.Progress = (prefs.getDouble('Progress')) ?? 0;
  }

  static Future saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Personal_info.hasAcc = true;
    prefs.setBool('hasAcc', Personal_info.hasAcc);
    prefs.setInt('Age', Personal_info.Age);
    prefs.setString('Fullname', Personal_info.Fullname);
    prefs.setDouble('weight', Personal_info.weight);
    prefs.setDouble('height', Personal_info.height);
    prefs.setInt('gender', Personal_info.gender);
    prefs.setString('BMIres', Personal_info.BMIres);
    prefs.setInt('Bmical', Personal_info.Bmical);
    prefs.setString('Role', Personal_info.Role);
    prefs.setDouble('intensity', Personal_info.intensity);
    prefs.setBool('muscle', Personal_info.muscle);
    prefs.setDouble('choice', Personal_info.choice);
    prefs.setInt('pacing', Personal_info.pacing);
    prefs.setDouble('Progress', Personal_info.Progress);
  }

  static void deleteData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('hasAcc', false);
    prefs.setInt('Age', 20);
    prefs.setString('Fullname', '');
    prefs.setDouble('weight', 30);
    prefs.setDouble('height', 130);
    prefs.setInt('gender', 1);
    prefs.setString('BMIres', '');
    prefs.setInt('Bmical', 0);
    prefs.setInt('Role', 1);
    prefs.setDouble('intensity', 0);
    prefs.setBool('muscle', false);
    prefs.setInt('choice', 4);
    prefs.setInt('pacing', 1);
    prefs.setDouble('Progress', 0);
  }

  static printtest() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('Fullname'));
  }

}

class exerStorage {
  static List time =[-1,30,90,180,270];
  static var seletime = time[Personal_info.choice as int];
  static List months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  static List days = [];
  static var fday = 0;
  static var cWD = DateTime.now();
  static var currDay = cWD.day;
  static var eday;
  static var cuExer;
  static var currmonth = cWD.month;
  static var counter = 0;

  static double dayProg = 0;
  static double day1 = 0;
  static double day2 = 0;
  static double day3 = 0;
  static double day4 = 0;
  static double day5 = 0;
  static double day6 = 0;
  static double day7 = 0;

  static int actplan = 0;

  static bool basketball = false;
  static bool running = false;
  static bool cycling = false;
  static bool tennis = false;
  static bool volleyball = false;
  static bool lifting = false;
  static List actChoise = ['General Warm Up'];

  static Future firstday() async {
    final SharedPreferences exer = await SharedPreferences.getInstance();

    if (exer.getInt('fday') == null || currDay == (exer.getInt('fday')! + 7)) {
      exer.setInt('fday', currDay);
      fday = exer.getInt('fday') ?? currDay;
    }

      for (int i = 0, j = 0, k = 1; i < 7; i++) {
        if(k > 1){days.add(k);k++;}
        else if(months[currmonth-1] == j) {days.add(k);k++;}
        else {j = fday + i;
        days.add(j);}

    }
  }

  static Future incriExer() async{
    final SharedPreferences exer = await SharedPreferences.getInstance();
    counter++;
    exer.setInt('counter', counter);
    if(counter == seletime){exer.setInt('counter', 0); Personal_info.choice = 5;}
  }


  static Future deleteData() async {
    final SharedPreferences exer = await SharedPreferences.getInstance();
    exer.setDouble('day1', 0);
    exer.setDouble('day2', 0);
    exer.setDouble('day3', 0);
    exer.setDouble('day4', 0);
    exer.setDouble('day5', 0);
    exer.setDouble('day6', 0);
    exer.setDouble('day7', 0);
    exer.setInt('eday', 0);
    exer.setBool('basketball', false);
    exer.setBool('running', false);
    exer.setBool('cycling', false);
    exer.setBool('tennis', false);
    exer.setBool('volleyball', false);
    exer.setBool('lifting', false);
    actChoise = ['General Warm Up'];
  }

  static Future loadData() async {
    final SharedPreferences exer = await SharedPreferences.getInstance();
    counter = exer.getInt('counter') ?? 0;
    fday = exer.getInt('fday') ?? currDay;
    basketball = exer.getBool('basketball')?? false;
    running = exer.getBool('running')?? false;
    cycling = exer.getBool('cycling')?? false;
    tennis = exer.getBool('tennis')?? false;
    volleyball = exer.getBool('volleyball')?? false;
    lifting = exer.getBool('lifting')?? false;
    eday = exer.getInt('eday') ?? null;
    day1 = exer.getDouble('day1') ?? 0;
    day2 = exer.getDouble('day2') ?? 0;
    day3 = exer.getDouble('day3') ?? 0;
    day4 = exer.getDouble('day4') ?? 0;
    day5 = exer.getDouble('day5') ?? 0;
    day6 = exer.getDouble('day6') ?? 0;
    day7 = exer.getDouble('day7') ?? 0;
    if(currDay != eday){eday = null;}
    firstday();
    reqAct();
    actCal();
  }

  static Future saveData() async {
    final SharedPreferences exer = await SharedPreferences.getInstance();
    exer.setBool('basketball',basketball);
    exer.setBool('running',running);
    exer.setBool('cycling',cycling);
    exer.setBool('tennis',tennis);
    exer.setBool('volleyball',volleyball);
    exer.setBool('lifting',lifting);
    exer.setDouble('day1',day1);
    exer.setDouble('day2',day2);
    exer.setDouble('day3',day3);
    exer.setDouble('day4',day4);
    exer.setDouble('day5',day5);
    exer.setDouble('day6',day6);
    exer.setDouble('day7',day7);
  }

  static Future progcal() async{
    final SharedPreferences exer = await SharedPreferences.getInstance();
    if(currDay == fday){day1 = dayProg;}
    if(currDay == fday+1){day2 = dayProg;}
    if(currDay == fday+2){day3 = dayProg;}
    if(currDay == fday+3){day4 = dayProg;}
    if(currDay == fday+4){day5 = dayProg;}
    if(currDay == fday+5){day6 = dayProg;}
    if(currDay == fday+6){day7 = dayProg;}
    exer.setInt('eday',currDay);
    if(exer.getInt('counter') == null){counter++;}
    else{incriExer();}
  }

  static Future actCal() async {
    if(basketball == true){actChoise.add('Basketball');}
    if(running == true){actChoise.add('Running');}
    if(cycling == true){actChoise.add('Cycling');}
    if(tennis == true){actChoise.add('Tennis');}
    if(volleyball == true){actChoise.add('Volleyball');}
    if(lifting == true){actChoise.add('Lifting');}
    var distinctIds = actChoise.toSet().toList();
    return actChoise = distinctIds;
  }

  static Future reqAct() async {
    List pick = [5];
    if(Personal_info.muscle == false) {
      if (tennis == true || volleyball == true) {
        pick.add(1);
      }
      if (lifting == true) {
        pick.add(2);
      }
      if (running == true || cycling == true || basketball == true) {
        pick.add(3);
      }
    }
    else{pick = [1,2,3,4];}
    if(Personal_info.intensity != 0 && !pick.contains(4)){pick.add(4);}
    var intValue = Random().nextInt(pick.length);
    var distinctIds = pick.toSet().toList();
    actplan = distinctIds[intValue];
  }

  static Future testing() async {
    final SharedPreferences exer = await SharedPreferences.getInstance();
  print(exer.getBool('basketball'));
    print(exer.getBool('running'));
    print(exer.getBool('tennis'));
    print(exer.getBool('cycling'));
    print(exer.getBool('volleyball'));
    print(exer.getBool('lifting'));

  }

}
