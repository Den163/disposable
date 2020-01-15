/// Interface for objects you can dispose
abstract class Disposable {
  factory Disposable(void Function() dispose) => _DisposableImpl(dispose); 

  void dispose();
}

class _DisposableImpl implements Disposable {
  void Function() _dispose;

  _DisposableImpl(this._dispose) : assert(_dispose != null);

  @override void dispose() => _dispose();
}