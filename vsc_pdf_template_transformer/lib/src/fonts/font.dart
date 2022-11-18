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

import 'package:pdf/widgets.dart';

import '../network/cache.dart';

/// Get the font to use in a PDF document.
Future<Font> getFont({
  required String url,
  TplBaseCache? pdfCache,
  bool protect = false,
  Map<String, String>? headers,
  bool cache = true,
}) async {
  pdfCache ??= TplBaseCache.defaultCache;

  try {
    final bytes = await pdfCache.resolve(
      uri: Uri.parse(url),
      headers: headers,
      cache: cache,
    );

    return TtfFont(
      bytes.buffer.asByteData(bytes.offsetInBytes, bytes.lengthInBytes),
      protect: protect,
    );
  } catch (e) {
    assert(() {
      // ignore: avoid_print
      print('$e\nError loading $url, fallback to Helvetica.');
      return true;
    }());

    return Font.helvetica();
  }
}
