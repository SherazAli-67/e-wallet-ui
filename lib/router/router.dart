import 'package:e_wallet/presentation/screens/enter_pin_screen.dart';
import 'package:e_wallet/presentation/screens/welcome_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  initialLocation: NamedRoutes.welcome.routeName,
  routes: [
    GoRoute(path: NamedRoutes.welcome.routeName, builder: (_, state)=> WelcomeScreen()),
    GoRoute(path: NamedRoutes.enterPin.routeName, builder: (_, state)=> EnterPinScreen()),
  ],
);

enum NamedRoutes {
  welcome('/welcome'),
  enterPin('/enter-pin'),
  dashboard('/dashboard'),
  report('/report');

  final String routeName;
  const NamedRoutes(this.routeName);
}
