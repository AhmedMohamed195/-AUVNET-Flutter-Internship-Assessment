
import 'package:simple_e_commerce_app/feature/home/domain/entities/categories1_entity.dart';
import 'package:simple_e_commerce_app/feature/home/domain/entities/categories2_entity.dart';
import 'package:simple_e_commerce_app/feature/home/domain/entities/categories3_entity.dart';
import 'package:simple_e_commerce_app/feature/home/domain/repositories/home_repository.dart';

import '../dummy_data.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  List<Categories1> getCategoriesOne() => categoriesDataOne;

  @override
  List<Categories2> getCategoriesTwo() => categoriesDataTwo;

  @override
  List<Categories3> getCategoriesThree() => categoriesDataThree;
}
