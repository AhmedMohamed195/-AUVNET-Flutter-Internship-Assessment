part of 'on_boarding_bloc.dart';

sealed class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

final class OnBoardingInitial extends OnBoardingState {}

final class OnBoardingNext extends OnBoardingState {} 

final class OnBoardingLoading extends OnBoardingState {} 

final class OnBoardingNavigateToLogin extends OnBoardingState {} 
