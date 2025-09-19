import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zozy/Features/home/model/task_model.dart';
import 'package:zozy/Features/onboarding/view/splash_view.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // تهيئة Hive
  Hive.registerAdapter(TaskModelAdapter()); // تسجيل الموديل

  // فتح الـ Box مرة واحدة فقط
  if (!Hive.isBoxOpen('tasks')) {
    await Hive.openBox<TaskModel>('tasks');
  }

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const ZezoApp(),
    ),
  );
}

class ZezoApp extends StatelessWidget {
  const ZezoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashView());
    
  }
}
