import 'package:flutter/material.dart';
import 'pembayaran_screen.dart';

class TambahPesananScreen extends StatefulWidget {
  final List<Map<String, dynamic>> pesanan;
  final int total;

  const TambahPesananScreen({
    super.key,
    required this.pesanan,
    required this.total,
  });

  @override
  State<TambahPesananScreen> createState() => _TambahPesananScreenState();
}

class _TambahPesananScreenState extends State<TambahPesananScreen> {
  late List<Map<String, dynamic>> pesanan;

  @override
  void initState() {
    super.initState();
    pesanan = List<Map<String, dynamic>>.from(widget.pesanan);
  }

  void hapusPesanan(int index) {
    setState(() {
      pesanan.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    int total = pesanan.fold(0, (sum, item) => sum + item['harga'] as int);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, pesanan); // kirim data balik
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Pesanan'),
          backgroundColor: Colors.brown,
        ),
        body: Column(
          children: [
            Expanded(
              child: pesanan.isEmpty
                  ? const Center(
                      child: Text(
                        'Belum ada pesanan',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: pesanan.length,
                      itemBuilder: (context, index) {
                        final item = pesanan[index];
                        return ListTile(
                          title: Text(item['nama']),
                          subtitle: Text("Rp ${item['harga']}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => hapusPesanan(index),
                          ),
                        );
                      },
                    ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.brown[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Total: Rp $total',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: pesanan.isEmpty
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    PembayaranScreen(total: total),
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),
                    child: const Text('Lanjut ke Pembayaran'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
