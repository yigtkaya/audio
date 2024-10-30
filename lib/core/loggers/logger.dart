import 'package:logger_plus/logger_plus.dart';

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

Logger logger = Logger(filter: MyFilter());

Logger loggerNoMethod = Logger(
  filter: MyFilter(),
  printer: PrettyPrinter(
    methodCount: 0,
  ),
);

Logger loggerData = Logger(
  filter: MyFilter(),
  printer: PrettyPrinter(
    methodCount: 0,
    printEmojis: false,
  ),
);
