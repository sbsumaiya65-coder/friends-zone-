class CoinReferralManager {
  int _coins = 0;

  int get coins => _coins;

  void addCoins(int amount) {
    _coins += amount;
  }

  bool deductCoins(int amount) {
    if (_coins >= amount) {
      _coins -= amount;
      return true;
    }
    return false;
  }
}
