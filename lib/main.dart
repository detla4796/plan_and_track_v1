import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['FIREBASE_API_KEY'] ?? '',
      appId: '1:485789484972:android:cadedabbd3af27db911c09',
      messagingSenderId: '485789484972',
      projectId: 'planandtrack-92bfa',
      storageBucket: 'planandtrack-92bfa.firebasestorage.app',
    ),
  );

  runApp(const PlanAndTrackApp());
}

class PlanAndTrackApp extends StatelessWidget {
  const PlanAndTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plan&Track',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}