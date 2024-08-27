import 'package:fashion_guide/features/company/presentation/pages/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/bloc_observer.dart';
import 'core/constants/routes.dart';
import 'core/shared/cache_helper.dart';
import 'core/shared/dio_helper.dart';
import 'features/auth/presentation/pages/login_screen.dart';
import 'features/auth/presentation/pages/register_screen.dart';
import 'features/base_screen/presentation/cubit/base_screen_cubit.dart';
import 'features/base_screen/presentation/pages/base_screen.dart';
import 'features/company/presentation/pages/company_data_screen.dart';
import 'features/home/presentation/pages/home_screen.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/onBoarding/presentation/cubit/onBoarding_cubit.dart';
import 'features/onBoarding/presentation/pages/OnBoarding_screen.dart';
import 'features/onBoarding/presentation/pages/onBoarding_body.dart';
import 'features/onBoarding/presentation/pages/splash_screen.dart';
import 'features/products/presentation/cubit/products_cubit.dart';
import 'features/products/presentation/pages/product_data_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size (375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<OnBoardingCubit>(create: (_) => OnBoardingCubit(),),
            BlocProvider<BaseScreenCubit>(create: (_) => BaseScreenCubit(),),
            BlocProvider<HomeCubit>(create: (_) => HomeCubit()..initDummy(),),
            BlocProvider<ProductsCubit>(create: (_) => ProductsCubit(),),
          ],
          child: MaterialApp(
            navigatorKey: navigatorKey,
            scaffoldMessengerKey: snackBarKey,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (settings){
              Widget? wid;
              switch (settings.name) {
                case Routes.splashScreen:
                  wid = const SplashScreen();
                  break;
                case Routes.login:
                  wid = const LoginScreen();
                  break;
                case Routes.register:
                  wid = const RegisterScreen();
                  break;
                case Routes.baseScreen:
                  wid = const BaseScreen();
                  break;
                case Routes.chatScreen:
                  wid = const ChatScreen();
                  break;
                case Routes.companyDataScreen:
                  wid = const CompanyDataScreen();
                  break;
                case Routes.onBoardingScreen:
                  wid = const OnBoardingScreen();
                  break;
                case Routes.productsDataScreen:
                  wid = const ProductsDataScreen();
                  break;
                case Routes.homeScreen:
                  wid = const HomeScreen();
                  break;
              }
              if (wid != null) {
                return PageRouteBuilder(
                    settings: settings,
                    // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                    pageBuilder: (_, __, ___) => wid!,
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c));
              }
              return null;
            },
            navigatorObservers: [RouteObserver<PageRoute>()],
            initialRoute: Routes.onBoardingScreen,
          ),
        );
      },
    );
  }
}