import '../models/report.dart';
import '../models/stock_item.dart';

List<Report> dummyReports = [
  Report(
    id: 'R001',
    tanggal: '2025-10-29',
    kasir: 'Ihsan',
    total: 150000,
  ),
  Report(
    id: 'R002',
    tanggal: '2025-10-28',
    kasir: 'Yuyu',
    total: 220000,
  ),
];

List<StockItem> dummyStocks = [
  StockItem(id: 'S001', name: 'Kopi Bubuk', quantity: 10, unit: 'kg'),
  StockItem(id: 'S002', name: 'Gula', quantity: 5, unit: 'kg'),
  StockItem(id: 'S003', name: 'Susu', quantity: 8, unit: 'liter'),
];
