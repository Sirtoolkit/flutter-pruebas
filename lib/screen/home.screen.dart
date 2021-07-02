import 'package:flutter/material.dart';
import 'package:flutter_prueba/provider/dialog.user.provider.dart';
import 'package:flutter_prueba/provider/home.provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().setUserList();
    context.read<HomeProvider>().setLocationList();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.read<HomeProvider>();
    final dialogUserProvider = context.watch<DialogUserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuarios'),
      ),
      body: StreamBuilder(
        stream: homeProvider.streamControllerListUser,
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final list = snapshot.data;

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            return RefreshIndicator(
              key: UniqueKey(),
              onRefresh: () async {
                context.read<HomeProvider>().setUserList();
                context.read<HomeProvider>().setLocationList();
              },
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (c, i) {
                  return Dismissible(
                    key: UniqueKey(),
                    child: ListTile(
                      title: Text('${list[i].name}'),
                      subtitle: Text('${list[i].location}'),
                      onTap: () {},
                    ),
                    onDismissed: (_) {
                      dialogUserProvider.deleteUser(list[i].id.toString());
                    },
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Text('No hay Datos!!'),
            );
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.shopping_bag_rounded),
            onPressed: () => homeProvider.showCreateUser(context: context),
          ),
          FloatingActionButton(
            child: Icon(Icons.location_on_rounded),
            onPressed: () => homeProvider.showCreateLocation(context: context),
          ),
          FloatingActionButton(
            child: Icon(Icons.person_add_rounded),
            onPressed: () => homeProvider.showCreateUser(context: context),
          ),
        ],
      ),
    );
  }
}
