### disposable

### Provides a one abstract mechanism for releasing resources and utils for Dart and Flutter

Did you notice there is no one defined method to release object resources in Dart and Flutter?
StreamController.close(), StreamSubscription.cancel() and many dispose() methods 
in different Flutter object does the same - they free held information. But they doesn't have
any one defined interface for it. ```Disposable``` does it. 
```DisposableCollector``` is a composite of many disposables, which can be disposed as one.
It also provides extension methods to make life easier for streams.

Do you recognize it?
```dart
class SomeDisposable {
    /// ...
    
    final _subscription = someStream.listen(
      (value) => doSomethingWith(value)
    );
    
    /// ...
    
    void dispose() {
      _subscription.cancel();
    }
}
```

With ```DisposableCollector``` it will look like : 
```dart
class SomeDisposable extends DisposableCollector {
  /// ...
  someStream
    .listen((value) => doSomethingWith(value))
    .addTo(this);
  
  /// ...
}
``` 

And you can make ```Disposable``` from any of your objects with factory
```dart
final disposable = Disposable.create(yourObject, () => yourObject.close());
// or
final disposable = yourObject.toDisposable(() => yourObjectClose());
```