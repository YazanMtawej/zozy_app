import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zozy/splash_view.dart';

void main() {
  runApp(DevicePreview(enabled: !kReleaseMode, builder:  (context) =>const ZezoApp()));
}

class ZezoApp extends StatelessWidget {
  const ZezoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashView());
  }
}

