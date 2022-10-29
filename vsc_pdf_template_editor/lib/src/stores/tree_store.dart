import 'dart:convert';
import 'dart:typed_data';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:vsc_pdf_template_editor/src/utils/app_constants.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_align.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_aspect_ratio.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_border_radius.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_border_side.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_border_style.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_border.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_constraints.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_fit.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_center.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_checkbox.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_constrained_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_decorated_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_expanded.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fitted_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_flat_button.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_flex.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_flexible.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_footer.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_grid_view.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_limited_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_page_format.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_radius.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_sized_box.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_spacer.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_container.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_column.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_row.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_repeater.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_header.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_new_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_divider.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_full_page.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_padding.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_placeholder.dart';
import 'package:vsc_pdf_template_transformer/vsc_pdf_template_transformer.dart'
    as transformer;
import 'package:mobx/mobx.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/json.dart';
import 'package:flutter_highlight/themes/atom-one-dark-reasonable.dart';

part 'tree_store.g.dart';

class TreeStore = TreeStoreModel with _$TreeStore;

abstract class TreeStoreModel with Store {
  TreeStoreModel(
    this._template,
    this._data,
  ) {
    _sortDialogItems();
    _initControllers();
    _buildPdf();
  }

  late final CodeController _templateController;
  late final CodeController _dataController;

  pw.Document _doc = pw.Document();

  @observable
  String buildErrorText = '';

  @observable
  int activeTab = 0;

  @readonly
  Map<String, dynamic> _template;

  @readonly
  Map<String, dynamic> _data;

  @readonly
  Uint8List? _pdfBytes = Uint8List(0);

  Uint8List? get pdfBytes => _pdfBytes;

  CodeController get templateController => _templateController;

  CodeController get dataController => _dataController;

  set setPdfBytes(Uint8List? value) {
    _pdfBytes = value;
  }

  @action
  onInputChanged() {
    try {
      _template = jsonDecode(_templateController.rawText);
      _buildPdf();
      buildErrorText = '';
    } catch (e, s) {
      buildErrorText = '$e \n $s';
    }
  }

  @action
  onDataChanged() {
    _data = jsonDecode(_dataController.rawText);
    _buildPdf();
  }

  @action
  addWidget(Map<String, dynamic> map) {
    try {
      final cursorPos = _templateController.selection.base.offset;
      final newMap = _templateController.text.substring(0, cursorPos) +
          _reformatNewWidget(jsonEncode(map)) +
          _templateController.text.substring(cursorPos);
      _templateController.text = newMap;
      _template = jsonDecode(newMap);
      _buildPdf();
      buildErrorText = '';
    } catch (e, s) {
      buildErrorText = '$e \n $s';
    }
  }

  @action
  reformat(CodeController controller) {
    const JsonDecoder decoder = JsonDecoder();
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final dynamic object = decoder.convert(controller.text);
    final dynamic prettyString = encoder.convert(object);
    final sb = StringBuffer();
    prettyString
        .split('\n')
        .forEach((dynamic element) => sb.write('\n$element'));
    controller.text = sb.toString();
  }

  @action
  String _reformatNewWidget(String text) {
    const JsonDecoder decoder = JsonDecoder();
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final dynamic object = decoder.convert(text);
    final dynamic prettyString = encoder.convert(object);
    final sb = StringBuffer();
    prettyString
        .split('\n')
        .forEach((dynamic element) => sb.write('\n$element'));
    text = sb.toString();
    return text;
  }

  onWidgetSelected(String name) {
    Map<String, dynamic> map = {};
    switch (name) {
      case 'Text':
        map = TplText().toJson();
        break;
      case 'Sized Box':
        map = TplSizedBox().toJson();
        break;
      case 'Container':
        map = TplContainer().toJson();
        break;
      case 'Column':
        map = TplColumn().toJson();
        break;
      case 'Row':
        map = TplRow().toJson();
        break;
      case 'Repeater':
        map = TplRepeater().toJson();
        break;
      case 'Header':
        map = TplHeader().toJson();
        break;
      case 'New Page':
        map = TplNewPage().toJson();
        break;
      case 'Spacer':
        map = TplSpacer().toJson();
        break;
      case 'Expanded':
        map = TplExpanded().toJson();
        break;
      case 'Center':
        map = TplCenter().toJson();
        break;
      case 'Divider':
        map = TplDivider().toJson();
        break;
      case 'Full Page':
        map = TplFullPage().toJson();
        break;
      case 'Padding':
        map = TplPadding().toJson();
        break;
      case 'Placeholder':
        map = TplPlaceholder().toJson();
        break;
      case 'Align':
        map = TplAlign().toJson();
        break;
      case 'Aspect Ratio':
        map = TplAspectRatio().toJson();
        break;
      case 'Checkbox':
        map = TplCheckbox().toJson();
        break;
      case 'Constrained Box':
        map = TplConstrainedBox().toJson();
        break;
      case 'Decorated Box':
        map = TplDecoratedBox().toJson();
        break;
      case 'Fitted Box':
        map = TplFittedBox().toJson();
        break;
      case 'Flex':
        map = TplFlex().toJson();
        break;
      case 'Flexible':
        map = TplFlexible().toJson();
        break;
      case 'Flat Button':
        map = TplFlatButton().toJson();
        break;
      case 'Footer':
        map = TplFooter().toJson();
        break;
      case 'Grid View':
        map = TplGridView().toJson();
        break;
      case 'Limited Box':
        map = TplLimitedBox().toJson();
        break;
    }
    addWidget(map);
  }

  onPropertySelected(String name) {
    Map<String, dynamic> map = {};
    switch (name) {
      case 'Alignment':
        map = const TplAlignment().toJson();
        break;
      case 'Edge Insets':
        map = TplEdgeInsets().toJson();
        break;
      case 'Box Decoration':
        map = TplBoxDecoration().toJson();
        break;
      case 'Radius':
        map = TplRadius().toJson();
        break;
      case 'Box Border':
        map = TplBoxBorder().toJson();
        break;
      case 'Box Constraints':
        map = TplBoxConstraints().toJson();
        break;
      case 'Border Style':
        map = TplBorderStyle().toJson();
        break;
      case 'Border Radius':
        map = TplBorderRadius().toJson();
        break;
      case 'Border Side':
        map = TplBorderSide().toJson();
        break;
      case 'Text Style':
        map = TplTextStyle().toJson();
        break;
      case 'Page Format':
        map = TplPdfPageFormat().toJson();
        break;
      case 'Box Fit':
        map = TplBoxFit().toJson();
        break;
    }
    addWidget(map);
  }

  _savePdf() async {
    setPdfBytes = await _doc.save();
  }

  _buildPdf() async {
    try {
      _doc = transformer.Transformer.buildPdf(_template, _data);
      await _savePdf();
      buildErrorText = '';
    } catch (e, s) {
      buildErrorText = '$e \n $s';
    }
  }

  _sortDialogItems() {
    AppConstants.supportedWidgets.sort((a, b) => a.compareTo(b));
    AppConstants.supportedProperties.sort((a, b) => a.compareTo(b));
  }

  _initControllers() {
    _templateController = CodeController(
      language: json,
      theme: atomOneDarkReasonableTheme,
      text: jsonEncode(_template),
      onChange: (val) => EasyDebounce.debounce(
          '', const Duration(milliseconds: 500), () => onInputChanged()),
    );
    _dataController = CodeController(
      language: json,
      theme: atomOneDarkReasonableTheme,
      text: jsonEncode(_data),
      onChange: (val) => EasyDebounce.debounce(
          '', const Duration(milliseconds: 500), () => onDataChanged()),
    );
  }
}
