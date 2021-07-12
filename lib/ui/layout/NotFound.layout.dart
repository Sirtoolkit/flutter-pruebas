part of'../views/views.dart';
class NotFoundLayout extends StatelessWidget {
  const NotFoundLayout();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         color: Colors.teal,
        child: Center(
          child: Text('404!!'),
        ),
      ),
    );
  }
}
