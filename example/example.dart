import 'dart:async';
import 'package:disposable_utils/disposable_utils.dart';

void main() {
  final service = new DataService();
  final bloc = new Bloc(service);

  bloc.stream.listen(
    (v) => print(v),
    onDone: () => print("Complete")
  );

  bloc.dispose();

  // You will see printed `Complete`, because bloc was disposed
  // before it receives the value from the data service.
}

/// Just imitation of BLoC as a store of streams
class Bloc extends DisposableCollector {
  Stream<int> get stream => _streamController.stream;
  final StreamController<int> _streamController = new StreamController();

  Bloc(DataService service) {
    _streamController.addTo(this);

    /// Of course instead of construction below you can write something like
    /// ```
    /// final v = await service.getValue();
    /// _streamController.add(v);
    /// ````
    /// or
    /// ```
    /// _streamController.addStream(service.getValue().asStream());
    /// ```
    /// But in that cases you will see different exceptions if you dispose your
    /// streamController before you get the value from your future/stream.
    /// But when you using addTo(Disposable) extension method you will unsubscribe
    /// from the stream when your [StreamController] has been disposed and
    /// there are no exceptions will throw

    service.getValue().asStream()
      .listen((v) => _streamController.add(v))
      .addTo(this);
  }
}

/// Just some data service imitation
class DataService {
  Future<int> getValue() async {
    Future.delayed(Duration(seconds: 1));
    return 3;
  }
}