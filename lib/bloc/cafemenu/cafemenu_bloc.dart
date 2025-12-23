import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:kljcafe_customers/domain/cafe_menu_entity.dart';
import 'package:meta/meta.dart';

import '../../web/api_credentials.dart';
import '../../web/webcallRepository.dart';

part 'cafemenu_event.dart';
part 'cafemenu_state.dart';

class CafemenuBloc extends Bloc<CafemenuEvent, CafemenuState> {
  CafemenuBloc() : super(CafemenuInitial()) {
    on<CafemenuEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<getCafeMenuItems>((event, emit) async {
      // TODO: implement event handler

      emit(CafemenuLoading());

      try {

        Map mp=HashMap();



        final data = await WebCallRepository.post(mp,APICredentials.getProducts);
        CafeMenuEntity walletBalanceEntity=CafeMenuEntity.fromJson(data);

        if (walletBalanceEntity.status == 1) {






          emit(CafemenuSuccess(walletBalanceEntity));
        } else {
          emit(CafemenuFailure(data["message"] ?? "Failed"));
        }
      } catch (e) {
        emit(CafemenuFailure("Something went wrong: $e"));
      }
    });
  }
}
