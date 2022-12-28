import 'package:finapp/Chart/syncfusion.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpensesyncfusionSplinechart extends StatefulWidget {
  const ExpensesyncfusionSplinechart({Key? key}) : super(key: key);

  @override
  State<ExpensesyncfusionSplinechart> createState() => _ExpensesyncfusionSplinechartState();
}

class _ExpensesyncfusionSplinechartState extends State<ExpensesyncfusionSplinechart> {
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
          title: ChartTitle(text: '6 Month Expense bar chart'),
          // Enable legend
          legend: Legend(isVisible: true),
          // Enable tooltip
                enableAxisAnimation: true,

          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<ExpenseData, String>>[
            LineSeries<ExpenseData, String>(
                dataSource: _chartData,
                xValueMapper: (ExpenseData sales, _) => sales.Month,
                yValueMapper: (ExpenseData sales, _) => sales.Expense,
                name: "Expense",
                color: Colors.cyan[500],
                width: 3,

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
    ];
    return chartData;
  }
}
class ExpenseData {
  ExpenseData(this.Month, this.Expense);
  final String Month;
  final int Expense;
}