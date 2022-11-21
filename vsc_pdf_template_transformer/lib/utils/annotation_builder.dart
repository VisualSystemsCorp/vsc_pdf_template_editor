import 'package:pdf/widgets.dart' as ab;

abstract class AnnotationBuilder {
  Future<ab.AnnotationBuilder> buildAnnotation(Map<String, dynamic> data);

  Map<String, dynamic> toJson();
}
