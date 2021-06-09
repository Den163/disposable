import 'dart:async';

import 'package:disposable_utils/src/disposable.dart';
import 'package:disposable_utils/src/disposable_collector.dart';

extension StreamControllerExtensions<T> on StreamController<T> {
  Disposable asDisposable() => Disposable.create(
      this, (StreamController<T> s) => s.close());

  void addTo(DisposableCollector disposableCollection) =>
    this.asDisposable().addTo(disposableCollection);
}

extension StreamSubscriptionExtensions<T> on StreamSubscription<T> {
  Disposable asDisposable() => Disposable.create(
      this, (StreamSubscription<T> s) => s.cancel());

  void addTo(DisposableCollector disposableCollection) =>
    this.asDisposable().addTo(disposableCollection);
}

extension DisposableExtensions on Disposable {
  void addTo(DisposableCollector disposableCollector) =>
    disposableCollector.add(this);
}

extension ObjectExtensions<T> on T {
  Disposable toDisposable (void Function(T) dispose) =>
    Disposable.create(this, dispose);
}