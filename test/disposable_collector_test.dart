import 'package:disposable_utils/disposable_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'disposable_collector_test.mocks.dart';

@GenerateMocks([Disposable])
void main() {
  test("DisposableCollector disposes "
       "each Disposable it contains when dispose()",
  () {
    final collector = new DisposableCollector();
    final spies = List
      .generate(10, (_) => new MockDisposable())
      ..forEach((s) => collector.add(s));

    collector.dispose();

    expect(
      spies.every((s) => verify(s.dispose()).callCount == 1),
      true
    );
  });
}