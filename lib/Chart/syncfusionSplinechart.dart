import 'package:finapp/Chart/syncfusion.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class syncfusionSplinechart extends StatefulWidget {
  const syncfusionSplinechart({Key? key}) : super(key: key);

  @override
  State<syncfusionSplinechart> createState() => _syncfusionSplinechartState();
}

class _syncfusionSplinechartState extends State<syncfusionSplinechart> {
  late List<ExpenseData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
            //Initialize the chart widget
            SfCartesianChart(
            primaryXAxis: CategoryAxis(),
          // Chart title
          title: ChartTitle(text: 'Half yearly sales analysis'),
          // Enable legend
          legend: Legend(isVisible: true),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<ExpenseData, String>>[
            LineSeries<ExpenseData, String>(
                dataSource: _chartData,
                xValueMapper: (ExpenseData sales, _) => sales.Month,
                yValueMapper: (ExpenseData sales, _) => sales.Expense,
                name: 'Expense',
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true))
          ]),
      ]
      ),
      )
    );

  }
  List<ExpenseData> getChartData(){
    final List<ExpenseData> chartData = [
      ExpenseData("Jan", 80000),
      ExpenseData("Feb", 30000),
      ExpenseData("Mar", 35000),
      ExpenseData("Apr", 150000),
      ExpenseData("Jun", 60000),
      ExpenseData("Jul", 20000),
      ExpenseData("Aug", 25000),
      ExpenseData("Sep", 50000),
      ExpenseData("Oct", 15000),
      ExpenseData("sep", 5000),
      ExpenseData("Nov", 2000),
      ExpenseData("Dec", 100000),
    ];
    return chartData;
  }
}
class ExpenseData {
  ExpenseData(this.Month, this.Expense);
  final String Month;
  final int Expense;
}
