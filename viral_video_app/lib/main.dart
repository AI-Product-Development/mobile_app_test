import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'providers/search_provider.dart';

void main() => runApp(const ViralVideoSearchApp());

class ViralVideoSearchApp extends StatelessWidget {
  const ViralVideoSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: MaterialApp(
        home: const HomeScreen(), // Use the existing HomeScreen
        theme: ThemeData(fontFamily: 'SansSerif'),
      ),
    );
  }
}
