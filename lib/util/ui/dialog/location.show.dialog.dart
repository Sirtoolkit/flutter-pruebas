import 'package:flutter/material.dart';
import 'package:flutter_prueba/provider/dialog.location.provider%20.dart';
import 'package:flutter_prueba/provider/home.provider.dart';
import 'package:provider/provider.dart';

void showdialogCreateLocation({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      final dialogLocationProvider = context.watch<DialogLocationProvider>();

      return AlertDialog(
        scrollable: true,
        title: Text('Crear Ubicacion'),
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
              dialogLocationProvider.saveLocation();
              context.read<HomeProvider>().setLocationList();

              Navigator.pop(context);
            },
          ),
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: dialogLocationProvider.location,
              decoration: InputDecoration(hintText: 'Location'),
            ),
          ],
        ),
      );
    },
  );
}
