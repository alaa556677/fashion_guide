import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fashion_guide/core/constants/failure.dart';
import 'package:fashion_guide/features/category/domain/entity/categories_entity.dart';

import '../../domain/entity/add_category_entity.dart';
import '../../domain/repository/category_repository.dart';
import '../data_source/add_category_data_source.dart';
import '../data_source/categories_data_source.dart';

class CategoryRepoImpl implements CategoryRepo{

  CategoryRepoImpl(this.addCategoryDataSource,this.allCategoriesDataSource);

  AddCategoryDataSource addCategoryDataSource;
  AllCategoriesDataSource allCategoriesDataSource;

  @override
  Future<Either<Failure, AddCategoryEntity>> addCategory(String name) async{
    try {
      return Right(await addCategoryDataSource.addCategory(name));
    } catch (e) {
    print(e.toString());
    return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoriesEntity>> getAllCategories() async{
    try {
      return Right(await allCategoriesDataSource.getAllCategories());
    } catch (e) {
      print(e.toString());
      return Left(Failure(e.toString()));
    }
  }

}