part of 'provider.dart';

class HomeProvider with ChangeNotifier {
  void setCurrentPage(String path) {
    NavigationServices.navigateTo('$path');
  }
}
