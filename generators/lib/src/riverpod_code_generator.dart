import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/build.dart';
import 'package:generators/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class RiverpodCodeGenerator extends GeneratorForAnnotation<RiverpodProvider> {
  @override
  String generateForAnnotatedElement(
      Element element, 
      ConstantReader annotation, 
      BuildStep buildStep
    ) {
      // TODO
      final ModelVisitor visitor = ModelVisitor();
      element.visitChildren(visitor);

      final className = annotation.peek('name')?.stringValue ?? visitor.className;
      final params = visitor.providers[visitor.className]!;
      final buffer = StringBuffer();
      buffer.writeln('final ${className[0].toLowerCase()}${className.substring(1)}Provider = Provider<${visitor.className}>((ref) {');
      buffer.write('return ');

      if (params.isEmpty) {
        buffer.write('const ');
      }

      buffer.write('$className(');
      
      for (var element in params) {
        buffer.writeln('ref.watch(${element}Provider),');
      }
      buffer.writeln(');});');
      
      return buffer.toString();
    }
  }

// Sample result for empty constructor:
//final exampleRepositoryProvider = Provider<ExampleRepository>((ref) {
//   return const ExampleRepository();
//});