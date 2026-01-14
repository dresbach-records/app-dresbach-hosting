import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contratar Planos'),
      ),
      body: const Center(
        child: Text('Em breve: aqui você poderá contratar nossos planos!'),
      ),
    );
  }
}
