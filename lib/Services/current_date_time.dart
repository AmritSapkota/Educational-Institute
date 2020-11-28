import 'package:intl/intl.dart';

class CurrentDateTime {
  String getCurrentDateTime() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
    final String formatted = formatter.format(now);
    return formatted;
  }
}
