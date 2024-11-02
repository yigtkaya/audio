import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_state.dart';

/// A base class for all Cubits in the application that provides common functionality
/// and simplified state management.
abstract base class BaseCubit<S extends BaseState> extends Cubit<S> implements StateStreamableSource<S> {
  BaseCubit(super.initialState) {
    onInitialized();
  }

  /// Safely emits a state if the Cubit hasn't been closed
  /// Returns true if the state was successfully emitted
  @protected
  bool safeEmit(S state) {
    if (!isClosed) {
      emit(state);
      return true;
    }
    return false;
  }

  /// Hook called when the Cubit is initialized
  @protected
  @mustCallSuper
  void onInitialized() {}

  /// Hook called before the Cubit is closed
  @protected
  @mustCallSuper
  Future<void> onClosing() async {}

  @override
  @mustCallSuper
  Future<void> close() async {
    await onClosing();
    await super.close();
  }
}
