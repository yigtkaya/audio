part of 'user_bloc.dart';

abstract base class UserEvent extends BaseEvent {}

final class FetchUserEvent extends UserEvent {
  FetchUserEvent();
}
