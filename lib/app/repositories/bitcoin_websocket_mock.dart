import 'dart:async';

import 'package:flutter_mvc_template/app/models/bitcoin_model.dart';
import 'package:flutter_mvc_template/app/repositories/bitcoin_websocket.dart';

class BitcoinWebsocketMock implements IBitcoinWebsocket {
  @override
  Function(BitcoinModel)? onDataReceived;

  BitcoinWebsocketMock() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (onDataReceived != null) {
        onDataReceived!(
            BitcoinModel(price: _generateMockPrice(), date: DateTime.now()));
      }
    });
  }

  String _generateMockPrice() {
    return (30000 +
            (10000 * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000))
        .toString();
  }
}
