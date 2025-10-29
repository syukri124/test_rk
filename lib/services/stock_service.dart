import '../models/stock_item.dart';
import '../utils/dummy_data.dart';

class StockService {
  List<StockItem> getStocks() {
    return dummyStocks;
  }
}
