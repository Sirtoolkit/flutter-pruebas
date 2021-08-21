part of 'views.dart';

class ApiView extends StatelessWidget {
  // bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    // if (!_initialized) {
    //   Future.microtask(() => context.read<ApiProvider>().setUsers());
    //   _initialized = true;
    //   print('object');
    // }

    // Future.delayed(Duration.zero, () {
    //   Future.microtask(() => context.read<ApiProvider>().setUsers());
    //   print('object');
    // });

    final apiProvider = context.watch<ApiProvider>();
    final size = MediaQuery.of(context).size;

    return apiProvider.users.length > 0
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    'Usuarios',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: size.height,
                    width: size.width,
                    child: ListView.builder(
                      itemCount: apiProvider.users.length,
                      itemBuilder: (context, index) {
                        final user = apiProvider.users[index];
                        return ListTile(
                          leading: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: FadeInImage(
                              placeholder: AssetImage('assets/img/loading.gif'),
                              fit: BoxFit.cover,
                              image: NetworkImage('${user.avatar}'),
                              height: 50,
                              width: 50,
                            ),
                          ),
                          title: SelectableText(
                            '${user.firstName}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
                          ),
                          subtitle: SelectableText(
                            '${user.email}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(
              color: Colors.purple,
            ),
          );
  }
}
