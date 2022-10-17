getMap<T>(Map map, String path, T defaultValue) {
  List<String> keys = path.split('.');
  String key = keys[0];

  if (!map.containsKey(key)) {
    return defaultValue;
  }

  if (keys.length == 1) {
    final res = map[key];
    if (res is List) {
      return res;
    } else if (res == null) {
      return res;
    }
    return map[key] as T;
  }
  
  return getMap(map[keys.removeAt(0)], keys.join('.'), defaultValue);
}

Map<String, dynamic> setMap<T>(
  Map<String, dynamic>? map,
  String path,
  T value,
) {
  List<String> keys = path.split('.');
  String key = keys[0];
  Map<String, dynamic> target = map ?? {};

  if (keys.length == 1) {
    return Map<String, dynamic>.from({
      ...target,
      key: value,
    });
  }
  return Map<String, dynamic>.from({
    ...target,
    key: setMap(target[keys.removeAt(0)] ?? {}, keys.join('.'), value),
  });
}
