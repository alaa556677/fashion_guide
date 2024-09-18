// import 'dart:io';
// import 'package:dartz/dartz.dart';
//
// import '../../../../core/constants/failure.dart';
// import '../entity/add_category_entity.dart';
// import '../repository/category_repository.dart';
//
// class AddProductUseCase{
//   final CategoryRepo repository;
//
//   AddProductUseCase(this.repository);
//
//   Future<Either<Failure, AddCategoryEntity>> call(
//       String name,double price , String description , double discount , int categoryId , File image,dynamic imageByte,bool isImageExist,
//       ) async {
//     return await repository.addCategory(name, price, description, discount,categoryId,image,imageByte,isImageExist);
//   }
// }
//
