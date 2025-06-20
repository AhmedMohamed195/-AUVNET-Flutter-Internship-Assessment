import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';
import '../../domain/entities/categories3_entity.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  late Box _box;

  FavoriteBloc() : super(FavoriteInitial()) {
    _init();

    on<AddFavoriteEvent>((event, emit) {
      final currentFavorites = List<Categories3>.from(_box.get('items', defaultValue: []));
      currentFavorites.add(event.item);
      _box.put('items', currentFavorites);
      emit(FavoriteLoaded(List.from(currentFavorites)));
    });

    on<RemoveFavoriteEvent>((event, emit) {
      final currentFavorites = List<Categories3>.from(_box.get('items', defaultValue: []));
      currentFavorites.removeWhere((e) => e.text1 == event.item.text1);
      _box.put('items', currentFavorites);
      emit(FavoriteLoaded(List.from(currentFavorites)));
    });

    on<LoadFavoritesEvent>((event, emit) {
      final currentFavorites = List<Categories3>.from(_box.get('items', defaultValue: []));
      emit(FavoriteLoaded(currentFavorites));
    });
  }

  Future<void> _init() async {
    _box = await Hive.openBox('favoritesBox');
  }
}
