import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvc_template/app/controllers/bitcoin_controller.dart';
import 'package:flutter_mvc_template/app/injector.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => injector.get<BitcoinController>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bitcoin Price'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.grey[900],
        body: Consumer<BitcoinController>(
          builder: (context, controller, child) {
            if (controller.errorMessage != null) {
              return Center(
                  child: Text(controller.errorMessage!,
                      style: const TextStyle(color: Colors.red)));
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.bitcoinPrice != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '\$${double.tryParse(controller.bitcoinPrice!)?.toStringAsFixed(2) ?? '0.00'}',
                    ),
                  )
                else
                  const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                  ),
                const SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: LineChart(
                      LineChartData(
                        minX: controller
                            .priceHistory.first.date.millisecondsSinceEpoch
                            .toDouble(),
                        maxX: controller
                            .priceHistory.last.date.millisecondsSinceEpoch
                            .toDouble(),
                        minY: controller.priceHistory
                            .map((bitcoin) =>
                                double.tryParse(bitcoin.price) ?? 0.0)
                            .reduce((a, b) => a < b ? a : b),
                        maxY: controller.priceHistory
                            .map((bitcoin) =>
                                double.tryParse(bitcoin.price) ?? 0.0)
                            .reduce((a, b) => a > b ? a : b),
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: true,
                          getDrawingHorizontalLine: (value) => const FlLine(
                            color: Colors.white24,
                            strokeWidth: 1,
                          ),
                          getDrawingVerticalLine: (value) => const FlLine(
                            color: Colors.white24,
                            strokeWidth: 1,
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: (controller.priceHistory.last.date
                                          .millisecondsSinceEpoch
                                          .toDouble() -
                                      controller.priceHistory.first.date
                                          .millisecondsSinceEpoch
                                          .toDouble()) /
                                  5,
                              getTitlesWidget: (value, meta) {
                                final date =
                                    DateTime.fromMillisecondsSinceEpoch(
                                        value.toInt());
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    '${date.hour}:${date.minute}:${date.second}',
                                    style: const TextStyle(
                                      color: Colors.white54,
                                      fontSize: 10,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: (controller.priceHistory
                                          .map((bitcoin) =>
                                              double.tryParse(bitcoin.price) ??
                                              0.0)
                                          .reduce((a, b) => a > b ? a : b) -
                                      controller.priceHistory
                                          .map((bitcoin) =>
                                              double.tryParse(bitcoin.price) ??
                                              0.0)
                                          .reduce((a, b) => a < b ? a : b)) /
                                  5,
                              getTitlesWidget: (value, meta) => Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  '\$${value.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: Colors.white24),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: controller.priceHistory.map((bitcoin) {
                              return FlSpot(
                                bitcoin.date.millisecondsSinceEpoch.toDouble(),
                                double.tryParse(bitcoin.price) ?? 0.0,
                              );
                            }).toList(),
                            isCurved: true,
                            barWidth: 3,
                            belowBarData: BarAreaData(
                              show: true,
                            ),
                            dotData: const FlDotData(show: false),
                          ),
                        ],
                        lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                            getTooltipItems: (List<LineBarSpot> touchedSpots) {
                              return touchedSpots.map((spot) {
                                final date =
                                    DateTime.fromMillisecondsSinceEpoch(
                                        spot.x.toInt());
                                return LineTooltipItem(
                                  '${date.hour}:${date.minute}:${date.second}\n\$${spot.y.toStringAsFixed(2)}',
                                  const TextStyle(color: Colors.white),
                                );
                              }).toList();
                            },
                          ),
                          handleBuiltInTouches: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
