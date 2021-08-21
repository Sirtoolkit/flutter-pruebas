part of 'layout.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: child,
    );
  }
}
