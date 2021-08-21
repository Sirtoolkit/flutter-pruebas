import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:flutter_prueba/providers/provider.dart';
import 'package:flutter_prueba/ui/layout/layout.dart';
import 'package:flutter_prueba/ui/views/views.dart';

part 'builder.routes.dart';
part 'handler.routes.dart';
part 'path.route.dart';

class Fluro {
  static FluroRouter router = FluroRouter();
  static void setupRouter() {

    router.define(LoginRoute,
        handler: loginHandler, transitionType: TransitionType.fadeIn);

    router.define(HomeRoute,
        handler: homeHandler, transitionType: TransitionType.inFromLeft);

    router.define(ApiRoute,
        handler: apiHandler, transitionType: TransitionType.fadeIn);

    CounterRoute.forEach((element) {
      router.define(element,
          handler: counterHandler, transitionType: TransitionType.inFromTop);
    });

    router.notFoundHandler = notFoundHandler;
  }
}
