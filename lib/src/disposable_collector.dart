import 'dart:collection';

import 'package:disposable/src/disposable.dart';
import 'package:meta/meta.dart';

/// Base class for [Disposable]`s that contains many other [Disposable]s,
/// which you can dispose as one.
class DisposableCollector extends ListBase<Disposable> implements Disposable {
  List<Disposable> _disposables = new List<Disposable>();

  @override
  @mustCallSuper
  /// Disposes all [Disposable]s it contains
  void dispose() => _disposables.forEach((d) => d.dispose());

  @override int get length => _disposables.length;
  @override set length(value) => _disposables.length = value;
  @override Disposable operator [](int index) => _disposables[index];
  @override void operator []=(int index, Disposable value) => _disposables[index] = value;
}