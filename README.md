# riverpod_utils
For my own collection related to riverpod utils

### Riverpod Provider generator**

 This will auto create a part file for your services/classes by using annotation. This is only useful for classes that somewhat like a singleton classes 
or like a bean in JAVA.


### How to setup code generator for riverpod

0. Add the riverpod flutter lib
1. Add this github repository lib to your pubspec.yaml

```
...
...
environment:
  sdk: '>=3.0.2 <4.0.0'

dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  freezed_annotation: ^2.2.0
  json_annotation: ^4.8.1
  flutter_riverpod: ^2.3.6
  annotations:
    git:
      url: https://github.com/juneligan/riverpod_utils.git
      ref: main
      path: ./annotations

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^2.0.0
  build_runner: 
  freezed: ^2.3.4
  json_serializable: ^6.7.0
  generators:
    git:
      url: https://github.com/juneligan/riverpod_utils.git
      ref: main
      path: ./generators

...
...
...
```

2. In your class files that you want to create its own provider class, Just add this annotation
NOTE: Don't forget to import the riverpod flutter since it will be need to the 'part' file

```
import 'package:flutter_riverpod/flutter_riverpod.dart'; // remember this one

part 'example_repository_2.g.dart'; // next is this one which will be the target part file for provider

@RiverpodProvider(
// optional, default value is the class name
    name: 'Test', 
// optional, default value is provider
    type: 'StreamProvider'
)
class ExampleRepository2 {
  const ExampleRepository2();
}
```


3. Then just run the build_runner to generate the files

```
dart run build_runner build --delete-conflicting-outputs
```