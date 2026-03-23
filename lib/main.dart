import 'package:flutter/material.dart';
import 'package:n8ndistribution/routes/routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF212121),
          primary: const Color(0xFF212121),
        ),
        useMaterial3: true,
        // Modern TextTheme naming (Flutter 3.29.0)
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14),
          labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      routerConfig: router,
    );
  }
}
