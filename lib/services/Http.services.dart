part of 'services.dart';

class HttpServices {
  Future<dynamic> getValue(String unencodedPath) async {
    final url = Uri.https(
        '${ApiUrlConstants.URL}', '${ApiUrlConstants.PATH}$unencodedPath');
    try {
      final response = await http.get(url);

      switch (response.statusCode) {
        case 200:
          return jsonDecode(response.body );
        case 400:
        case 409:
        case 404:
          throw Exception('ErrorGet');
        default:
      }
    } catch (e) {
      throw Exception('ErrorGet');
    }
  }
}

HttpServices httpServices = new HttpServices();
