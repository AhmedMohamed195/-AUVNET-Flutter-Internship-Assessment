
import 'package:simple_e_commerce_app/feature/home/domain/entities/categories1_entity.dart';
import 'package:simple_e_commerce_app/feature/home/domain/entities/categories2_entity.dart';
import 'package:simple_e_commerce_app/feature/home/domain/entities/categories3_entity.dart';

abstract class HomeRepository {
  List<Categories1> getCategoriesOne();
  List<Categories2> getCategoriesTwo();
  List<Categories3> getCategoriesThree();
}
