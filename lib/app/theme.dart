import 'package:flutter/material.dart';

class AppTheme {
  // Tema claro con alto contraste (ideal para disfasia)
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF0066CC),       // Azul accesible
      secondary: Color(0xFFFF8C00),     // Naranja contrastante
      surface: Colors.white,
      background: Color(0xFFF5F5F5),
      error: Color(0xFFD32F2F),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 18.0, color: Colors.black87),
      labelLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF0066CC),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Color(0xFF0066CC)),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
  );

  // Tema oscuro (opcional)
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF5AA9FF),       // Azul más claro
      secondary: Color(0xFFFFAA00),     // Naranja más brillante
      surface: Color(0xFF121212),
      background: Color(0xFF1E1E1E),
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF2D2D2D),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
  );

  // Tema de alto contraste EXTREMO (para necesidades específicas)
  static final ThemeData highContrastTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.yellow,
      surface: Colors.white,
      background: Colors.white,
      error: Colors.red,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.black,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}