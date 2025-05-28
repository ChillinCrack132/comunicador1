import 'package:audioplayers/audioplayers.dart';
import 'package:record/record.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();
  final Record _recorder = Record();

  Future<void> playAudio(String path) async {
    await _player.stop(); // Detener cualquier reproducción previa
    await _player.play(AssetSource(path));
  }

  Future<void> startRecording() async {
    if (await _recorder.hasPermission()) {
      await _recorder.start();
    }
  }

  Future<String?> stopRecording() async {
    return await _recorder.stop();
  }

  void dispose() {
    _player.dispose();
  }
}