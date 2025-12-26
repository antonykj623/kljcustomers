part of 'slider_bloc.dart';

@immutable
sealed class SliderEvent {}


class FetchSliders extends SliderEvent{

  FetchSliders();
}