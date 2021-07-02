import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_prueba/model/location.model.dart';
import 'package:flutter_prueba/provider/response.model.dart';
import 'package:http/http.dart' as http;

class LocationService {
  Future<List<Location>> getLocations() async {
    List<Location> locationList = [];
    final url =
        Uri.https('fierce-fortress-79578.herokuapp.com', '/api/location');

    try {
      final response = await http.get(url,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
      switch (response.statusCode) {
        case 200:
          final List<dynamic> data = jsonDecode(response.body);
          locationList = data.map((e) => Location.fromJson(e)).toList();
          break;
        default:
      }
    } on SocketException {} catch (e) {
      log(e.toString());
    }
    return locationList;
  }

  Future<Response> postLocation(Location location) async {
    final url =
        Uri.https('fierce-fortress-79578.herokuapp.com', '/api/location');
    Response success = Response(success: false, message: "");

    try {
      final response = await http.post(
        url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode(location),
      );

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

LocationService locationService = new LocationService();
