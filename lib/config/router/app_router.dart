import 'package:flutter_application_4/presentation/providers/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  )
]);
