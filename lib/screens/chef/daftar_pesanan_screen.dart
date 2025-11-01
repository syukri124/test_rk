import 'package:flutter/material.dart';

class DaftarPesananScreen extends StatelessWidget {
  const DaftarPesananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Pesanan Chef')),
      body: const Center(child: Text('Halaman Daftar Pesanan Chef')),
    );
  }
}
