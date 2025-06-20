
import 'package:simple_e_commerce_app/feature/home/domain/entities/categories1_entity.dart';
import 'package:simple_e_commerce_app/feature/home/domain/entities/categories2_entity.dart';
import 'package:simple_e_commerce_app/feature/home/domain/entities/categories3_entity.dart';
import 'package:simple_e_commerce_app/feature/home/domain/repositories/home_repository.dart';

class GetHomeDataUseCase {
  final HomeRepository repository;

  GetHomeDataUseCase(this.repository);

  List<Categories1> getCategoriesOne() => repository.getCategoriesOne();
  List<Categories2> getCategoriesTwo() => repository.getCategoriesTwo();
  List<Categories3> getCategoriesThree() => repository.getCategoriesThree();
}
