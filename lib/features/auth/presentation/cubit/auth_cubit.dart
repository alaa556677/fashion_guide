import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../main.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/register_use_case.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit <AuthStates>{
  AuthCubit(this.registerUseCase,this.loginUseCase) : super(AuthInitialState());
  static final AuthCubit _authCubit = BlocProvider.of<AuthCubit>(navigatorKey.currentState!.context);
  static AuthCubit get instance => _authCubit;
////////////////////////////////////////////////////////////////////////////////
  RegisterUseCase registerUseCase;
  register({required int role,required String userName,required String email ,required String password}) async {
    emit(RegisterLoadingState());
    final result = await registerUseCase(role,userName,email,password);
    result.fold((failure) {
      emit(RegisterFailureState());
    },(register) {
      if (register.isSuccess == true) {
        emit(RegisterSuccessState());
      } else {
        emit(RegisterErrorState());
      }
    });
  }

////////////////////////////////////////////////////////////////////////////////
  LoginUseCase loginUseCase;
  login({required String email ,required String password}) async {
    emit(LoginLoadingState());
    final result = await loginUseCase(email,password);
    result.fold((failure) {
      print('ssssssssssssssssss${failure.errorMessage}');
      emit(LoginFailureState());
    },(register) {
      if (register.isSuccess == true) {
        emit(LoginSuccessState());
      } else {
        emit(LoginErrorState());
      }
    });
  }

}