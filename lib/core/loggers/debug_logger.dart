import 'package:audio/core/loggers/logger.dart';

void networkLog({required String repository, required dynamic message, dynamic error, StackTrace? stackTrace}) {
  loggerNoMethod.e("REPOSITORY: $repository");
  logger.e(message, error, stackTrace);
}

void dioLog(dynamic message) {
  if (true) {
    // env.enableDioLogs
    loggerNoMethod.w(message);
  }
}

void dioDataLog(dynamic message) {
  if (true) {
    // env.enableDioLogs
    loggerData.w(message);
  }
}

void appExceptionLog(dynamic message, dynamic error, StackTrace? stackTrace) {
  logger.e("APP EXCEPTION:");
  logger.e(message, error, stackTrace);
}

void dataLog(dynamic message) {
  loggerData.w(message);
}

void navigationLog(dynamic message) {
  loggerData.v(message);
}
