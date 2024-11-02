import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'base_event.dart';
part 'base_state.dart';

/// A base class for all Blocs in the application that provides common functionality
/// and hydration capabilities.
abstract base class BaseBloc<E extends BaseEvent, S extends BaseState> extends HydratedBloc<E, S> {
  BaseBloc(super.initialState) {
    // Register the base event handler
    on<E>((event, emit) => handleEvent(event, emit));

    // Call initialization hook
    onInitialized();
  }

  /// Override this method to handle specific events in child classes
  @protected
  Future<void> handleEvent(E event, Emitter<S> emit) async {
    // Base implementation for handling events
    await onEventReceived(event);
  }

  /// Safely emits a state if the Bloc hasn't been closed
  /// Returns true if the state was successfully emitted
  @protected
  bool safeEmit(S state, Emitter<S> emit) {
    if (!isClosed) {
      emit(state);
      return true;
    }
    return false;
  }

  /// Hook called when the Bloc is initialized
  @protected
  @mustCallSuper
  void onInitialized() {}

  /// Hook called when an event is received
  @protected
  @mustCallSuper
  Future<void> onEventReceived(E event) async {}

  /// Hook called before the Bloc is closed
  @protected
  @mustCallSuper
  Future<void> onClosing() async {}

  @override
  @mustCallSuper
  Future<void> close() async {
    await onClosing();
    await super.close();
  }

  // Override these methods from HydratedBloc if state persistence is needed
  @override
  S? fromJson(Map<String, dynamic>? json) => null;

  @override
  Map<String, dynamic>? toJson(S state) => null;
}
