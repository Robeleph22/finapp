import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'LineTitles.dart';
class Lcharts extends StatefulWidget {
  const Lcharts({Key? key}) : super(key: key);

  @override
  State<Lcharts> createState() => _LchartsState();
}

class _LchartsState extends State<Lcharts> {
  // final List<Color> gradiantColors = [
  //   const Color(0xff23b6e6),
  //   const Color(0xff02d39a),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: LineChart(
        LineChartData(
          maxX: 30,
          maxY: 110000,
          minY: 0,
          minX: 0,

          titlesData: LineTitles.getTitleData(),

          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value){
              return FlLine(
                color: Colors.blueGrey.shade900,
                    strokeWidth: 2,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value){
              return FlLine(
                color: Colors.blueGrey.shade900,
                strokeWidth: 2,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.black54,width: 4),

          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(2, 5000),
                FlSpot(5, 40000),
                FlSpot(20, 100000),
                FlSpot(20, 50000),
                FlSpot(30, 15000),


              ],
              isCurved: true,
              color: Colors.cyan[300],
              barWidth: 4,
              belowBarData: BarAreaData(
                show: true,
                color:Colors.blueGrey.withOpacity(0.3),
              )
            )
          ]
        )
      )
    );
  }
}
