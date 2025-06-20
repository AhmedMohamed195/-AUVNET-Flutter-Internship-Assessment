import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(OnBoardingInitial()) {
    on<OnBoardingNextPage>((event, emit) {
      emit(OnBoardingNext());
    });

    on<OnBoardingNavigate>((event, emit) async {
      emit(OnBoardingLoading()); 
      await Future.delayed(Duration(seconds: 1));
      emit(OnBoardingNavigateToLogin());
    });
  }
}
