import 'package:flutter/material.dart';
import '../widgets/feature_card.dart';
import 'kasir/tambah_pesanan_screen.dart';
import 'owner/laporan_screen.dart';
import 'owner/stok_screen.dart';
import 'chef/daftar_pesanan_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Selamat Datang di RK Café System'),
        centerTitle: true,
        backgroundColor: Colors.brown[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            FeatureCard(
              icon: Icons.add_shopping_cart,
              title: 'Tambah Pesanan',
              color: Colors.green[400],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TambahPesananScreen()),
                );
              },
            ),
            FeatureCard(
              icon: Icons.bar_chart,
              title: 'Laporan Harian',
              color: Colors.blue[400],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LaporanScreen()),
                );
              },
            ),
            FeatureCard(
              icon: Icons.kitchen,
              title: 'Pesanan Masuk',
              color: Colors.orange[400],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DaftarPesananScreen()),
                );
              },
            ),
            FeatureCard(
              icon: Icons.inventory,
              title: 'Stok Bahan Baku',
              color: Colors.purple[400],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => StokScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
