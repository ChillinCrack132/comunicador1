import 'package:flutter/material.dart';
import 'routes.dart';
import 'theme.dart';


class DisphasiaApp extends StatelessWidget {
  const DisphasiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disphasia App',
      theme: AppTheme.lightTheme, // Tema claro con alto contraste
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}