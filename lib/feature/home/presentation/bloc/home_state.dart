

import 'package:equatable/equatable.dart';
import 'package:simple_e_commerce_app/feature/home/domain/entities/categories1_entity.dart';
import 'package:simple_e_commerce_app/feature/home/domain/entities/categories2_entity.dart';
import 'package:simple_e_commerce_app/feature/home/domain/entities/categories3_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Categories1> cat1;
  final List<Categories2> cat2;
  final List<Categories3> cat3;

  const HomeLoaded(this.cat1, this.cat2, this.cat3);

  @override
  List<Object> get props => [cat1, cat2, cat3];
}

class HomeError extends HomeState {}
