part of 'slider_bloc.dart';

@immutable
sealed class SliderState {}

final class SliderInitial extends SliderState {}


class SliderLoading extends SliderState {

  SliderLoading();

}

class SliderSuccess extends SliderState {
  SlidersEntity cafeMenuEntity;
  SliderSuccess(this.cafeMenuEntity);
}

class SliderFailure extends SliderState {
  final String error;
  SliderFailure(this.error);
}