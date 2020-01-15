import 'dart:async';

import 'package:disposable_utils/src/disposable.dart';
import 'package:disposable_utils/src/disposable_collector.dart';

extension StreamControllerExtensions<T> on StreamController<T> {
  Disposable toDisposable() => Disposable.create(this, () => this.close());

  void addTo(DisposableCollector disposableCollection) =>
    this.toDisposable().addTo(disposableCollection);
}

extension StreamSubscriptionExtensions<T> on StreamSubscription<T> {
  Disposable toDisposable() => Disposable.create(this, () => this.cancel());

  void addTo(DisposableCollector disposableCollection) =>
    this.toDisposable().addTo(disposableCollection);
}

extension DisposableExtensions on Disposable {
  void addTo(DisposableCollector disposableCollector) =>
    disposableCollector.add(this);
}

extension ObjectExtensions on Object {
  Disposable toDisposable(void Function() dispose) =>
    Disposable.create(this, dispose);
}