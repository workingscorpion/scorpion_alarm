class Lazy<T extends dynamic> {
  Lazy(this.initialize);

  T _instance;
  bool _isInitialized = false;

  T get instance {
    if (!_isInitialized) {
      _isInitialized = true;
      _instance = initialize();
    }

    return _instance;
  }

  bool get isInitialized => _isInitialized;

  final T Function() initialize;
}
