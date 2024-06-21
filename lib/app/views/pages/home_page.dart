import 'package:flutter/material.dart';
import 'package:flutter_mvc_template/app/controllers/bitcoin_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (controller.bitcoinPrice != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'R\$${double.tryParse(controller.bitcoinPrice!)?.toStringAsFixed(2) ?? '0.00'}',
                    ),
                  )
                else
                  const CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }
}
