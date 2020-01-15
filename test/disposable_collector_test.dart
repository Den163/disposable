import 'package:disposable_utils/disposable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  test("DisposableCollector disposes "
       "each Disposable it contains when dispose()",
  () {
    final collector = new DisposableCollector();
    final spies = List
      .generate(10, (_) => new DisposableMock())
      ..forEach((s) => collector.add(s));

    collector.dispose();

    expect(
      spies.every((s) => verify(s.dispose()).callCount == 1),
      true
    );
  });
}

class DisposableMock extends Mock implements Disposable {}