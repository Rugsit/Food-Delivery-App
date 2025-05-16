import 'package:ecommerce_project/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/register/register_bloc.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/validation/validation_bloc.dart';
import 'package:ecommerce_project/features/authentication/presentation/pages/LoginPage.dart';
import 'package:ecommerce_project/features/authentication/presentation/pages/RegisterPage.dart';
import 'package:ecommerce_project/features/home/presentation/bloc/category/category_bloc.dart';
import 'package:ecommerce_project/features/home/presentation/bloc/restaurant/restaurant_bloc.dart';
import 'package:ecommerce_project/features/home/presentation/pages/Home.dart';
import 'package:ecommerce_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  final GoRouter router = GoRouter(
    initialLocation: "/home",
    routes: <RouteBase>[
      GoRoute(
        path: "/login",
        builder: (context, state) {
          return BlocProvider(
            create: (_) => getIt<ValidationFormBloc>(),
            child: LoginPage(),
          );
        },
      ),
      GoRoute(
        path: "/register",
        builder: (context, state) {
          return BlocProvider(
            create: (_) => getIt<ValidationFormBloc>(),
            child: RegisterPage(),
          );
        },
      ),
      GoRoute(
        path: "/home",
        builder: (context, state) {
          return HomePage();
        },
      ),
    ],
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<RegisterBloc>()),
        BlocProvider(create: (_) => getIt<LoginBloc>()),
        BlocProvider(create: (_) => getIt<CategoryBloc>()),
        BlocProvider(create: (_) => getIt<RestaurantBloc>()),
      ],
      child: MyApp(router: router),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
    );
  }
}
