import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_app/core/constants/colors.dart';
import 'package:pos_app/presentation/auth/screens/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POS Apps',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        textTheme: GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme),
        appBarTheme: AppBarTheme(
          color: AppColors.white,
          elevation: 0,
          titleTextStyle: GoogleFonts.quicksand(
            color: AppColors.primary,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          iconTheme: const IconThemeData(color: AppColors.primary),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
