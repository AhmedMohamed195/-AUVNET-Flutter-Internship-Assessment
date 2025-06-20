import 'package:equatable/equatable.dart';
import '../../domain/entities/categories3_entity.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}
class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<Categories3> favorites;

  const FavoriteLoaded(this.favorites);

  @override
  List<Object> get props => [favorites];
}
