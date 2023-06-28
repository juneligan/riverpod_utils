import 'package:build/build.dart';
import 'package:generators/src/copy_builder.dart';
import 'package:source_gen/source_gen.dart';
import 'package:generators/src/riverpod_code_generator.dart';


Builder generateRiverpodProviderFile(BuilderOptions options) =>
    SharedPartBuilder([RiverpodCodeGenerator()], 'riverpod_provider');

// below code 'copyBuilder' is for my own experiment only

// Builder copyBuilder(BuilderOptions options) => CopyBuilder();

// please also disable this to your build.yaml