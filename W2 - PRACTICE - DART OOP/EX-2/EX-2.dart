class BankAccount {
  final int _accountId;
  final String _name;
  double _balance;

  BankAccount({
    required int accountId,
    required String name,
    double initialBalance = 0.0,
  }) : _accountId = accountId,
       _name = name,
       _balance = initialBalance;

  int get accountId => _accountId;
  String get name => _name;
  double get balance => _balance;

  double getBalance() => _balance;

  void withdraw(double amount) {
    if (amount <= 0) throw Exception('Withdrawal amount must be positive!');
    if (_balance - amount < 0) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }

  void credit(double amount) {
    if (amount <= 0) throw Exception('Credit amount must be positive!');
    _balance += amount;
  }

  void deposit(double amount) => credit(amount);

  @override
  String toString() {
    return 'Account ID: $_accountId | Name: $_name | Balance: \$${_balance.toStringAsFixed(2)}';
  }
}

class Bank {
  final String _name;
  final Map<int, BankAccount> _accounts = {}; // Account storage

  Bank({required String name}) : _name = name;

  String get name => _name;

  BankAccount createAccount({
    required int accountId,
    required String accountOwner,
  }) {
    if (_accounts.containsKey(accountId)) {
      throw Exception('Account with ID $accountId already exists!');
    }

    final newAccount = BankAccount(accountId: accountId, name: accountOwner);
    _accounts[accountId] = newAccount;
    return newAccount;
  }

  BankAccount getAccount(int accountId) {
    if (!_accounts.containsKey(accountId)) {
      throw Exception('Account with ID $accountId does not exist!');
    }
    return _accounts[accountId]!;
  }

  void listAccounts() {
    if (_accounts.isEmpty) {
      print('No accounts found.');
    } else {
      print('--- $_name Accounts ---');
      for (var account in _accounts.values) {
        print(account);
      }
    }
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(
    accountId: 100,
    accountOwner: 'Ronan',
  );

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(
      accountId: 100,
      accountOwner: 'Honlgy',
    ); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
