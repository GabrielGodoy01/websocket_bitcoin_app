import 'package:flutter/cupertino.dart';
import 'package:flutter_mvc_template/app/app_widget.dart';
import 'package:flutter_mvc_template/app/injector.dart';

void main() {
  registerInstances();
  runApp(const AppWidget());
}
