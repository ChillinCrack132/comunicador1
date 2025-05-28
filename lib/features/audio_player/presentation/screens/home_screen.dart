import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import '../../../../core/widgets/app_image_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 1. Listas de recursos
  final List<String> images = [
  'assets/images/perro.png',
  'assets/images/gato.png',
  'assets/images/pajaro.png',
  'assets/images/leon.png',
];

// Lista de audios
final List<String> audios = [
  'audios/perro.mp3',
  'audios/gato.mp3',
  'audios/pajaro.mp3',
  'audios/leon.mp3',
];


  // 2. Controladores de audio
  final AudioPlayer _audioPlayer = AudioPlayer();
  final Record _audioRecorder = Record();
  bool _isRecording = false;

  // 3. Método para reproducir audio
  Future<void> _playAudio(String audioPath) async {
    try {
      await _audioPlayer.stop(); // Detener cualquier reproducción previa
      await _audioPlayer.play(AssetSource(audioPath));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al reproducir: ${e.toString()}')),
      );
    }
  }

  // 4. Método para grabar audio
  Future<void> _startRecording() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        setState(() => _isRecording = true);
        await _audioRecorder.start();
        
        // Mostrar feedback visual
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Grabando...')),
        );
      }
    } catch (e) {
      setState(() => _isRecording = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al grabar: ${e.toString()}')),
      );
    }
  }

  // 5. Método para detener grabación
  Future<void> _stopRecording() async {
    try {
      final path = await _audioRecorder.stop();
      setState(() => _isRecording = false);
      
      // Aquí podrías enviar el audio al psicólogo
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Audio guardado en: $path')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al detener grabación: ${e.toString()}')),
      );
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _audioRecorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App para Disfasia'),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return AppImageButton(
            imagePath: images[index],
            onPressed: () => _playAudio(audios[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isRecording ? _stopRecording : _startRecording,
        backgroundColor: _isRecording ? Colors.red : Colors.blue,
        tooltip: _isRecording ? 'Detener grabación' : 'Comenzar grabación',
        child: Icon(
          _isRecording ? Icons.stop : Icons.mic,
          size: 30.0,
        ),
      ),
    );
  }
}