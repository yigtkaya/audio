import 'package:audio/core/bloc/base_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:audio/features/auth/data/auth_repository.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@Injectable()
final class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial()) {
    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
    on<SignOutRequested>(_onSignOutRequested);
    on<ResetPasswordRequested>(_onResetPasswordRequested);
    on<SignInWithGoogleRequested>(_onSignInWithGoogleRequested);
    on<CheckAuthentication>(_onCheckAuthentication); // Add this line
  }

  void _onCheckAuthentication(CheckAuthentication event, Emitter<AuthState> emit) async {
    final user = _authRepository.currentUser();
    if (user != null) {
      safeEmit(Authenticated(user: user), emit);
    } else {
      safeEmit(Unauthenticated(), emit);
    }
  }

  Future<void> _onSignInRequested(SignInRequested event, Emitter<AuthState> emit) async {
    safeEmit(AuthLoading(), emit);
    final result = await _authRepository.signInWithEmail(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) => safeEmit(AuthError(message: failure.message), emit),
      (userCredential) => safeEmit(Authenticated(user: userCredential.user!), emit),
    );
  }

  Future<void> _onSignUpRequested(SignUpRequested event, Emitter<AuthState> emit) async {
    safeEmit(AuthLoading(), emit);
    final result = await _authRepository.signUpWithEmail(
      email: event.email,
      password: event.password,
      name: event.name,
    );

    result.fold(
      (failure) => safeEmit(AuthError(message: failure.message), emit),
      (userCredential) => safeEmit(Authenticated(user: userCredential.user!), emit),
    );
  }

  Future<void> _onSignOutRequested(SignOutRequested event, Emitter<AuthState> emit) async {
    safeEmit(AuthLoading(), emit);
    await _authRepository.signOut();
    safeEmit(Unauthenticated(), emit);
  }

  Future<void> _onResetPasswordRequested(ResetPasswordRequested event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.resetPassword(event.email);
      safeEmit(AuthSucces(), emit);
    } catch (e) {
      safeEmit(
        AuthError(
          message: e.toString(),
        ),
        emit,
      );
    }
  }

  Future<void> _onSignInWithGoogleRequested(SignInWithGoogleRequested event, Emitter<AuthState> emit) async {
    safeEmit(AuthLoading(), emit);
    final result = await _authRepository.signUpWithGoogle();

    result.fold(
      (failure) => safeEmit(AuthError(message: failure.message), emit),
      (userCredential) => safeEmit(Authenticated(user: userCredential.user!), emit),
    );
  }
}
