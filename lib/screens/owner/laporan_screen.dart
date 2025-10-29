import 'package:flutter/material.dart';
import '../../services/report_service.dart';
import '../../models/report.dart';

class LaporanScreen extends StatelessWidget {
  final reportService = ReportService();

  LaporanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Report> reports = reportService.getReports();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Transaksi'),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return Card(
            margin: const EdgeInsets.all(10),
            color: Colors.brown[50],
            child: ListTile(
              leading: const Icon(Icons.receipt_long),
              title: Text('Kasir: ${report.kasir}'),
              subtitle: Text('Tanggal: ${report.tanggal}\nTotal: Rp ${report.total}'),
            ),
          );
        },
      ),
    );
  }
}
