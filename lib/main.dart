import 'package:ecommerce_project/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/register/register_bloc.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/user/user_bloc.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/validation/validation_bloc.dart';
import 'package:ecommerce_project/features/authentication/presentation/pages/LoginPage.dart';
import 'package:ecommerce_project/features/authentication/presentation/pages/RegisterPage.dart';
import 'package:ecommerce_project/features/home/presentation/bloc/category/category_bloc.dart';
import 'package:ecommerce_project/features/order/presentation/bloc/delete_order/order_bloc.dart';
import 'package:ecommerce_project/features/order/presentation/bloc/fetch_order/order_bloc.dart';
import 'package:ecommerce_project/features/order/presentation/bloc/update_order/order_bloc.dart';
import 'package:ecommerce_project/features/order/presentation/bloc/local_order/order_bloc.dart';
import 'package:ecommerce_project/features/order/presentation/pages/order.dart';
import 'package:ecommerce_project/features/restaurant/presentation/bloc/restaurant_all/restaurant_bloc.dart';
import 'package:ecommerce_project/features/home/presentation/pages/Home.dart';
import 'package:ecommerce_project/features/restaurant/presentation/bloc/food/food_bloc.dart';
import 'package:ecommerce_project/features/restaurant/presentation/bloc/like/like_bloc.dart';
import 'package:ecommerce_project/features/restaurant/presentation/bloc/restaurant_by_id/restaurant_bloc.dart';
import 'package:ecommerce_project/features/restaurant/presentation/bloc/restaurant_by_like/restaurant_bloc.dart';
import 'package:ecommerce_project/features/restaurant/presentation/bloc/restaurant_by_type/restaurant_bloc.dart';
import 'package:ecommerce_project/features/restaurant/presentation/pages/restaurant_detail_page.dart';
import 'package:ecommerce_project/features/restaurant/presentation/pages/restaurant_like_page.dart';
import 'package:ecommerce_project/features/restaurant/presentation/pages/restaurant_list_page.dart';
import 'package:ecommerce_project/injection_container.dart';
import 'package:ecommerce_project/main_scafold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  final GoRouter router = GoRouter(
    initialLocation: "/login",
    routes: <RouteBase>[
      ShellRoute(
        builder: (context, state, child) {
          return MainScafold(child: child);
        },
        routes: [
          GoRoute(
            path: "/home",
            builder: (context, state) {
              return HomePage();
            },
          ),
          GoRoute(
            path: "/restaurant_like",
            builder: (context, state) {
              return RestaurantLikePage();
            },
          ),
        ],
      ),
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
        path: "/restaurant_detail/:id",
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return BlocProvider(
            create: (_) => getIt<OrderLocalBloc>(),
            child: RestaurantDetailPage(id: id!),
          );
        },
      ),
      GoRoute(
        path: "/restaurant_list/:type",
        builder: (context, state) {
          final type = state.pathParameters['type'];
          if (type == null) {
            return Container();
          }
          return RestaurantListPage(type: type);
        },
      ),
      GoRoute(
        path: "/order",
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<FetchOrderBloc>()),
              BlocProvider(create: (_) => getIt<DeleteOrderBloc>()),
            ],
            child: OrderPage(),
          );
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
        BlocProvider(create: (_) => getIt<RestaurantByIdBloc>()),
        BlocProvider(create: (_) => getIt<RestaurantByTypeBloc>()),
        BlocProvider(create: (_) => getIt<RestaurantByLikeBloc>()),
        BlocProvider(create: (_) => getIt<FoodBloc>()),
        BlocProvider(create: (_) => getIt<UpdateOrderBloc>()),
        BlocProvider(create: (_) => getIt<LikeBloc>()),
        BlocProvider(create: (_) => getIt<UserBloc>()),
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
