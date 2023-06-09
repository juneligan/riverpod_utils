import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  String className = '';
  Map<String, List<String>> providers = {};

  @override
  visitConstructorElement(ConstructorElement element) {
    final returnType = element.returnType.toString();
    className = returnType.replaceFirst('*', '');
    providers.putIfAbsent(className, () => element.parameters.map((e) => e.name).toList());
  }

  @override
  void visitFieldElement(FieldElement element) {
    // TODO: implement visitFieldElement
    super.visitFieldElement(element);
  }
}
