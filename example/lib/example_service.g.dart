// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_service.dart';

// **************************************************************************
// RiverpodCodeGenerator
// **************************************************************************

final exampleServiceProvider = Provider<ExampleService>((ref) {
  return ExampleService(
    ref.watch(exampleRepositoryProvider),
    ref.watch(exampleRepository2Provider),
  );
});
