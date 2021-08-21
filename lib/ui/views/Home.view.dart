part of 'views.dart';

class HomeView extends StatelessWidget {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SelectableText(
          '¡Home Page!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () => context.read<AuthProvider>().logout(),
          child: Text(
            'Logout',
            style: TextStyle(
            color: Colors.purple,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          ),
          
        )
      ],
    );
  }
}
