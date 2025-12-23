part of 'cafemenu_bloc.dart';

@immutable
sealed class CafemenuEvent {}

class getCafeMenuItems extends CafemenuEvent{

  getCafeMenuItems();
}
