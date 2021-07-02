import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_prueba/services/location.service.dart';
import 'package:flutter_prueba/model/location.model.dart';

class DialogLocationProvider with ChangeNotifier {
  late TextEditingController _location;

  DialogLocationProvider.init() {
    this._location = TextEditingController(text: '');
  }

  TextEditingController get location => this._location;

  void saveLocation() async {
    if ([this._location].contains('')) {
      return;
    }

    final location = Location(location: this._location.text);
    await locationService.postLocation(location);
    this._clearInput();
    notifyListeners();
  }

  void _clearInput() {
    this._location.text = '';
    notifyListeners();
  }
}
