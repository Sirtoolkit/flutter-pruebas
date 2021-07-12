part of 'provider.dart';

class CounterProvider with ChangeNotifier {
  late int _count;

  CounterProvider() {
    this._count = 0;
  }
  int get count => this._count;

  void setCounter(int value) {
    this._count = value < 0 ? 0 : value;

    notifyListeners();
  }

  void incrementCounter() {
    this._count++;

    notifyListeners();
  }

  void decrementCounter() {
    this._count--;
    this._count = this._count < 0 ? 0 : this._count--;

    notifyListeners();
  }
}
