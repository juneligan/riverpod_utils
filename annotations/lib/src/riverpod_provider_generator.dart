class RiverpodProvider {
  // this name is used to override the name of the generated provider
  // my reason for this is to allow the user to use the interface name instead of
  // the implementation name
  // where the provider name is the name of the class without the suffix 'Impl'
  // you can just ignore this if you don't use interfaces
  final String? name;
  // this is used to override the type of the generated provider
  final String? type;

  const RiverpodProvider({this.name, this.type});
}