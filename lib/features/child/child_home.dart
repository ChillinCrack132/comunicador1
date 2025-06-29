import 'package:flutter/material.dart';
import '../../auth/login_screen.dart';
import '../../features/audio_player/presentation/screens/home_screen.dart';


class ChildHomeScreen extends StatelessWidget {
  const ChildHomeScreen({super.key});

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

  void _startPractice(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomeScreen()),
  );
}

  void _viewStreak(BuildContext context) {
    // Aquí se va a navegar a la pantalla de rachas
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Consultar racha')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio - Niño'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
            tooltip: 'Cerrar sesión',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.play_arrow),
              label: const Text('Empezar práctica'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.star),
              label: const Text('Consultar racha'),
              onPressed: () => _viewStreak(context),
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
            ),
          ],
        ),
      ),
    );
  }
}
