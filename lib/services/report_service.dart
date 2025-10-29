import '../models/report.dart';
import '../utils/dummy_data.dart';

class ReportService {
  List<Report> getReports() {
    return dummyReports;
  }
}
