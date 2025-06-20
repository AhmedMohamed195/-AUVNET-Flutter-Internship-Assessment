part of 'on_boarding_bloc.dart';

sealed class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();

  @override
  List<Object> get props => [];
}

class OnBoardingNextPage extends OnBoardingEvent {
  final int currentPage;

  const OnBoardingNextPage({required this.currentPage});

  @override
  List<Object> get props => [currentPage];
}

class OnBoardingNavigate extends OnBoardingEvent {
  const OnBoardingNavigate();
}
