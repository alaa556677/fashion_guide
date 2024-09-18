import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/constants/failure.dart';
import '../entity/add_category_entity.dart';
import '../entity/categories_entity.dart';

abstract class CategoryRepo{
  Future<Either<Failure,AddCategoryEntity>> addCategory(String name,);
  Future<Either<Failure,CategoriesEntity>> getAllCategories();

}