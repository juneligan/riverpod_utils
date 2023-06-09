import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:generators/src/riverpod_code_generator.dart';


Builder generateRiverpodProviderFile(BuilderOptions options) =>
    SharedPartBuilder([RiverpodCodeGenerator()], 'riverpod_provider');