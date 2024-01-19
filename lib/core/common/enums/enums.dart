class EnumWithValues<T> {
  final T value;

  const EnumWithValues(this.value);
}

enum ThemeModesEnum { light, dark }

enum ConnectivityStatusEnum { connected, disconnected, loading }

enum RequestStatusEnum { initial, loading, loaded, error }
