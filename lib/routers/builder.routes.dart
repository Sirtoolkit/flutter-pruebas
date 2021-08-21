part of 'routes.dart';

final Widget Function(BuildContext, Widget?)? builderRouter = (context, child) {
  final authProvider = context.watch<AuthProvider>();

  if (AuthStatus.authenticated == authProvider.authStatus) {
    return HomeLayout(
      child: child!,
    );
  } else {
    return AuthLayout(
      child: child!,
    );
  }
};

