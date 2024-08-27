import 'package:dart_bank/models/account.dart';

void transferService(Account origin, Account destination, double value) {
  if (origin == destination) {
    print("Esta tentando transfereir para mesma conta,transação negada.");
  } else {
    origin.removeBalance(value);
    destination.addBalance(value);
    print("foi transferido");
  }
}
