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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

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
        title: Text(widget.title),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: colors,
                    stops: stops,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  )
                ),
              ),
              LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
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
              )
            ],
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
