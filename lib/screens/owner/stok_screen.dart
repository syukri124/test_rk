import 'package:flutter/material.dart';

class StokScreen extends StatelessWidget {
  const StokScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manajemen Stok')),
      body: const Center(child: Text('Halaman Manajemen Stok')),
    );
  }
}
