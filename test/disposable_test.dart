import 'package:disposable_utils/disposable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  test('Disposable disposes the value', () {
    final a = BMock();

    final d = new Disposable(() => a.close());
    d.dispose();

    verify(a.close());
  });
}

class BMock extends Mock implements B {}

class B {
  void close() {}
}
