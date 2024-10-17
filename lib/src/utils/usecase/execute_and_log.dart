import 'package:logging/logging.dart';

/// Executes a given method within a try-catch block and logs the outcome.
///
/// [method]: The method to execute. Should return a [Future<T>].
/// [logger]: The logger instance to use for logging.
/// [taskDescription]: A brief description of the task being performed.
/// [extraMessageBuilder]: A function that takes the result of the [method]
///   and returns a string to append to the success log.
///
/// Returns a [Future] that resolves with the result of the [method] if
/// successful. If an exception occurs, the [Future] will resolve with an error
/// and the exception will be logged.
Future<T> executeAndLog<T>({
  required dynamic Function() method,
  required Logger logger,
  required String taskDescription,
  String? Function(T result)? extraMessageBuilder,
}) async {
  logger.info('Starting $taskDescription...');

  try {
    // Check if the method is a Future function
    if (method is Future<T> Function()) {
      final result = await method();
      final extraMessage =
          extraMessageBuilder != null ? extraMessageBuilder(result) : null;
      logger.info(
          'Completed $taskDescription ${extraMessage != null ? ': $extraMessage' : ''}');
      return result;
    } else if (method is T Function()) {
      // If it's a normal function, execute it directly
      final result = method();
      final extraMessage =
          extraMessageBuilder != null ? extraMessageBuilder(result) : null;
      logger.info(
          'Completed $taskDescription ${extraMessage != null ? ': $extraMessage' : ''}');
      return result;
    } else {
      throw ArgumentError(
          'The provided method must be a Future<T> Function() or a T Function().');
    }
  } catch (e) {
    logger.severe('Error during $taskDescription: $e', [e]);
    rethrow; // Re-throw the exception to be handled by the caller
  }
}
