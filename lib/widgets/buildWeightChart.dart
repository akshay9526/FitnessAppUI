import 'package:fitness/utils/appColors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

LineChart buildWeightChart() {
  return LineChart(
    LineChartData(
      minY: 50,
      maxY: 60,
      gridData: const FlGridData(show: true),
      borderData: FlBorderData(
        show: true,
        border: Border(
          left: BorderSide(color: AppColors.primary),
          bottom: BorderSide(color: AppColors.primary),
          top: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(1, 59),
            FlSpot(5, 58),
            FlSpot(10, 56),
            FlSpot(15, 55),
            FlSpot(20, 54),
          ],
          isCurved: true,
          barWidth: 4,
          color: AppColors.primary.withOpacity(.6),
          belowBarData: BarAreaData(
            show: true,
            color: AppColors.primary.withOpacity(0.2),
          ),
          dotData: FlDotData(show: true),
        ),
      ],
    ),
  );
}
