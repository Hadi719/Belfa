import 'package:logging/logging.dart';

/// try-catch method that returns future value with log
///
/// ```dart
/// try {
///   log.info('get all loans started...');
///
///   List<Loan> data = await loans.where().findAll();
///
///   log.info('get all loans completed');
///   return Future.value(data);
/// } catch (e) {
///   log.severe('get all loans failed', [e]);
///   return Future.error(e);
/// }
/// ```
tryMethod<T>({
  required Function() method,
  required Logger log,
  required String message,
  String? extraMessage,
}) {
  log.info('$message started...');
  try {
    final T result = method();

    log.info('$message completed $extraMessage');
    return Future.value(result);
  } catch (e) {
    log.severe('$message failed', [e]);
    return Future.error(e);
  }
}
