import 'package:equatable/equatable.dart';
import '../../domain/entities/categories3_entity.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavoritesEvent extends FavoriteEvent {}

class AddFavoriteEvent extends FavoriteEvent {
  final Categories3 item;

  const AddFavoriteEvent(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveFavoriteEvent extends FavoriteEvent {
  final Categories3 item;

  const RemoveFavoriteEvent(this.item);

  @override
  List<Object> get props => [item];
}
