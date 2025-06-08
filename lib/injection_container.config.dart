// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_project/features/authentication/data/datasources/auth_remote.dart'
    as _i697;
import 'package:ecommerce_project/features/authentication/data/repositories/auth_repository_impl.dart'
    as _i1040;
import 'package:ecommerce_project/features/authentication/domain/repositories/auth_repository.dart'
    as _i718;
import 'package:ecommerce_project/features/authentication/domain/usecases/fetch_user.dart'
    as _i54;
import 'package:ecommerce_project/features/authentication/domain/usecases/login.dart'
    as _i506;
import 'package:ecommerce_project/features/authentication/domain/usecases/register.dart'
    as _i394;
import 'package:ecommerce_project/features/authentication/presentation/bloc/login/login_bloc.dart'
    as _i895;
import 'package:ecommerce_project/features/authentication/presentation/bloc/register/register_bloc.dart'
    as _i483;
import 'package:ecommerce_project/features/authentication/presentation/bloc/user/user_bloc.dart'
    as _i900;
import 'package:ecommerce_project/features/authentication/presentation/bloc/validation/validation_bloc.dart'
    as _i102;
import 'package:ecommerce_project/features/home/data/datasources/home_remote_datasource.dart'
    as _i287;
import 'package:ecommerce_project/features/home/data/repositories/category_repository_impl.dart'
    as _i927;
import 'package:ecommerce_project/features/home/domain/repositories/category_repository.dart'
    as _i962;
import 'package:ecommerce_project/features/home/domain/usecases/fetch_category.dart'
    as _i483;
import 'package:ecommerce_project/features/home/presentation/bloc/category/category_bloc.dart'
    as _i893;
import 'package:ecommerce_project/features/order/data/datasource/order_remote_datasource.dart'
    as _i782;
import 'package:ecommerce_project/features/order/data/repositories/order_repository_impl.dart'
    as _i493;
import 'package:ecommerce_project/features/order/domain/repositories/order_repository.dart'
    as _i1064;
import 'package:ecommerce_project/features/order/domain/usecase/add_order.dart'
    as _i914;
import 'package:ecommerce_project/features/order/domain/usecase/delete_order.dart'
    as _i473;
import 'package:ecommerce_project/features/order/domain/usecase/fetch_order.dart'
    as _i37;
import 'package:ecommerce_project/features/order/domain/usecase/update_order.dart'
    as _i350;
import 'package:ecommerce_project/features/order/presentation/bloc/delete_order/order_bloc.dart'
    as _i579;
import 'package:ecommerce_project/features/order/presentation/bloc/fetch_order/order_bloc.dart'
    as _i556;
import 'package:ecommerce_project/features/order/presentation/bloc/local_order/order_bloc.dart'
    as _i786;
import 'package:ecommerce_project/features/order/presentation/bloc/update_order/order_bloc.dart'
    as _i18;
import 'package:ecommerce_project/features/restaurant/data/datasource/restaurant_remote_datasource.dart'
    as _i958;
import 'package:ecommerce_project/features/restaurant/data/repositories/restaurant_repository_impl.dart'
    as _i735;
import 'package:ecommerce_project/features/restaurant/domain/repositories/restaurant_repository.dart'
    as _i893;
import 'package:ecommerce_project/features/restaurant/domain/usecase/fetch_food_by_restaurant_id.dart'
    as _i1062;
import 'package:ecommerce_project/features/restaurant/domain/usecase/fetch_restaurant.dart'
    as _i425;
import 'package:ecommerce_project/features/restaurant/domain/usecase/fetch_restaurant_by_id.dart'
    as _i653;
import 'package:ecommerce_project/features/restaurant/domain/usecase/fetch_restaurant_by_like.dart'
    as _i730;
import 'package:ecommerce_project/features/restaurant/domain/usecase/fetch_restaurant_liked.dart'
    as _i220;
import 'package:ecommerce_project/features/restaurant/domain/usecase/fetch_restaurant_liked_by_id.dart'
    as _i213;
import 'package:ecommerce_project/features/restaurant/domain/usecase/fetch_restaurants_by_type.dart'
    as _i217;
import 'package:ecommerce_project/features/restaurant/domain/usecase/like.dart'
    as _i502;
import 'package:ecommerce_project/features/restaurant/domain/usecase/unlike.dart'
    as _i715;
import 'package:ecommerce_project/features/restaurant/presentation/bloc/food/food_bloc.dart'
    as _i377;
import 'package:ecommerce_project/features/restaurant/presentation/bloc/like/like_bloc.dart'
    as _i269;
import 'package:ecommerce_project/features/restaurant/presentation/bloc/like_list/like_bloc.dart'
    as _i595;
import 'package:ecommerce_project/features/restaurant/presentation/bloc/restaurant_all/restaurant_bloc.dart'
    as _i439;
import 'package:ecommerce_project/features/restaurant/presentation/bloc/restaurant_by_id/restaurant_bloc.dart'
    as _i608;
import 'package:ecommerce_project/features/restaurant/presentation/bloc/restaurant_by_like/restaurant_bloc.dart'
    as _i1038;
import 'package:ecommerce_project/features/restaurant/presentation/bloc/restaurant_by_type/restaurant_bloc.dart'
    as _i889;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i102.ValidationFormBloc>(() => _i102.ValidationFormBloc());
    gh.factory<_i786.OrderLocalBloc>(() => _i786.OrderLocalBloc());
    gh.factory<_i697.AuthRemoteDatasource>(
      () => _i697.AuthRemoteDatasource(gh<_i454.SupabaseClient>()),
    );
    gh.factory<_i287.HomeRemoteDataSource>(
      () => _i287.HomeRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.factory<_i782.OrderRemoteDatasource>(
      () => _i782.OrderRemoteDatasource(gh<_i454.SupabaseClient>()),
    );
    gh.factory<_i958.RestaurantRemoteDataSource>(
      () => _i958.RestaurantRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i962.CategoryRepository>(
      () => _i927.CategoryRepositoryImpl(
        remoteDataSource: gh<_i287.HomeRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i893.RestaurantRepository>(
      () => _i735.RestaurantRepositoryImpl(
        remoteDataSource: gh<_i958.RestaurantRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i718.AuthRepository>(
      () => _i1040.AuthRepositoryImpl(gh<_i697.AuthRemoteDatasource>()),
    );
    gh.lazySingleton<_i1064.OrderRepository>(
      () => _i493.OrderRepositoryImpl(
        remoteDataSource: gh<_i782.OrderRemoteDatasource>(),
      ),
    );
    gh.factory<_i483.FetchCategoriesUseCase>(
      () => _i483.FetchCategoriesUseCase(
        repository: gh<_i962.CategoryRepository>(),
      ),
    );
    gh.factory<_i1062.FetchFoodByRestaurantIdUseCase>(
      () => _i1062.FetchFoodByRestaurantIdUseCase(
        repository: gh<_i893.RestaurantRepository>(),
      ),
    );
    gh.factory<_i425.FetchRestaurantsUseCase>(
      () => _i425.FetchRestaurantsUseCase(
        repository: gh<_i893.RestaurantRepository>(),
      ),
    );
    gh.factory<_i217.FetchRestaurantsByTypeUseCase>(
      () => _i217.FetchRestaurantsByTypeUseCase(
        repository: gh<_i893.RestaurantRepository>(),
      ),
    );
    gh.factory<_i653.FetchRestaurantByIdUseCase>(
      () => _i653.FetchRestaurantByIdUseCase(
        repository: gh<_i893.RestaurantRepository>(),
      ),
    );
    gh.factory<_i730.FetchRestaurantsByLikeUseCase>(
      () => _i730.FetchRestaurantsByLikeUseCase(
        repository: gh<_i893.RestaurantRepository>(),
      ),
    );
    gh.factory<_i220.FetchRestaurantLiked>(
      () => _i220.FetchRestaurantLiked(
        repository: gh<_i893.RestaurantRepository>(),
      ),
    );
    gh.factory<_i213.FetchRestaurantLikedByIdUseCase>(
      () => _i213.FetchRestaurantLikedByIdUseCase(
        repository: gh<_i893.RestaurantRepository>(),
      ),
    );
    gh.factory<_i502.LikeUseCase>(
      () => _i502.LikeUseCase(repository: gh<_i893.RestaurantRepository>()),
    );
    gh.factory<_i715.UnlikeUseCase>(
      () => _i715.UnlikeUseCase(repository: gh<_i893.RestaurantRepository>()),
    );
    gh.factory<_i1038.RestaurantByLikeBloc>(
      () => _i1038.RestaurantByLikeBloc(
        gh<_i730.FetchRestaurantsByLikeUseCase>(),
      ),
    );
    gh.factory<_i914.AddOrderUseCase>(
      () => _i914.AddOrderUseCase(gh<_i1064.OrderRepository>()),
    );
    gh.factory<_i473.DeleteOrderUesCase>(
      () => _i473.DeleteOrderUesCase(gh<_i1064.OrderRepository>()),
    );
    gh.factory<_i37.FetchOrderUesCase>(
      () => _i37.FetchOrderUesCase(gh<_i1064.OrderRepository>()),
    );
    gh.factory<_i350.UpdateOrderUseCase>(
      () => _i350.UpdateOrderUseCase(gh<_i1064.OrderRepository>()),
    );
    gh.factory<_i18.UpdateOrderBloc>(
      () => _i18.UpdateOrderBloc(
        updateOrderUseCase: gh<_i350.UpdateOrderUseCase>(),
        fetchOrderUseCase: gh<_i37.FetchOrderUesCase>(),
      ),
    );
    gh.factory<_i893.CategoryBloc>(
      () => _i893.CategoryBloc(gh<_i483.FetchCategoriesUseCase>()),
    );
    gh.factory<_i269.LikeBloc>(
      () => _i269.LikeBloc(
        gh<_i502.LikeUseCase>(),
        gh<_i715.UnlikeUseCase>(),
        gh<_i213.FetchRestaurantLikedByIdUseCase>(),
      ),
    );
    gh.factory<_i579.DeleteOrderBloc>(
      () => _i579.DeleteOrderBloc(
        deleteOrderUseCase: gh<_i473.DeleteOrderUesCase>(),
      ),
    );
    gh.factory<_i889.RestaurantByTypeBloc>(
      () =>
          _i889.RestaurantByTypeBloc(gh<_i217.FetchRestaurantsByTypeUseCase>()),
    );
    gh.factory<_i608.RestaurantByIdBloc>(
      () => _i608.RestaurantByIdBloc(gh<_i653.FetchRestaurantByIdUseCase>()),
    );
    gh.factory<_i54.FetchUserUseCase>(
      () => _i54.FetchUserUseCase(gh<_i718.AuthRepository>()),
    );
    gh.factory<_i506.LoginUseCase>(
      () => _i506.LoginUseCase(gh<_i718.AuthRepository>()),
    );
    gh.factory<_i394.RegisterUseCase>(
      () => _i394.RegisterUseCase(gh<_i718.AuthRepository>()),
    );
    gh.factory<_i483.RegisterBloc>(
      () => _i483.RegisterBloc(gh<_i394.RegisterUseCase>()),
    );
    gh.factory<_i595.LikeListBloc>(
      () => _i595.LikeListBloc(gh<_i220.FetchRestaurantLiked>()),
    );
    gh.factory<_i377.FoodBloc>(
      () => _i377.FoodBloc(gh<_i1062.FetchFoodByRestaurantIdUseCase>()),
    );
    gh.factory<_i439.RestaurantBloc>(
      () => _i439.RestaurantBloc(gh<_i425.FetchRestaurantsUseCase>()),
    );
    gh.factory<_i556.FetchOrderBloc>(
      () =>
          _i556.FetchOrderBloc(fetchOrderUseCase: gh<_i37.FetchOrderUesCase>()),
    );
    gh.factory<_i895.LoginBloc>(
      () => _i895.LoginBloc(gh<_i506.LoginUseCase>()),
    );
    gh.factory<_i900.UserBloc>(
      () => _i900.UserBloc(gh<_i54.FetchUserUseCase>()),
    );
    return this;
  }
}
