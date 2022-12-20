import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles  {
  static getTitleData() => FlTitlesData(
    show: true,
    topTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      )
    ),
      rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          )
      ),
  );
}
