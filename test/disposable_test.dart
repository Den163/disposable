import 'package:disposable_utils/disposable_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'disposable_test.mocks.dart';

@GenerateMocks([B])
void main() {
  test('Disposable disposes the value', () {
    final a = MockB();
    final d = a.toDisposable((a) => a.close());
    d.dispose();

    verify(a.close());
  });
}

class B {
  void close() {}
}
