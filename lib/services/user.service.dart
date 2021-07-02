import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_prueba/provider/response.model.dart';
import 'package:flutter_prueba/model/user.moder.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<List<User>> getUsers() async {
    List<User> userList = [];

    final url =
        Uri.https('fierce-fortress-79578.herokuapp.com', '/api/userAccount');

    try {
      final response = await http.get(url,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
      log(response.statusCode.toString());
      switch (response.statusCode) {
        case 200:
          final List<dynamic> data = jsonDecode(response.body);
          userList = data.map((e) => User.fromJson(e)).toList();
          break;
        default:
      }
    } on SocketException {} catch (e) {
      log(e.toString());
    }
    return userList;
  }

  Future<Response> postUsers(User user) async {
    final url =
        Uri.https('fierce-fortress-79578.herokuapp.com', '/api/userAccount');
    Response success = Response(success: false, message: "");

    try {
      final response = await http.post(
        url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode(user),
      );
      log(response.statusCode.toString());

      switch (response.statusCode) {
        case 200:
          success = Response(success: true, message: "Exito!!");
          break;
        default:
      }
    } on SocketException {
      success = Response(success: false, message: "Error de Conexion");
    } catch (e) {
      success = Response(success: false, message: "oh no!, hubo un error.");
    }
    return success;
  }


    Future<Response> deleteUsers(String id) async {
    final url =
        Uri.https('fierce-fortress-79578.herokuapp.com', '/api/userAccount/$id');
    Response success = Response(success: false, message: "");

    try {
      final response = await http.delete(
        url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      log(response.statusCode.toString());
      switch (response.statusCode) {
        case 200:
          success = Response(success: true, message: "Exito!!");
          break;
        default:
      }
    } on SocketException {
      success = Response(success: false, message: "Error de Conexion");
    } catch (e) {
      success = Response(success: false, message: "oh no!, hubo un error.");
    }
    return success;
  }
}

UserService userService = new UserService();
