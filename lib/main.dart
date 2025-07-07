import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // print("Loading environment variables...");
  // await dotenv.load(fileName: ".env");
  // print("Environment variables loaded successfully.");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 61, 143, 83)),
      ),
      home: const SplashScreen(),
    );
  }
}

