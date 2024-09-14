
import 'package:get_it/get_it.dart';

import 'features/auth/data/data_source/login_data_source.dart';
import 'features/auth/data/data_source/register_data_source.dart';
import 'features/auth/data/repository/auth_repo_impl.dart';
import 'features/auth/domain/repository/auth_repo.dart';
import 'features/auth/domain/use_cases/login_use_case.dart';
import 'features/auth/domain/use_cases/register_use_case.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/base_screen/presentation/cubit/base_screen_cubit.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/onBoarding/presentation/cubit/onBoarding_cubit.dart';
import 'features/products/presentation/cubit/products_cubit.dart';

final locator = GetIt.instance;

void setup() {
/////////////////////////////////////////////////////////// Cubit
  locator.registerFactory(() => AuthCubit(locator(),locator()));
  locator.registerFactory(() => OnBoardingCubit());
  locator.registerFactory(() => HomeCubit());
  locator.registerFactory(() => BaseScreenCubit());
  locator.registerFactory(() => ProductsCubit());

///////////////////////////////////// data source
  locator.registerLazySingleton<RegisterDataSource>(() => RegisterDataSource());
  locator.registerLazySingleton<LoginDataSource>(() => LoginDataSource());


/////////////////////////////////////////// use case
  locator.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(locator(),));
  locator.registerLazySingleton<LoginUseCase>(() => LoginUseCase(locator(),));


  ////////////////////////////////////////////////////////// repository
  locator.registerLazySingleton<AuthRepository>(() =>
      AuthRepositoryImpl(locator(),locator()));
/////////////////////////////////////////////////////////////////////////////////////////////////////////
}
