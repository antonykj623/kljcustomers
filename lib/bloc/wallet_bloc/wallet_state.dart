part of 'wallet_bloc.dart';

@immutable
sealed class WalletState {}

final class WalletInitial extends WalletState {}


class WalletBalanceLoading extends WalletState {

  WalletBalanceLoading();

}

class WalletBalanceSuccess extends WalletState {
  WalletBalanceEntity walletBalanceEntity;
  WalletBalanceSuccess(this.walletBalanceEntity);
}

class WalletBalanceFailure extends WalletState {
  final String error;
  WalletBalanceFailure(this.error);
}



class WalletTransactionLoading extends WalletState {

  WalletTransactionLoading();

}

class WalletTransactionSuccess extends WalletState {
  WalletTransactionEntity walletTransactionEntity;
  WalletTransactionSuccess(this.walletTransactionEntity);
}

class WalletTransactionFailure extends WalletState {
  final String error;
  WalletTransactionFailure(this.error);
}








class sendMoneySuccess extends WalletState {
  String msg;
  sendMoneySuccess(this.msg);
}

class SendMoneyFailure extends WalletState {
  final String error;
  SendMoneyFailure(this.error);
}



class sendMoneyLoading extends WalletState {

  sendMoneyLoading();

}


class WalletCommissionSuccess extends WalletState {
  WalletPercentEntity msg;
  WalletCommissionSuccess(this.msg);
}

class WalletCommissionFailure extends WalletState {
  final String error;
  WalletCommissionFailure(this.error);
}



class WalletCommisionLoading extends WalletState {

  WalletCommisionLoading();

}