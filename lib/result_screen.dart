import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String result;
  final double confidence;

  const ResultScreen({Key? key, required this.result, required this.confidence})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Result: $result',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Confidence: ${(confidence * 100).toStringAsFixed(2)}%',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
