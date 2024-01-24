import 'package:flutter/material.dart';
import 'package:pricer/Features/home/presentation/views/home_view.dart';

void main() {
  runApp(const PricerApp());
}

class PricerApp extends StatelessWidget {
  const PricerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: const Color(0xff18181B)),
      home: const HomeView(),
    );
  }
}
