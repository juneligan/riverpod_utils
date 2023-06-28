import 'package:annotations/annotations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'example_repository_mixin.dart';

part 'example_repository_with.g.dart';

@RiverpodProvider()
class ExampleRepositoryWith with ExampleRepositoryMixin {
  ExampleRepositoryWith();
}