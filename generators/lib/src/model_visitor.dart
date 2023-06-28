import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  String className = '';
  Map<String, List<String>> providers = {};
  bool hasExtensions = false;

  @override
  visitConstructorElement(ConstructorElement element) {
    final returnType = element.returnType.toString();
    className = returnType.replaceFirst('*', '');
    providers.putIfAbsent(className, () => element.parameters.map((e) => e.name).toList());

    // checking if the class has extensions or if not then check if its parameters has extensions
    hasExtensions = _containsClassExtension([element]) || _containsClassExtension(element.parameters);
  }

  bool _containsClassExtension(List<Element> params) {
    return params.map((e) => e.source?.contents.data)
    .map((e) => e ?? '')
    .firstWhere((e) =>
      ['extends', 'with', 'implements'].any((keyword) => e.contains(keyword)),
      orElse: () => ''
    )
    .isNotEmpty;
  }

}