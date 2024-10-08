import 'package:dart_bank/models/premium_account.dart';
import 'package:dart_bank/models/simple_account.dart';
import 'package:dart_bank/services/transfer_service.dart';
import 'package:test/test.dart';
import 'package:dart_bank/models/account.dart';

void main() {
  group('transferService', () {
    late Account account1;
    late Account account2;
    late Account account3;

    setUp(() {
      account1 = SimpleAccount('Diego', 1001, 1000.0);
      account2 = PremiumAccount('Arthur', 1002, 500.0, cashBack: 10.0);
      account3 = SimpleAccount('Roberto', 1003, 10);
    });

    test('should transfer money from one simple account to premium account',
        () {
      transferService(account1, account2, 200.0);

      expect(account1.getBalance(), 800.0);
      expect(account2.getBalance(), 700.0);
      print(account2);
      return;
    });

    test('should not transfer money from one account to another', () {
      transferService(account3, account3, 20.0);
      expect(account3.getBalance(), 0);
      print(account3);
      return;
    });

    test('should not transfer if account is in debth or zero', () {
      transferService(account3, account1, 200.0);

      expect(account3.getBalance(), 10.0);
      expect(account1.getBalance(), 1000.0);

      print(account1);
      return;
    });
  });
}
