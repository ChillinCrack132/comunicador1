import 'package:flutter/material.dart';
import '../../auth/login_screen.dart';

class TherapistHomeScreen extends StatelessWidget {
  const TherapistHomeScreen({super.key});

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

  void _viewPatients(BuildContext context) {
    // Aquí podrías navegar a la lista de pacientes
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Consultar pacientes')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio - Terapeuta'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
            tooltip: 'Cerrar sesión',
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.people),
          label: const Text('Consultar pacientes'),
          onPressed: () => _viewPatients(context),
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
        ),
      ),
    );
  }
}
