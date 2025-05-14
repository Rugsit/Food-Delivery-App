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
    gh.lazySingleton<_i718.AuthRepository>(
      () => _i1040.AuthRepositoryImpl(gh<_i697.AuthRemoteDatasource>()),
    );
    gh.factory<_i506.Login>(() => _i506.Login(gh<_i718.AuthRepository>()));
    gh.factory<_i394.Register>(
      () => _i394.Register(gh<_i718.AuthRepository>()),
    );
    gh.factory<_i895.LoginBloc>(() => _i895.LoginBloc(gh<_i506.Login>()));
    gh.factory<_i483.RegisterBloc>(
      () => _i483.RegisterBloc(gh<_i394.Register>()),
    );
    return this;
  }
}
