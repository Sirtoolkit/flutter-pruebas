part of 'provider.dart';

enum AuthStatus { checking, checkingDone, authenticated, noAuthenticated }

class AuthProvider with ChangeNotifier {
  late AuthStatus authStatus = AuthStatus.noAuthenticated;

  AuthProvider() {
    this.verifyAuthenticated();
  }

  void login() async {
    final String? token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';

    LocalStorage.saveValue('token', token);
    authStatus = AuthStatus.authenticated;

    NavigationServices.navigateReplaceTo(HomeRoute);
    notifyListeners();
  }

  void logout() async {
    LocalStorage.clear();

    authStatus = AuthStatus.noAuthenticated;

    NavigationServices.navigateReplaceTo(LoginRoute);
    notifyListeners();
  }

  Future<bool> verifyAuthenticated() async {
    final String? tokenStorage = LocalStorage.getValue('token');
    
    if (tokenStorage == null) {
      authStatus = AuthStatus.noAuthenticated;
      notifyListeners();
      return false;
    }

    authStatus = AuthStatus.authenticated;
    notifyListeners();

    return true;
  }
}
