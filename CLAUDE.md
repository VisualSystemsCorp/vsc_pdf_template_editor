# CLAUDE.md - Project Guidelines

## Build Commands
- Generate models: `dart run build_runner build`
- Flutter build: `flutter build`

## Test Commands
- Full test suite (transformer): `dart test`
- Single test (transformer): `dart test test/vsc_pdf_template_transformer_test.dart -p "Test align_footer_checkbox_tpl_test"`
- Flutter tests: `flutter test`

## Lint Commands
- Transformer: `dart analyze`
- Editor: `flutter analyze`

## Code Style Guidelines
- Use single quotes for strings (`prefer_single_quotes: true`)
- Await all Futures or handle them explicitly (`unawaited_futures: true`)
- Print statements are allowed (`avoid_print: false`)
- Follow Dart naming conventions:
  - `lowerCamelCase` for variables, methods, functions
  - `UpperCamelCase` for classes, enums, extensions, typedefs
- Prefer named parameters for better code readability
- Maintain type safety throughout the codebase
- Follow layout and formatting standards in existing components when creating new ones
- Use proper error handling with try/catch blocks where appropriate
- Keep imports organized in separate blocks (dart:, package:, relative imports)

The project consists of two packages:
1. `vsc_pdf_template_editor`: Flutter widget for PDF template editing
2. `vsc_pdf_template_transformer`: Core library for generating PDFs from templates