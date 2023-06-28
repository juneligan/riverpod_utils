import 'package:annotations/annotations.dart';
import 'package:example/example_repository_abstract.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'example_repository_extends.g.dart';

@RiverpodProvider()
class ExampleRepositoryExtends extends ExampleRepositoryAbstract {
  ExampleRepositoryExtends();

  @override
  Future getExample() {
    // TODO: implement getExample
    throw UnimplementedError();
  }
}