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
      final ModelVisitor visitor = ModelVisitor();
      element.visitChildren(visitor);
      // check visitor if abstract dart class
      final isAbstract = visitor.hasExtensions;

      final concreteClassName = visitor.className;
      final providerName = annotation.peek('name')?.stringValue ?? concreteClassName;
      final type = annotation.peek('type')?.stringValue ?? 'Provider';
      final params = visitor.providers[concreteClassName]!;

      final buffer = StringBuffer();
      buffer.writeln('final ${providerName[0].toLowerCase()}${providerName.substring(1)}Provider = $type<$concreteClassName>((ref) {');
      buffer.write('return ');

      if (params.isEmpty &&  !isAbstract) {
        buffer.write('const ');
      }

      buffer.write('$concreteClassName(');
      
      for (var element in params) {
        buffer.writeln('ref.watch(${element}Provider),');
      }
      buffer.writeln(');});');
      
      return buffer.toString();
    }

  // @override
  // Map<String, List<String>> get buildExtensions => {
  //       '.txt': ['.copy.txt']
  //     };

//   @override
//   Future<void> build(BuildStep buildStep) async {
//     // Retrieve the currently matched asset
//     AssetId inputId = buildStep.inputId;

//     print('Copying $inputId');

//     // Create a new target `AssetId` based on the current one
//     var copyAssetId = inputId.changeExtension('.copy.txt');
//     var contents = await buildStep.readAsString(inputId);

//     // Write out the new asset
//     await buildStep.writeAsString(copyAssetId, '''
// ---
// ${DateTime.now()}
// ---
// $contents
// ''');
//   }
}

// Sample result for empty constructor:
//final exampleRepositoryProvider = Provider<ExampleRepository>((ref) {
//   return const ExampleRepository();
//});