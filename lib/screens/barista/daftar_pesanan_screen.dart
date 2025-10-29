import 'package:flutter/material.dart';

class DaftarPesananScreen extends StatelessWidget {
  const DaftarPesananScreen({super.key}); // gunakan const jika ingin

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Pesanan')),
      body: const Center(child: Text('Daftar Pesanan Screen')),
    );
  }
}
