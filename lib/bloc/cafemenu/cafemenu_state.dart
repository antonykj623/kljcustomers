part of 'cafemenu_bloc.dart';

@immutable
sealed class CafemenuState {}

final class CafemenuInitial extends CafemenuState {}


class CafemenuLoading extends CafemenuState {

  CafemenuLoading();

}

class CafemenuSuccess extends CafemenuState {
  CafeMenuEntity cafeMenuEntity;
  CafemenuSuccess(this.cafeMenuEntity);
}

class CafemenuFailure extends CafemenuState {
  final String error;
  CafemenuFailure(this.error);
}