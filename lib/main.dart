import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Chart Testing'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.green,
      Colors.yellow,
      Colors.red
    ];
    final List<double> stops = [
      0.0,
      0.5,
      1.0
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double alignRatio = (40 / constraints.maxWidth) * 2 - 1;

              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Align(
                      alignment: Alignment(alignRatio, -1),
                      child: Container(
                        width: 5,
                        height: constraints.maxHeight - 49,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: LineChart(
                      LineChartData(
                        borderData: FlBorderData(
                          border: Border(
                            bottom: BorderSide(color: Colors.black)
                          )
                        ),
                        titlesData: FlTitlesData(
                          leftTitles: SideTitles(
                            showTitles: true,
                            getTitles: (value) {
                              final intVal = value.toInt();
                              if (intVal % 4 == 0) {
                                return '$intVal';
                              }
                              return '';
                            },
                            reservedSize: 18,
                            margin: 12,
                          ),
                        ),
                        maxY: 30,
                        minY: 0,
                        gridData: FlGridData(
                          show: false,
                          drawHorizontalLine: false
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            barWidth: 4.0,
                            isCurved: true,
                            dotData: FlDotData(
                              show: false
                            ),
                            spots: [
                              FlSpot(1, 12),
                              FlSpot(2, 11),
                              FlSpot(3, 11),
                              FlSpot(4, 10),
                              FlSpot(5, 12),
                              FlSpot(6, 13),
                              FlSpot(7, 15),
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
                      ),
                    ),
                  ),
                ],
              );
            }
          )
        )
      )
    );
  }
}
