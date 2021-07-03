import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:ui' as ui;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Color.fromARGB(140, 0, 120, 0),
      Color.fromARGB(140, 120, 120, 0),
      Color.fromARGB(140, 120, 0, 0)
    ];
    final List<double> stops = [
      0.3,
      0.6,
      1.0
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: colors,
                      stops: stops,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: false,
                      drawHorizontalLine: false
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        dotData: FlDotData(
                          show: false
                        ),
                        spots: [
                          FlSpot(1, 12),
                          FlSpot(2, 23),
                          FlSpot(3, 8),
                          FlSpot(4, 9),
                          FlSpot(5, 14),
                          FlSpot(6, 2),
                        ],
                        colors: [
                          Colors.green,
                          Colors.yellow,
                          Colors.red
                        ],
                        colorStops: stops,
                        gradientFrom: const Offset(0, 0),
                        gradientTo: const Offset(0, 1)
                      )
                    ]
                  )
                ),
              )
            ],
          )
        )
      )
    );
  }
}
