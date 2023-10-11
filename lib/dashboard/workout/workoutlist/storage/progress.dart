import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:fitrhythm/dashboard/workout/workoutlist/workoutframe.dart';

class progBar extends StatefulWidget {
  const progBar({Key? key}) : super(key: key);
  static List prog = [0];
  @override
  State<progBar> createState() => _progBarState();
}

class _progBarState extends State<progBar> {

  @override
  void initState() {
    super.initState();
    progBar.prog = workoutPage.progress;
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1, progBar.prog[0].toDouble()),
      ChartData(2, progBar.prog[1].toDouble()),
      ChartData(3, progBar.prog[2].toDouble()),
      ChartData(4, progBar.prog[3].toDouble()),
      ChartData(5, progBar.prog[4].toDouble()),
      ChartData(6, progBar.prog[5].toDouble()),
    ];
    return Center(
      child: Container(
          child: SfChartTheme(
              data: SfChartThemeData(
                brightness: Brightness.light,
                backgroundColor: Colors.transparent,
              ),
              child: SfCartesianChart(
                  primaryXAxis: NumericAxis(
                      minimum: 0,
                      interval: 1
                  ),
                  primaryYAxis: NumericAxis(

                      interval: 10
                  ),
                  title: ChartTitle(
                      text: 'Your Calorie Counter',
                      // Aligns the chart title to left
                      alignment: ChartAlignment.near,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'normFont',
                        fontStyle: FontStyle.italic,
                        fontSize: 14,

                      )
                  ),
                  series: <ChartSeries<ChartData, int>>[

                    ColumnSeries<ChartData, int>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      borderColor:  Colors.black,
                      color: Colors.redAccent,
                    )

                  ]
              )
          )),

    );
  }
}
class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}