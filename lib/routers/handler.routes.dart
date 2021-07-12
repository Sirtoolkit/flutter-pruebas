part of 'routes.dart';

final Handler loginHandler = Handler(
  handlerFunc: (context, __) =>
      context!.watch<AuthProvider>().authStatus == AuthStatus.authenticated
          ? HomeView()
          : LoginView(),
);

final Handler homeHandler = Handler(
  handlerFunc: (context, __) =>
      context!.watch<AuthProvider>().authStatus == AuthStatus.authenticated
          ? HomeView()
          : LoginView(),
);

final Handler counterHandler = Handler(
  handlerFunc: (context, params) {
    if (context!.watch<AuthProvider>().authStatus == AuthStatus.authenticated) {
      return CounterView(
        count: params['count']?.first ?? '0',
      );
    } else {
      return LoginView();
    }
  },
);

final Handler apiHandler = Handler(
  handlerFunc: (context, params) {
    if (context!.watch<AuthProvider>().authStatus == AuthStatus.authenticated) {
      return ApiView();
    } else {
      return LoginView();
    }
  },
);

final Handler notFoundHandler = Handler(
  handlerFunc: (context, __) {
    return NotFoundLayout();
  },
);
