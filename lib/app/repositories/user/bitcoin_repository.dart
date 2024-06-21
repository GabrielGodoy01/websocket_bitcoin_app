import 'package:flutter_mvc_template/app/models/bitcoin_model.dart';

abstract class BitcoinRepository {
  Function(BitcoinModel)? onDataReceived;
}
