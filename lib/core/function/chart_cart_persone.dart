import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:test_data_med/core/constant/app_color.dart';

Widget chartCartPersone(spots, width, List<Color> gradientColors) {
  return SizedBox(
    width: width,
    height: 110,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 6,
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              dotData: const FlDotData(
                show: false,
              ),
              isCurved: true,
              gradient: LinearGradient(
                colors: gradientColors,
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
