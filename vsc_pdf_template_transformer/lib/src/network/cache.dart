/*
 * Copyright (C) 2017, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// Adapted from the dart_pdf repo: https://github.com/DavBfr/dart_pdf

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart';
import 'package:pdf/pdf.dart';

/// Store data in a cache
abstract class TplBaseCache {
  /// Create a cache
  const TplBaseCache();

  /// The default cache used when none specified
  static TplBaseCache defaultCache = TplMemoryCache();

  /// Add some data to the cache
  Future<void> add(String key, Uint8List bytes);

  /// Retrieve some data from the cache
  Future<Uint8List?> get(String key);

  /// Does the cache contains this data?
  Future<bool> contains(String key);

  /// Remove some data from the cache
  Future<void> remove(String key);

  /// Clear the cache
  Future<void> clear();

  /// Download the font
  Future<Uint8List?> _download(
    Uri uri, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(uri, headers: headers);
    if (response.statusCode >= 300) {
      return null;
    }

    return response.bodyBytes;
  }

  /// Resolve the data
  Future<Uint8List> resolve({
    required Uri uri,
    bool cache = true,
    Map<String, String>? headers,
  }) async {
    final key = uri.toString();
    if (cache && await contains(key)) {
      return (await get(key))!;
    }

    final bytes = await _download(uri, headers: headers);

    if (bytes == null) {
      throw Exception('Unable to download $uri');
    }

    if (cache) {
      await add(key, bytes);
    }

    return bytes;
  }
}

/// Memory cache
class TplMemoryCache extends TplBaseCache {
  /// Create a memory cache
  TplMemoryCache();

  final _imageCache = <String, Uint8List>{};

  Timer? _timer;

  void _resetTimer() {
    _timer?.cancel();
    _timer = Timer(const Duration(minutes: 20), () {
      clear();
    });
  }

  @override
  Future<void> add(String key, Uint8List bytes) async {
    _imageCache[key] = bytes;
    _resetTimer();
  }

  @override
  Future<Uint8List?> get(String key) async {
    _resetTimer();
    return _imageCache[key];
  }

  @override
  Future<void> clear() async {
    _imageCache.clear();
  }

  @override
  Future<bool> contains(String key) async {
    return _imageCache.containsKey(key);
  }

  @override
  Future<void> remove(String key) async {
    _imageCache.remove(key);
  }
}

/// Download an image from the network.
Future<ImageProvider> downloadImage(
  String url, {
  bool cache = true,
  Map<String, String>? headers,
  PdfImageOrientation? orientation,
  double? dpi,
  TplBaseCache? pdfCache,
}) async {
  pdfCache ??= TplBaseCache.defaultCache;
  final bytes = await pdfCache.resolve(
    uri: Uri.parse(url),
    cache: cache,
    headers: headers,
  );

  return MemoryImage(bytes, orientation: orientation, dpi: dpi);
}

/// Download a UTF-8 string from the network.
Future<String> downloadUtf8String(
  String url, {
  bool cache = true,
  Map<String, String>? headers,
  TplBaseCache? pdfCache,
}) async {
  pdfCache ??= TplBaseCache.defaultCache;
  final bytes = await pdfCache.resolve(
    uri: Uri.parse(url),
    cache: cache,
    headers: headers,
  );

  return utf8.decode(bytes);
}
