import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:kljcafe_customers/domain/sliders_entity.dart';
import 'package:meta/meta.dart';

import '../../domain/wallet_balance_entity.dart';
import '../../web/api_credentials.dart';
import '../../web/webcallRepository.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderInitial()) {
    on<SliderEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<FetchSliders>((event, emit) async {
      // TODO: implement event handler

      emit(SliderLoading());

      try {

        Map mp=HashMap();



        final data = await WebCallRepository.post(mp,APICredentials.getSliders);
        SlidersEntity walletBalanceEntity=SlidersEntity.fromJson(data);

        if (walletBalanceEntity.status == 1) {






          emit(SliderSuccess(walletBalanceEntity));

          Map mp=HashMap();



          final data = await WebCallRepository.post(mp,APICredentials.getWalletBalance);
          WalletBalanceEntity walletBalanceEntity1=WalletBalanceEntity.fromJson(data);

          if (walletBalanceEntity.status == 1) {
            emit(WalletSuccess(walletBalanceEntity1));
          }


        } else {
          emit(SliderFailure(data["message"] ?? "Failed"));
        }
      } catch (e) {
        emit(SliderFailure("Something went wrong: $e"));
      }
    });
  }
}
