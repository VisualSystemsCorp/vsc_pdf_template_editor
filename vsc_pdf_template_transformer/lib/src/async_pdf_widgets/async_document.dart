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

import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:xml/xml.dart';

import 'async_page.dart';

class AsyncDocument {
  AsyncDocument({
    PdfPageMode pageMode = PdfPageMode.none,
    DeflateCallback? deflate,
    bool compress = true,
    bool verbose = false,
    PdfVersion version = PdfVersion.pdf_1_5,
    this.theme,
    String? title,
    String? author,
    String? creator,
    String? subject,
    String? keywords,
    String? producer,
    XmlDocument? metadata,
  }) : document = PdfDocument(
          pageMode: pageMode,
          deflate: deflate,
          compress: compress,
          verbose: verbose,
          version: version,
        ) {
    if (title != null ||
        author != null ||
        creator != null ||
        subject != null ||
        keywords != null ||
        producer != null) {
      PdfInfo(
        document,
        title: title,
        author: author,
        creator: creator,
        subject: subject,
        keywords: keywords,
        producer: producer,
      );
    }
    if (metadata != null) {
      PdfMetadata(document, metadata);
    }
  }

  AsyncDocument.load(
    PdfDocumentParserBase parser, {
    PdfPageMode pageMode = PdfPageMode.none,
    DeflateCallback? deflate,
    bool compress = true,
    bool verbose = false,
    this.theme,
    String? title,
    String? author,
    String? creator,
    String? subject,
    String? keywords,
    String? producer,
  }) : document = PdfDocument.load(
          parser,
          pageMode: pageMode,
          deflate: deflate,
          compress: compress,
          verbose: verbose,
        ) {
    if (title != null ||
        author != null ||
        creator != null ||
        subject != null ||
        keywords != null ||
        producer != null) {
      PdfInfo(
        document,
        title: title,
        author: author,
        creator: creator,
        subject: subject,
        keywords: keywords,
        producer: producer,
      );
    }
  }

  static bool debug = false;

  final PdfDocument document;

  final ThemeData? theme;

  final List<AsyncPage> _pages = <AsyncPage>[];

  bool _paint = false;

  Future<void> addPage(AsyncPage page, {int? index}) async {
    assert(!_paint, 'The document has already been saved.');
    await page.generate(this, index: index);
    _pages.add(page);
  }

  Future<void> editPage(int index, AsyncPage page) async {
    assert(!_paint, 'The document has already been saved.');
    await page.generate(this, index: index, insert: false);
    _pages.add(page);
  }

  Future<Uint8List> save() async {
    if (!_paint) {
      for (final page in _pages) {
        await page.postProcess(this);
      }
      _paint = true;
    }
    return await document.save();
  }
}
