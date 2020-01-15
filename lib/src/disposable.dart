/// Interface for objects you can dispose
abstract class Disposable {
  static Disposable create<T> (T disposable, Function(T) dispose) =>
    _DisposableImpl(disposable, dispose);

  void dispose();
}

class _DisposableImpl<T> implements Disposable {
  T disposable;
  void Function(T) _dispose;

  _DisposableImpl(this.disposable, this._dispose) :
    assert(_dispose != null);

  @override
  bool operator ==(other) =>
    (other is _DisposableImpl && other.disposable == disposable) ||
      other == disposable;

  @override
  int get hashCode => disposable.hashCode;

  @override void dispose() => _dispose(disposable);
}