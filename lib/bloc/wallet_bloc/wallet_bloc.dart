import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:kljcafe_customers/domain/wallet_balance_entity.dart';
import 'package:kljcafe_customers/domain/wallet_transaction_entity.dart';
import 'package:meta/meta.dart';

import '../../web/api_credentials.dart';
import '../../web/webcallRepository.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(WalletInitial()) {
    on<checkWalletBalanceEvent>((event, emit) async {
      // TODO: implement event handler

      emit(WalletBalanceLoading());

      try {

    Map mp=HashMap();



        final data = await WebCallRepository.post(mp,APICredentials.getWalletBalance);
        WalletBalanceEntity walletBalanceEntity=WalletBalanceEntity.fromJson(data);

        if (walletBalanceEntity.status == 1) {






          emit(WalletBalanceSuccess(walletBalanceEntity));
        } else {
          emit(WalletBalanceFailure(data["message"] ?? "Failed"));
        }
      } catch (e) {
        emit(WalletBalanceFailure("Something went wrong: $e"));
      }
    });

    on<GetWalletTransactions>((event, emit) async {
      // TODO: implement event handler

      emit(WalletTransactionLoading());

      try {

        Map mp=HashMap();



        final data = await WebCallRepository.post(mp,APICredentials.getWalletTransactions);
        WalletTransactionEntity walletBalanceEntity=WalletTransactionEntity.fromJson(data);

        if (walletBalanceEntity.status == 1) {






          emit(WalletTransactionSuccess(walletBalanceEntity));
        } else {
          emit(WalletTransactionFailure(data["message"] ?? "Failed"));
        }
      } catch (e) {
        emit(WalletTransactionFailure("Something went wrong: $e"));
      }
    });


    on<sendWalletMoneyEvent>((event, emit) async {
      // TODO: implement event handler

      emit(sendMoneyLoading());

      try {

        Map mp=HashMap();
        mp["id"]=event.id;
        mp["amount"]=event.amount;



        final data = await WebCallRepository.post(mp,APICredentials.sendMoneyToWallet);


        if (data['status']== 1) {






          emit(sendMoneySuccess(data['message']));
        } else {
          emit(SendMoneyFailure(data["message"] ?? "Failed"));
        }
      } catch (e) {
        emit(SendMoneyFailure("Something went wrong: $e"));
      }
    });
  }
}
