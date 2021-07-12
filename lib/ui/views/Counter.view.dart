part of 'views.dart';

class CounterView extends StatelessWidget {
  final String? count;
  CounterView({this.count});

  @override
  Widget build(BuildContext context) {
    
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<CounterProvider>().setCounter(int.tryParse(count!) ?? 0);
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Selector<CounterProvider, int>(
          builder: (context, value, child) => SelectableText(
            '¡Counter Page! : $value',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          selector: (_, provider) => provider.count,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () =>
                  context.read<CounterProvider>().incrementCounter(),
              child: Text(
                '+',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () =>
                  context.read<CounterProvider>().decrementCounter(),
              child: Text(
                '-',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
