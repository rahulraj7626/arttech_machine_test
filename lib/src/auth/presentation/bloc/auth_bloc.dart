import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/login_model/login_request.dart';
import '../../data/models/register_model/register_request.dart';
import '../pages/auth/login_screen.dart';
import '../pages/auth/registration_screen.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoadingState());
      if (lFormKey.currentState!.validate()) {
        await Future.delayed(const Duration(seconds: 1));
        emit(LoginState(data: event.request));
      } else {
        emit(ErrorValidationState());
      }
    });
    on<RegisterEvent>((event, emit) async {
      emit(RegisterLoadingState());
      if (rFormKey.currentState!.validate()) {
        await Future.delayed(const Duration(seconds: 1));
        emit(RegisterState());
      } else {
        emit(ErrorValidationState());
      }
    });
  }
}
