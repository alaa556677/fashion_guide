import 'package:dartz/dartz.dart';
import 'package:fashion_guide/features/auth/domain/entity/login_entity.dart';
import '../../../../core/constants/failure.dart';
import '../repository/auth_repo.dart';

class LoginUseCase{
  final AuthRepository authRepo;

  LoginUseCase(this.authRepo);

  Future<Either<Failure,LoginEntity>> call(String email , String password)async{
    return await authRepo.login(email, password);
  }
}