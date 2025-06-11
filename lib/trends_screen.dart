import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class TrendsScreen extends StatelessWidget {
  const TrendsScreen({super.key});

  String _formatCurrency(double value) {
    final formatter = NumberFormat.currency(symbol: '\$', decimalDigits: 0);
    return formatter.format(value);
  }

  @override
  Widget build(BuildContext context) {
    int barCount = 4;
    double barWidth = 60;
    double totalWidth = (barCount * barWidth) + 32; // Add some padding
    double screenWidth = MediaQuery.of(context).size.width;

    // But never exceed screen width:
    double chartWidth = totalWidth < screenWidth ? screenWidth : totalWidth;

    return Scaffold(
      appBar: AppBar(title: const Text("Monthly Spend")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(  // make it scrollable if width exceeds screen
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: chartWidth,  // <<< adjust this based on your bar count
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceEvenly,
                maxY: 1000,
                barTouchData: BarTouchData(enabled: true),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const months = ['Jan', 'Feb', 'Mar', 'Apr'];
                        return Text(months[value.toInt()]);
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50,
                      getTitlesWidget: (value, meta) {
                        final formatted = _formatCurrency(value);
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            formatted,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [BarChartRodData(toY: 500, color: Colors.blue, width: 40, borderRadius: BorderRadius.zero)], // no rounded edges
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [BarChartRodData(toY: 700, color: Colors.blue, width: 40, borderRadius: BorderRadius.zero)], // no rounded edges
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [BarChartRodData(toY: 300, color: Colors.blue, width: 40, borderRadius: BorderRadius.zero)], // no rounded edges
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [BarChartRodData(toY: 900, color: Colors.blue, width: 40, borderRadius: BorderRadius.zero)], // no rounded edges
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
