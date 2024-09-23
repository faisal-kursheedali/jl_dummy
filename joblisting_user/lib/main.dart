import 'package:flutter/material.dart';
import 'package:joblisting_user/app/app.dart';
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/Auth/controller/authController.dart';
import 'package:joblisting_user/features/Profile/controller/profile_controller.dart';
import 'package:joblisting_user/features/jobs/controller/job_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(await initApp());
}

Future<Widget> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  PrefUtil.init();

  /// here we can add any intialization before app starts like firebase,hivestorage

  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => ProfileController()),
      ChangeNotifierProvider(create: (_) => JobController()),
    ],
    child: const MyApp(),
  );
}
