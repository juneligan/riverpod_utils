import 'package:example/example_repository.dart';
import 'package:annotations/annotations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'example_repository_2.dart';

part 'example_service.g.dart';

@RiverpodProvider(name: 'ExampleService')
class ExampleService {
  const ExampleService(this.exampleRepository, this.exampleRepository2);
  final ExampleRepository exampleRepository;
  final ExampleRepository2 exampleRepository2;
}