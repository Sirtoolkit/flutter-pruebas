part of 'provider.dart';

class ApiProvider with ChangeNotifier {
  late List<User> _users;

  ApiProvider() {
    this._users = [];
  }

  List<User> get users => this._users;

  void setUsers() async {
    this._users = await apiRepositories.getUsers();
    notifyListeners();
  }
  
}
