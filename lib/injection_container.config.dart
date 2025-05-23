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
import 'package:ecommerce_project/features/authentication/domain/usecases/login.dart'
    as _i506;
import 'package:ecommerce_project/features/authentication/domain/usecases/register.dart'
    as _i394;
import 'package:ecommerce_project/features/authentication/presentation/bloc/login/login_bloc.dart'
    as _i895;
import 'package:ecommerce_project/features/authentication/presentation/bloc/register/register_bloc.dart'
    as _i483;
import 'package:ecommerce_project/features/authentication/presentation/bloc/validation/validation_bloc.dart'
    as _i102;
import 'package:ecommerce_project/features/home/data/datasources/home_remote_datasource.dart'
    as _i287;
import 'package:ecommerce_project/features/home/data/repositories/category_repository_impl.dart'
    as _i927;
import 'package:ecommerce_project/features/home/data/repositories/restaurant_repository_impl.dart'
    as _i271;
import 'package:ecommerce_project/features/home/domain/repositories/category_repository.dart'
    as _i962;
import 'package:ecommerce_project/features/home/domain/repositories/restaurant_repository.dart'
    as _i581;
import 'package:ecommerce_project/features/home/domain/usecases/fetch_category.dart'
    as _i483;
import 'package:ecommerce_project/features/home/domain/usecases/fetch_restaurant.dart'
    as _i47;
import 'package:ecommerce_project/features/home/presentation/bloc/category/category_bloc.dart'
    as _i893;
import 'package:ecommerce_project/features/home/presentation/bloc/restaurant/restaurant_bloc.dart'
    as _i856;
import 'package:ecommerce_project/features/restaurant_detail/data/datasources/restaurant_detail_remote_datasource.dart'
    as _i985;
import 'package:ecommerce_project/features/restaurant_detail/data/repositories/restaurant_detail_repository_impl.dart'
    as _i224;
import 'package:ecommerce_project/features/restaurant_detail/domain/repositories/restaurant_detail_repository.dart'
    as _i827;
import 'package:ecommerce_project/features/restaurant_detail/domain/usecases/fetch_food_by_restaurant_id.dart'
    as _i747;
import 'package:ecommerce_project/features/restaurant_detail/domain/usecases/fetch_restaurant_by_id.dart'
    as _i475;
import 'package:ecommerce_project/features/restaurant_detail/domain/usecases/like.dart'
    as _i983;
import 'package:ecommerce_project/features/restaurant_detail/presentation/bloc/food/food_bloc.dart'
    as _i354;
import 'package:ecommerce_project/features/restaurant_detail/presentation/bloc/like/like_bloc.dart'
    as _i759;
import 'package:ecommerce_project/features/restaurant_detail/presentation/bloc/order/order_bloc.dart'
    as _i82;
import 'package:ecommerce_project/features/restaurant_detail/presentation/bloc/restaurant/restaurant_detail_bloc.dart'
    as _i46;
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
    gh.factory<_i697.AuthRemoteDatasource>(
      () => _i697.AuthRemoteDatasource(gh<_i454.SupabaseClient>()),
    );
    gh.factory<_i287.HomeRemoteDataSource>(
      () => _i287.HomeRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.factory<_i985.RestaurantDetailRemoteDatasource>(
      () => _i985.RestaurantDetailRemoteDatasource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i962.CategoryRepository>(
      () => _i927.CategoryRepositoryImpl(
        remoteDataSource: gh<_i287.HomeRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i581.RestaurantRepository>(
      () => _i271.RestaurantRepositoryImpl(
        remoteDataSource: gh<_i287.HomeRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i718.AuthRepository>(
      () => _i1040.AuthRepositoryImpl(gh<_i697.AuthRemoteDatasource>()),
    );
    gh.lazySingleton<_i827.RestaurantDetailRepository>(
      () => _i224.RestaurantDetailRepositoryImpl(
        remoteDataSource: gh<_i985.RestaurantDetailRemoteDatasource>(),
      ),
    );
    gh.factory<_i47.FetchRestaurantsUseCase>(
      () => _i47.FetchRestaurantsUseCase(
        repository: gh<_i581.RestaurantRepository>(),
      ),
    );
    gh.factory<_i483.FetchCategoriesUseCase>(
      () => _i483.FetchCategoriesUseCase(
        repository: gh<_i962.CategoryRepository>(),
      ),
    );
    gh.factory<_i856.RestaurantBloc>(
      () => _i856.RestaurantBloc(gh<_i47.FetchRestaurantsUseCase>()),
    );
    gh.factory<_i747.FetchFoodByRestaurantIdUseCase>(
      () => _i747.FetchFoodByRestaurantIdUseCase(
        repository: gh<_i827.RestaurantDetailRepository>(),
      ),
    );
    gh.factory<_i475.FetchRestaurantByIdUseCase>(
      () => _i475.FetchRestaurantByIdUseCase(
        repository: gh<_i827.RestaurantDetailRepository>(),
      ),
    );
    gh.factory<_i983.LikeUseCase>(
      () =>
          _i983.LikeUseCase(repository: gh<_i827.RestaurantDetailRepository>()),
    );
    gh.factory<_i759.FoodBloc>(() => _i759.FoodBloc(gh<_i983.LikeUseCase>()));
    gh.factory<_i893.CategoryBloc>(
      () => _i893.CategoryBloc(gh<_i483.FetchCategoriesUseCase>()),
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
    gh.factory<_i46.RestaurantDetailBloc>(
      () => _i46.RestaurantDetailBloc(gh<_i475.FetchRestaurantByIdUseCase>()),
    );
    gh.factory<_i354.FoodBloc>(
      () => _i354.FoodBloc(gh<_i747.FetchFoodByRestaurantIdUseCase>()),
    );
    gh.factory<_i82.OrderBloc>(
      () => _i82.OrderBloc(gh<_i747.FetchFoodByRestaurantIdUseCase>()),
    );
    gh.factory<_i895.LoginBloc>(
      () => _i895.LoginBloc(gh<_i506.LoginUseCase>()),
    );
    return this;
  }
}
