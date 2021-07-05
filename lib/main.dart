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
        centerTitle: true,
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.2,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double alignRatio = (40 / constraints.maxWidth) * 2 - 1;

                return Padding(
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
                          interval: 5.0,
                          reservedSize: 18,
                          margin: 12,
                        ),
                      ),
                      maxY: 30,
                      minY: 0,
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: true,
                        drawVerticalLine: true,
                        horizontalInterval: 5.0,
                        verticalInterval: 1
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          barWidth: 6.0,
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
                          colors: colors,
                          colorStops: stops,
                          gradientFrom: const Offset(0, 0),
                          gradientTo: const Offset(0, 1)
                        ),
                        LineChartBarData(
                          barWidth: 5.0,
                          isCurved: false,
                          dotData: FlDotData(
                            show: false
                          ),
                          spots: [
                            FlSpot(1, 0),
                            FlSpot(1, 30)
                          ],
                          colors: colors,
                          colorStops: stops,
                          gradientFrom: const Offset(0, 0),
                          gradientTo: const Offset(0, 1)
                        )
                      ]
                    ),
                  ),
                );
              }
            )
          ),
          AspectRatio(
            aspectRatio: 16 / 4.5,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: LineChart(
                    LineChartData(
                      borderData: FlBorderData(
                        show: false,
                      ),
                      titlesData: FlTitlesData(
                        leftTitles: SideTitles(
                          showTitles: false
                        ),
                        bottomTitles: SideTitles(
                          showTitles: true,
                          interval: 20,
                          margin: 12
                        )
                      ),
                      minY: 0,
                      maxY: 1,
                      maxX: 120,
                      lineBarsData: [
                        LineChartBarData(
                          isStrokeCapRound: true,
                          barWidth: 16,
                          dotData: FlDotData(show: false),
                          spots: [
                            FlSpot(0, 0.5),
                            FlSpot(72, 0.5)
                          ],
                          colors: [
                            Colors.blue[600]!,
                            Colors.blue[200]!
                          ],
                          colorStops: [
                            0.0,
                            1.0
                          ],
                          gradientFrom: Offset(0, 0),
                          gradientTo: Offset(1, 0)
                        ),
                        LineChartBarData(
                          barWidth: 4,
                          dotData: FlDotData(show: false),
                          spots: [
                            FlSpot(0, 0),
                            FlSpot(120, 0)
                          ],
                          colors: [
                            Colors.red,
                            Colors.yellow,
                            Colors.green,
                            Colors.yellow,
                            Colors.red
                          ],
                          colorStops: [
                            0.0,
                            0.25,
                            0.5,
                            0.75,
                            1.0
                          ],
                          gradientFrom: Offset(0, 0),
                          gradientTo: Offset(1, 0)
                        )
                      ]
                    )
                  )
                );
              }
            ),
          )
        ],
      )
    );
  }
}
