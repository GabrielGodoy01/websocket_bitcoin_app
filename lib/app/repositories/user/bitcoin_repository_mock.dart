import 'dart:async';

import 'package:flutter_mvc_template/app/models/bitcoin_model.dart';
import 'package:flutter_mvc_template/app/repositories/user/bitcoin_repository.dart';

class BitcoinRepositoryMock implements BitcoinRepository {
  @override
  Function(BitcoinModel)? onDataReceived;

  BitcoinRepositoryMock() {
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
