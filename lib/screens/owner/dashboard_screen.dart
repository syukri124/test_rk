import 'package:flutter/material.dart';
import '../../services/report_service.dart';
import '../../services/stock_service.dart';
import '../../models/report.dart';
import '../../models/stock_item.dart';

class DashboardScreen extends StatelessWidget {
  final reportService = ReportService();
  final stockService = StockService();

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Report> reports = reportService.getReports();
    final List<StockItem> stocks = stockService.getStocks();

    final totalTransaksi = reports.fold<double>(0, (sum, r) => sum + r.total);
    final totalItem = stocks.fold<int>(0, (sum, s) => sum + s.quantity);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Owner'),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              color: Colors.brown[100],
              child: ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text('Total Transaksi'),
                trailing: Text('Rp $totalTransaksi'),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.brown[100],
              child: ListTile(
                leading: const Icon(Icons.inventory),
                title: const Text('Total Barang di Stok'),
                trailing: Text('$totalItem item'),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/laporan'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
              child: const Text('Lihat Laporan Transaksi'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/stok'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
              child: const Text('Lihat Data Stok'),
            ),
          ],
        ),
      ),
    );
  }
}
