import 'package:flutter_test/flutter_test.dart';
import 'package:odrs/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('NavigationViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
