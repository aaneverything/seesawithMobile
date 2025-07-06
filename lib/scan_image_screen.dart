import 'package:flutter/material.dart';

class ScanImageScreen extends StatelessWidget {
  const ScanImageScreen({Key? key}) : super(key: key);

  void _pickFromGallery(BuildContext context) {
    // TODO: Implement pick from gallery
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pick from Gallery')));
  }

  void _pickFromCamera(BuildContext context) {
    // TODO: Implement pick from camera
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pick from Camera')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Image')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.photo_library),
              label: const Text('Pilih dari Galeri'),
              onPressed: () => _pickFromGallery(context),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.camera_alt),
              label: const Text('Ambil dari Kamera'),
              onPressed: () => _pickFromCamera(context),
            ),
          ],
        ),
      ),
    );
  }
}
