import 'package:audio/core/bloc/base_bloc.dart';
import 'package:audio/features/auth/domain/user_model.dart';
import 'package:audio/features/home/data/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'user_event.dart';
part 'user_state.dart';

@injectable
final class UserBloc extends BaseBloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserInitial()) {
    on<FetchUserEvent>(_fetchUser);
  }

  Future<void> _fetchUser(FetchUserEvent event, Emitter<UserState> emit) async {
    safeEmit(UserLoading(), emit);
    final user = await _userRepository.fetchCurrentUser();

    user.fold(
      (fnL) => safeEmit(UserError(message: fnL.message), emit),
      (fnR) => safeEmit(UserLoaded(user: fnR), emit),
    );
  }
}
