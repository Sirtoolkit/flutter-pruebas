import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_prueba/model/location.model.dart';
import 'package:flutter_prueba/services/location.service.dart';
import 'package:flutter_prueba/services/user.service.dart';
import 'package:flutter_prueba/util/ui/dialog/location.show.dialog.dart';
import 'package:flutter_prueba/util/ui/dialog/user.show.dialog.dart';
import 'package:flutter_prueba/model/user.moder.dart';

class HomeProvider with ChangeNotifier {
  late List<Location> _locationList;
  late StreamController<List<User>> _streamControllerListUser;
  HomeProvider.init() {
    this._locationList = [];
    this._streamControllerListUser = StreamController<List<User>>();
  }

  // ignore: must_call_super
  void dispose() {
    this._streamControllerListUser.close();
    notifyListeners();
  }

  Stream<List<User>> get streamControllerListUser =>
      this._streamControllerListUser.stream;

  List<Location> get locationList => this._locationList;

  void setUserList() async {
    final userList = await userService.getUsers();
    this._streamControllerListUser.add(userList);
    notifyListeners();
  }

  void setLocationList() async {
    this._locationList = await locationService.getLocations();
    notifyListeners();
  }

  void showCreateUser({required BuildContext context}) {
    showdialogCreateUser(context: context);
    notifyListeners();
  }

  void showCreateLocation({required BuildContext context}) {
    showdialogCreateLocation(context: context);
    notifyListeners();
  }
}
