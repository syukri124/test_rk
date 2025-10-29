import 'package:flutter/material.dart';
import 'tambah_pesanan_screen.dart';

class KasirHomeScreen extends StatefulWidget {
  const KasirHomeScreen({super.key});

  @override
  State<KasirHomeScreen> createState() => _KasirHomeScreenState();
}

class _KasirHomeScreenState extends State<KasirHomeScreen> {
  final List<Map<String, dynamic>> menu = [
    {"nama": "Kopi Latte", "harga": 25000},
    {"nama": "Americano", "harga": 20000},
    {"nama": "Cappuccino", "harga": 27000},
    {"nama": "Matcha Latte", "harga": 30000},
    {"nama": "Roti Bakar", "harga": 15000},
  ];

  List<Map<String, dynamic>> pesanan = [];

  void tambahPesanan(Map<String, dynamic> item) {
    setState(() {
      pesanan.add(item);
    });
  }

  void perbaruiPesanan(List<Map<String, dynamic>> updatedPesanan) {
    setState(() {
      pesanan = updatedPesanan;
    });
  }

  @override
  Widget build(BuildContext context) {
    int total = pesanan.fold(0, (sum, item) => sum + item['harga'] as int);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kasir RK Café'),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: menu.length,
              itemBuilder: (context, index) {
                final item = menu[index];
                return Card(
                  color: Colors.brown[100],
                  child: InkWell(
                    onTap: () => tambahPesanan(item),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item['nama'],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text("Rp ${item['harga']}"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.brown[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: Rp $total',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: pesanan.isEmpty
                      ? null
                      : () async {
                          final hasil = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TambahPesananScreen(
                                pesanan: pesanan,
                                total: total,
                              ),
                            ),
                          );
                          // Jika user menghapus item, perbarui daftar pesanan
                          if (hasil != null && hasil is List<Map<String, dynamic>>) {
                            perbaruiPesanan(hasil);
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                  ),
                  child: const Text('Lihat Pesanan'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
