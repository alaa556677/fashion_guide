abstract class AuthStates{}

class AuthInitialState extends AuthStates{}

class RegisterLoadingState extends AuthStates{}

class RegisterSuccessState extends AuthStates{}

class RegisterFailureState extends AuthStates{}

class RegisterErrorState extends AuthStates{}

class LoginLoadingState extends AuthStates{}

class LoginSuccessState extends AuthStates{}

class LoginFailureState extends AuthStates{}

class LoginErrorState extends AuthStates{}