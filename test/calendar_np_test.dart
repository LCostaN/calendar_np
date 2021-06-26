import 'package:calendar_np/event.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calendar_np/calendar_np.dart';

void main() {
  group('Event Tests: ', () {
    test('Throws an Argument Error if END is before or at same time as START',
        () {
      var start = DateTime(2021, 25, 06, 12, 10);
      var end = DateTime(2021, 25, 06, 12, 9);

      expect(
        () => EventNp(
          start: start,
          end: end,
        ),
        throwsArgumentError,
      );

      expect(
        () => EventNp(
          start: start,
          end: start,
        ),
        throwsArgumentError,
      );
    });

    test('If END is not informed, assumes the event duration to be 1 hour', () {
      var start = DateTime(2021, 25, 06, 12, 10);
      var event = EventNp(start: start);

      var expectedEnd = DateTime(2021, 25, 06, 13, 10);

      expect(event.end, expectedEnd);
      expect(event.duration.inSeconds, 3600);
    });
  });

  group('Calendar Tests', () {});
}
