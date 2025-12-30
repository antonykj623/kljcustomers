part of 'wallet_bloc.dart';

@immutable
sealed class WalletEvent {}


class checkWalletBalanceEvent extends WalletEvent {

  checkWalletBalanceEvent();

}

class GetWalletTransactions extends WalletEvent {

  GetWalletTransactions();
}



class sendWalletMoneyEvent extends WalletEvent {

  String id;
  String amount;

  sendWalletMoneyEvent(this.id,this.amount);

}