import 'package:flutter/material.dart';
import 'auth_codes.dart';
import '../features/child/child_home.dart';
import '../features/therapist/therapist_home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _codeController = TextEditingController();
  String? _error;

  void _login() {
    final code = _codeController.text.trim();
    final role = AppAccessCodes.verifyCode(code);

    if (role == null) {
      setState(() {
        _error = 'Código no válido';
      });
    } else {
      switch (role) {
        case UserRole.child:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ChildHomeScreen()),
          );
          break;
        case UserRole.therapist:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const TherapistHomeScreen()),
          );
          break;
        default:
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB2EBF2), Color(0xFF81D4FA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.lock, size: 60, color: Colors.blueAccent),
                  const SizedBox(height: 20),
                  const Text(
                    'Inicio de Sesión',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _codeController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.vpn_key),
                      labelText: 'Código de acceso',
                      errorText: _error,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.login),
                    label: const Text('Entrar'),
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
