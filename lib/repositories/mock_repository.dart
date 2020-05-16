import 'dart:async';
import 'dart:math';

class MockRepository {
  MockRepository() {
    print('mock start');
    _sampleFuture().then((randNum) {
      _randNum = randNum;
      loginCheckSink.add(true);
      print('mock end');
    });
  }

  final _isLoginChecked = StreamController<bool>.broadcast();
  int _randNum = 0;

  Stream<bool> get isLoginChecked => _isLoginChecked.stream;
  StreamSink<bool> get loginCheckSink => _isLoginChecked.sink;
  int get randNum => _randNum;

  final random = Random();

  Future<int> _sampleFuture() async {
    return Future.delayed(const Duration(seconds: 3)).then(
      (_) => random.nextInt(10090),
    );
  }

  void dispose() {
    _isLoginChecked.close();
  }
}
