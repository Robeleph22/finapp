import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class syncfusionPiechart extends StatefulWidget {
  const syncfusionPiechart({Key? key}) : super(key: key);

  @override
  State<syncfusionPiechart> createState() => _syncfusionPiechartState();
}

class _syncfusionPiechartState extends State<syncfusionPiechart> {
  late List<ExpenseData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior =TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:SfCircularChart(
          title: ChartTitle(text: "This Year Expense With Pie Chart",),
          legend: Legend(isVisible: true,overflowMode: LegendItemOverflowMode.wrap),
          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries>[
            DoughnutSeries<ExpenseData, String>
              (dataSource: _chartData,
                xValueMapper: (ExpenseData data,_) => data.Month,
                yValueMapper: (ExpenseData data,_) => data.Expense,
              dataLabelSettings: DataLabelSettings(isVisible: true,),
              enableTooltip: true,
            )
          ],
        ),
      ),
    );

  }
  List<ExpenseData> getChartData(){
    final List<ExpenseData> chartData = [
      ExpenseData('Jan', 80000),
      ExpenseData('Feb', 30000),
      ExpenseData('Mar', 35000),
      ExpenseData('Apr', 150000),
      ExpenseData('May', 60000),
      ExpenseData('Jun', 20000),
      ExpenseData('Jul', 25000),
      ExpenseData('Aug', 50000),
      ExpenseData('Sep', 15000),
      ExpenseData('Oct', 5000),
      ExpenseData('Nov', 20000),
      ExpenseData('Dec', 100000),
    ];
    return chartData;
  }
}
class ExpenseData {
  ExpenseData(this.Month, this.Expense);
  final String Month;
  final int Expense;
}
