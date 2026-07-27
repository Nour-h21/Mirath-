import 'package:flutter/material.dart';

import 'app/di/injection_container.dart';
import 'app/di/injection_container.dart' as di;
import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    // SyncfusionLicense.registerLicense('');
  await setupDI();
  await di.init();
  runApp(const MyApp());
}

