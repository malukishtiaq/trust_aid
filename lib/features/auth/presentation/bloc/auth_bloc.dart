import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_bloc.dart';
import '../../../../core/services/user/i_user_repository.dart';
import '../../domain/entities/auth_member_entity.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  final LoginUserUseCase _userLogin;
  final RegisterUserUseCase _registerUserUseCase;
  late IUserRepository _iUserRepository;
  AuthBloc(
      {required LoginUserUseCase userLogin,
      required RegisterUserUseCase registerUserUseCase})
      : _userLogin = userLogin,
        _registerUserUseCase = registerUserUseCase,
        super(AuthInitial()) {
    on<AuthLoginEvent>(_onAuthLogin);
    on<AuthRegisterEvent>(_onRegister);
  }

  void _onRegister(
    AuthRegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _registerUserUseCase(RegisterEntity(
      password: event.password,
      userName: event.userName,
      emailId: event.emailId,
      firstName: event.firstName,
      lastName: event.lastName,
      phoneNumber: event.phoneNumber,
      gender: event.gender,
      dateOfBirth: event.dateOfBirth,
      deviceType: event.deviceType,
    ));

    result.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => _emitRegisterSuccess(r, emit),
    );
  }

  void _onAuthLogin(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _userLogin(LoginEntity(
      userName: event.email,
      password: event.password,
    ));

    result.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _emitAuthSuccess(
    LoginResponseEntity user,
    Emitter<AuthState> emit,
  ) {
    _iUserRepository = GetIt.instance<IUserRepository>();
    _iUserRepository.setUser(user);
    emit(AuthSuccess(user));
  }

  void _emitRegisterSuccess(
    LoginResponseEntity user,
    Emitter<AuthState> emit,
  ) {
    _iUserRepository = GetIt.instance<IUserRepository>();
    _iUserRepository.setUser(user);
    emit(AuthRegisterSuccess(user));
  }
}
