import 'package:flutter/material.dart';

class AppImageButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const AppImageButton({
    super.key,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Feedback táctil
        Feedback.forTap(context);
        onPressed();
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            semanticLabel: 'Imagen para reproducción de audio',
          ),
        ),
      ),
    );
  }
}