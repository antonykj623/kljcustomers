part of 'notification_bloc.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}



class NotificationsLoading extends NotificationState {

  NotificationsLoading();

}

class NotificationsSuccess extends NotificationState {
  NotificationEntity notificationEntity;
  NotificationsSuccess(this.notificationEntity);
}

class NotificationFailure extends NotificationState {
  final String error;
  NotificationFailure(this.error);
}