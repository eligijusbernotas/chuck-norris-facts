import 'package:chuck_norris_facts/src/utils/excpetion_utils.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Exception utilities', () {
    const defaultMessage = 'message';
    test('Getting an error message from a response with a message returns that message', () {
      const notFoundResponseBody = {
        'timestamp': '2021-12-21T16:09:55.937Z',
        'status': 404,
        'error': 'Not Found',
        'message': 'No jokes for category \'000\' found.',
        'path': '/jokes/random'
      };

      try {
        throw notFoundResponseBody;
      } catch (e) {
        final message = getMessage(e, defaultMessage);

        expect(message, notFoundResponseBody['message']);
      }
    });
    test('Getting an error message from an exception with a message returns that message', () {
      const exception = FormatException('exception');

      try {
        throw exception;
      } catch (e) {
        final message = getMessage(e, defaultMessage);

        expect(message, exception.message);
      }
    });
    test('Getting an error message from an exception without a message returns default text', () {
      const exception = FormatException();

      try {
        throw exception;
      } catch (e) {
        final message = getMessage(e, defaultMessage);

        expect(message, defaultMessage);
      }
    });
  });
}
