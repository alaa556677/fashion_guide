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
  String? errorMessage;
  RegisterUseCase registerUseCase;
  register({required int role,required String userName,required String email ,required String password}) async {
    emit(RegisterLoadingState());
    final result = await registerUseCase(role,userName,email,password);
    result.fold((failure) {
      errorMessage = failure.errorMessage;
      emit(RegisterFailureState());
    },(register) {
      if (register.isSuccess == true) {
        emit(RegisterSuccessState());
      } else {
        errorMessage = register.errors?.first.message;
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
      errorMessage = failure.errorMessage;
      emit(LoginFailureState());
    },(signin) {
      if (signin.isSuccess == true) {
        emit(LoginSuccessState());
      } else {
        errorMessage = signin.errors?.first.message;
        emit(LoginErrorState());
      }
    });
  }
////////////////////////////////////////////////////////////////////////////////

  clearErrorMessage(){
    errorMessage = null;
    emit(ClearErrorState());
  }
  errorPrivacyPolicy(){
    errorMessage = 'Please agree to privacy policy';
    emit(ErrorPrivacyState());
  }
}