part of 'views.dart';

class LoginView extends StatelessWidget {
  const LoginView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SelectableText(
          '¡Login page!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () => context.read<AuthProvider>().login(),
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.pink,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
