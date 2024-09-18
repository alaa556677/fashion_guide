// import 'dart:io';
//
// import 'package:dartz/dartz.dart';
// import 'package:fashion_guide/core/constants/failure.dart';
// import 'package:fashion_guide/features/category/domain/entity/add_category_entity.dart';
// import 'package:fashion_guide/features/category/domain/repository/category_repository.dart';
//
// import '../data_source/add_category_data_source.dart';
//
// class CategoryRepoImpl implements CategoryRepo{
//
//   CategoryRepoImpl(this.addCategoryDataSource);
//
//   AddCategoryDataSource addCategoryDataSource;
//
//   @override
//   Future<Either<Failure, AddCategoryEntity>> addCategory(String name, double price, String description, double discount, int categoryId, File image, imageByte, bool isImageExist) async{
//     try {
//       return Right(await addCategoryDataSource.addCategory(name,price,description, discount,categoryId,image,imageByte,isImageExist));
//     } catch (e) {
//     print(e.toString());
//     return Left(Failure(e.toString()));
//     }
//   }
//
// }