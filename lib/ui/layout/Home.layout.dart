part of 'layout.dart';

class HomeLayout extends StatelessWidget {
  final Widget child;
  const HomeLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.read<HomeProvider>();

    final textStyle =
        TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purpleAccent,
        title: Row(
          children: [
            TextButton(
              onPressed: () => homeProvider.setCurrentPage(HomeRoute),
              child: Text('Home Page', style: textStyle),
            ),
            VerticalDivider(),
            TextButton(
              onPressed: () => homeProvider.setCurrentPage('/counter/1'),
              child: Text('Counter Page', style: textStyle),
            ),
            VerticalDivider(),
            TextButton(
              onPressed: () =>homeProvider.setCurrentPage(ApiRoute),
              child: Text('Api Page', style: textStyle),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.purpleAccent,
      body: child,
    );
  }
}
