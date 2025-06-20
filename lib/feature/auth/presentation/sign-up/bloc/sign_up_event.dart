import 'package:equatable/equatable.dart';
sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

final class SignUpButtonPressed extends SignUpEvent {
  final String email;
  final String password;
   final String confirmPassword;

  const SignUpButtonPressed( {
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [email, password,confirmPassword];
}
