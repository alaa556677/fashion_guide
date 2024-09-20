
import 'package:get_it/get_it.dart';
import 'features/auth/data/data_source/login_data_source.dart';
import 'features/auth/data/data_source/register_data_source.dart';
import 'features/auth/data/repository/auth_repo_impl.dart';
import 'features/auth/domain/repository/auth_repo.dart';
import 'features/auth/domain/use_cases/login_use_case.dart';
import 'features/auth/domain/use_cases/register_use_case.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/base_screen/presentation/cubit/base_screen_cubit.dart';
import 'features/category/data/data_source/add_category_data_source.dart';
import 'features/category/data/data_source/categories_data_source.dart';
import 'features/category/data/data_source/delete_category_data_source.dart';
import 'features/category/data/data_source/update_category_data_source.dart';
import 'features/category/data/repository/category_repository_impl.dart';
import 'features/category/domain/repository/category_repository.dart';
import 'features/category/domain/use_cases/add_category_use_case.dart';
import 'features/category/domain/use_cases/categories_use_case.dart';
import 'features/category/domain/use_cases/delete_category_use_case.dart';
import 'features/category/domain/use_cases/update_category_use_case.dart';
import 'features/category/presentation/cubit/category_cubit.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/onBoarding/presentation/cubit/onBoarding_cubit.dart';
import 'features/products/data/data_source/add_product_data_source.dart';
import 'features/products/data/data_source/all_products_data_source.dart';
import 'features/products/data/data_source/delete_product_data_source.dart';
import 'features/products/data/data_source/update_product_data_source.dart';
import 'features/products/data/repository/product_repository_impl.dart';
import 'features/products/domain/repository/product_repository.dart';
import 'features/products/domain/use_cases/add_product_use_case.dart';
import 'features/products/domain/use_cases/all_products_use_case.dart';
import 'features/products/domain/use_cases/delete_product_use_case.dart';
import 'features/products/domain/use_cases/update_product_use_case.dart';
import 'features/products/presentation/cubit/products_cubit.dart';

final locator = GetIt.instance;

void setup() {

/////////////////////////////////////////////////////////// Cubit
  locator.registerFactory(() => AuthCubit(locator(),locator()));
  locator.registerFactory(() => OnBoardingCubit());
  locator.registerFactory(() => HomeCubit());
  locator.registerFactory(() => BaseScreenCubit());
  locator.registerFactory(() => ProductsCubit(locator(),locator(),locator(),locator(),locator()));
  locator.registerFactory(() => CategoryCubit(locator(),locator(),locator(),locator()));

///////////////////////////////////// data source
  locator.registerLazySingleton<RegisterDataSource>(() => RegisterDataSource());
  locator.registerLazySingleton<LoginDataSource>(() => LoginDataSource());
  locator.registerLazySingleton<AddProductDataSource>(() => AddProductDataSource());
  locator.registerLazySingleton<AddCategoryDataSource>(() => AddCategoryDataSource());
  locator.registerLazySingleton<AllCategoriesDataSource>(() => AllCategoriesDataSource());
  locator.registerLazySingleton<UpdateCategoryDataSource>(() => UpdateCategoryDataSource());
  locator.registerLazySingleton<DeleteCategoryDataSource>(() => DeleteCategoryDataSource());
  locator.registerLazySingleton<AllProductDataSource>(() => AllProductDataSource());
  locator.registerLazySingleton<UpdateProductDataSource>(() => UpdateProductDataSource());
  locator.registerLazySingleton<DeleteProductDataSource>(() => DeleteProductDataSource());


/////////////////////////////////////////// use case
  locator.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(locator(),));
  locator.registerLazySingleton<LoginUseCase>(() => LoginUseCase(locator(),));
  locator.registerLazySingleton<AddProductUseCase>(() => AddProductUseCase(locator(),));
  locator.registerLazySingleton<AddCategoryUseCase>(() => AddCategoryUseCase(locator(),));
  locator.registerLazySingleton<AllCategoriesUseCase>(() => AllCategoriesUseCase(locator(),));
  locator.registerLazySingleton<UpdateCategoryUseCase>(() => UpdateCategoryUseCase(locator(),));
  locator.registerLazySingleton<DeleteCategoryUseCase>(() => DeleteCategoryUseCase(locator(),));
  locator.registerLazySingleton<UpdateProductUseCase>(() => UpdateProductUseCase(locator(),));
  locator.registerLazySingleton<DeleteProductUseCase>(() => DeleteProductUseCase(locator(),));
  locator.registerLazySingleton<AllProductUseCase>(() => AllProductUseCase(locator(),));


////////////////////////////////////////////////////////// repository
  locator.registerLazySingleton<AuthRepository>(() =>
      AuthRepositoryImpl(locator(),locator()));
  locator.registerLazySingleton<ProductRepo>(() =>
      ProductRepoImpl(locator(),locator(),locator(),locator()));
  locator.registerLazySingleton<CategoryRepo>(() =>
      CategoryRepoImpl(locator(),locator(),locator(),locator()));
/////////////////////////////////////////////////////////////////////////////////////////////////////////
}
