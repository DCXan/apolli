import 'package:apolli/onboarding/onboarding_flow.dart';
import 'package:apolli/ui/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    // brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 255, 255, 255),
    onPrimary: const Color.fromARGB(255, 45, 120, 150),
  ),
  textTheme: GoogleFonts.lexendTextTheme(),
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const Scaffold(
        // body: Navbar(),
        body: OnboardingFlow(),
      ),
    );
  }
}
