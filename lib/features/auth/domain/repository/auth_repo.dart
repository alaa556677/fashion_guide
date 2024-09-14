import 'package:dartz/dartz.dart';
import 'package:fashion_guide/features/auth/domain/entity/login_entity.dart';
import 'package:fashion_guide/features/auth/domain/entity/register_entity.dart';

import '../../../../core/constants/failure.dart';

abstract class AuthRepository {

  Future<Either<Failure,RegisterEntity>> register(int role,String userName,String email , String password);
  Future<Either<Failure,LoginEntity>> login(String email , String password);

}