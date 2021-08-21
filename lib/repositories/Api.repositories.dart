import 'package:flutter_prueba/model/User.model.dart';
import 'package:flutter_prueba/services/services.dart';

class ApiRepositories {
  Future<List<User>> getUsers() async {
    final data = await httpServices.getValue('/users');

    final List<dynamic> values = data['data'].map((e) => e).toList();

    List<User> users = values.map((e) => User.fromJson(e)).toList();

    return users;
  }
}

ApiRepositories apiRepositories = new ApiRepositories();
