import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_e_commerce_app/feature/home/domain/usecases/get_home_data_usecase.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/bloc/home_event.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/bloc/home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase useCase;

  HomeBloc(this.useCase) : super(HomeLoading()) {
    on<LoadHomeDataEvent>((event, emit) {
      try {
        final cat1 = useCase.getCategoriesOne();
        final cat2 = useCase.getCategoriesTwo();
        final cat3 = useCase.getCategoriesThree();
        emit(HomeLoaded(cat1, cat2, cat3));
      } catch (_) {
        emit(HomeError());
      }
    });
  }
}
