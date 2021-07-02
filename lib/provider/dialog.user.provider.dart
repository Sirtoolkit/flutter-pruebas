import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_prueba/services/user.service.dart';
import 'package:flutter_prueba/model/user.moder.dart';

class DialogUserProvider with ChangeNotifier {
  late TextEditingController _displayName;
  late int _idLocation;

  DialogUserProvider.init() {
    this._displayName = TextEditingController(text: '');
    this._idLocation = 0;
  }

  TextEditingController get displayName => this._displayName;
  int get idLocation => this._idLocation;

  void setIdLocation(int id) {
    this._idLocation = id;
    notifyListeners();
  }

  void saveUser() async {
    if ([this._displayName].contains('') || this._idLocation == 0) {
      return;
    }

    final user = User(location: this._idLocation, name: this._displayName.text);
    await userService.postUsers(user);
    this._clearInput();
    notifyListeners();
  }

  void deleteUser(String id) async {
    await userService.deleteUsers(id);
    notifyListeners();
  }

  void _clearInput() {
    this._displayName.text = '';
    notifyListeners();
  }
}
