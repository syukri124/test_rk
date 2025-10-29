import 'package:flutter/material.dart';
import 'screens/common/splash_screen.dart';
import 'screens/kasir/kasir_home_screen.dart';
import 'screens/owner/dashboard_screen.dart';
import 'screens/owner/laporan_screen.dart';
import 'screens/owner/stok_screen.dart';
import 'screens/barista/daftar_pesanan_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RK Café',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.brown[50],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
        ),
      ),
      home: const SplashScreen(),
      routes: {
        '/kasir': (context) => KasirHomeScreen(),
        '/owner': (context) => DashboardScreen(),
        '/laporan': (context) => LaporanScreen(),
        '/stok': (context) => StokScreen(),
        '/barista': (context) => DaftarPesananScreen(),
      },
    );
  }
}
