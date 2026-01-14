import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class AppTheme {
  static const Color _primarySeedColor = Color(0xFF003366); // Dresbach Navy Blue

  static final TextTheme _appTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(fontSize: 57, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.poppins(fontSize: 45, fontWeight: FontWeight.bold),
    displaySmall: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold),
    headlineLarge: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w600),
    headlineMedium: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w600),
    headlineSmall: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.w500),
    titleMedium: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    titleSmall: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyLarge: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall: GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.normal),
    labelLarge: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold),
    labelMedium: GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.bold),
    labelSmall: GoogleFonts.lato(fontSize: 11, fontWeight: FontWeight.bold),
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primarySeedColor,
      brightness: Brightness.light,
      primary: _primarySeedColor,
      secondary: const Color(0xFF00C853), // Accent Green
    ),
    textTheme: _appTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: _primarySeedColor,
      foregroundColor: Colors.white,
      titleTextStyle: _appTextTheme.headlineSmall?.copyWith(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: _primarySeedColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: _appTextTheme.labelLarge,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primarySeedColor,
      brightness: Brightness.dark,
      primary: const Color(0xFF6699FF), // Lighter Blue for Dark Mode
      secondary: const Color(0xFF69F0AE), // Lighter Green for Dark Mode
    ),
    textTheme: _appTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
      titleTextStyle: _appTextTheme.headlineSmall?.copyWith(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xFF6699FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: _appTextTheme.labelLarge?.copyWith(color: Colors.black),
      ),
    ),
  );
}
