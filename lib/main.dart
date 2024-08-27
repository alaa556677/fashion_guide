import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/bloc_observer.dart';
import 'features/base_screen/presentation/cubit/base_screen_cubit.dart';
import 'features/base_screen/presentation/pages/base_screen.dart';
import 'features/home/presentation/pages/home_screen.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/onBoarding/presentation/cubit/onBoarding_cubit.dart';
import 'features/onBoarding/presentation/pages/OnBoarding_screen.dart';
import 'features/onBoarding/presentation/pages/onBoarding_body.dart';
import 'features/onBoarding/presentation/pages/splash_screen.dart';
import 'features/products/presentation/cubit/products_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

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
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            navigatorKey: navigatorKey,
          ),
        );
      },
    );
  }
}