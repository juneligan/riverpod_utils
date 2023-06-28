import 'package:annotations/annotations.dart';
import 'package:example/example_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'example_repository.g.dart';

@RiverpodProvider()
class ExampleRepository implements ExampleRepositoryInterface {
  ExampleRepository();

  @override
  Future getExample() {
    // TODO: implement getExample
    throw UnimplementedError();
  }
}