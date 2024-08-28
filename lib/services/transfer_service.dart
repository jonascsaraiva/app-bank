import 'package:dart_bank/models/account.dart';

void transferService(
    Account origin, Account destination, double value, Account getbalance) {
  if (origin == destination) {
    print("Transfereir para mesma conta não é permitido!");
    return;
  } else if (value <= 0) {
    print("Conta sem saldo");
    return;
  } else if (value < getbalance.getBalance()) {
    print("Saldo insuficiente");
    return;
  } else {
    origin.removeBalance(value);
    destination.addBalance(value);
    print("foi transferido");
  }
}
