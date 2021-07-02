import 'package:flutter/material.dart';
import 'package:flutter_prueba/provider/dialog.user.provider.dart';
import 'package:provider/provider.dart';

import '../../../provider/home.provider.dart';

void showdialogCreateUser({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      final dialogUserProvider = context.watch<DialogUserProvider>();
      final homeProvider = context.watch<HomeProvider>();
      final size = MediaQuery.of(context).size;
      return AlertDialog(
        scrollable: true,
        title: Text('Crear Usuario'),
        actions: [
          ElevatedButton(
            child: Text('cancelar'),
            style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ElevatedButton(
            child: Text('Crear'),
            onPressed: () {
              dialogUserProvider.saveUser();
              context.read<HomeProvider>().setUserList();
              Navigator.pop(context);
            },
          ),
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: dialogUserProvider.displayName,
              decoration: InputDecoration(hintText: 'Name'),
            ),
            Container(
              width: size.width,
              child: DropdownButton<int>(
                isExpanded: true,
                value: homeProvider.locationList.first.id,
                onChanged: (value) => dialogUserProvider.setIdLocation(value!),
                items: List.generate(
                  homeProvider.locationList.length,
                  (index) {
                    final locations = homeProvider.locationList[index];
                    return DropdownMenuItem<int>(
                      child: Text('${locations.location}'),
                      value: locations.id,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
