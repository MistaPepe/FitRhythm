import 'package:fitrhythm/info_var.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class schedPage extends StatefulWidget {
  const schedPage({Key? key}) : super(key: key);

  @override
  State<schedPage> createState() => _schedPageState();
}

class _schedPageState extends State<schedPage> {


  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1, exerStorage.day1),
      ChartData(2, exerStorage.day2),
      ChartData(3, exerStorage.day3),
      ChartData(4, exerStorage.day4),
      ChartData(5, exerStorage.day5),
      ChartData(6, exerStorage.day6),
      ChartData(7, exerStorage.day7),
    ];
    return Center(
              child: Container(
        child: SfChartTheme(
        data: SfChartThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
    ),
                  child: SfCartesianChart(
                      primaryXAxis: NumericAxis(
                          minimum: 0,
                          interval: 1
                      ),
                      primaryYAxis: NumericAxis(

                          interval: 50
                      ),
                      title: ChartTitle(
                          text: 'Your progress This Week',
                          // Aligns the chart title to left
                          alignment: ChartAlignment.near,
                          textStyle: TextStyle(
                            color: Colors.white,
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
                          borderColor:  Color.fromARGB(116, 180, 155, 1),
                          color: Colors.lightGreenAccent,
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