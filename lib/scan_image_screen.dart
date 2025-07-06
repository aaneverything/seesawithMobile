import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ScanImageScreen extends StatelessWidget {
  const ScanImageScreen({Key? key}) : super(key: key);

  Future<void> _sendImageToEndpoint(BuildContext context, File imageFile) async {
    final String? endpointUrl = dotenv.env['API_ENDPOINT'];
    try {
      final request = http.MultipartRequest('POST', Uri.parse(endpointUrl!));
      request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Response: $responseBody')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${response.statusCode}')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to send image: $e')));
    }
  }

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      await _sendImageToEndpoint(context, imageFile);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No image selected')));
    }
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
              onPressed: () => _pickImage(context, ImageSource.gallery),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.camera_alt),
              label: const Text('Ambil dari Kamera'),
              onPressed: () => _pickImage(context, ImageSource.camera),
            ),
          ],
        ),
      ),
    );
  }
}
