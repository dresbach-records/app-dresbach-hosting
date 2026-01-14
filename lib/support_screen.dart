import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suporte'),
      ),
      body: const Center(
        child: Text('Em breve: aqui você encontrará nossa central de suporte!'),
      ),
    );
  }
}
