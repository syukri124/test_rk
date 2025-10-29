import 'package:flutter/material.dart';
import '../../models/stock_item.dart';
import '../../services/stock_service.dart';

class StokScreen extends StatelessWidget {
  final StockService _stockService = StockService();

  StokScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stocks = _stockService.getStocks();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Stok Barang'),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        itemCount: stocks.length,
        itemBuilder: (context, index) {
          final StockItem stock = stocks[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(stock.name),
              subtitle: Text('Jumlah: ${stock.quantity} ${stock.unit}'),
              trailing: const Icon(Icons.inventory_2),
            ),
          );
        },
      ),
    );
  }
}
