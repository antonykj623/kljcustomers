import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:kljcafe_customers/domain/notification_entity.dart';
import 'package:meta/meta.dart';

import '../../web/api_credentials.dart';
import '../../web/webcallRepository.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<getNotifications>((event, emit) async {
      // TODO: implement event handler

      emit(NotificationsLoading());

      try {

        Map mp=HashMap();



        final data = await WebCallRepository.get(APICredentials.getNotifications);
        NotificationEntity walletBalanceEntity=NotificationEntity.fromJson(data);

        if (walletBalanceEntity.status == 1) {






          emit(NotificationsSuccess(walletBalanceEntity));
        } else {
          emit(NotificationFailure(data["message"] ?? "Failed"));
        }
      } catch (e) {
        emit(NotificationFailure("Something went wrong: $e"));
      }
    });
  }
}
