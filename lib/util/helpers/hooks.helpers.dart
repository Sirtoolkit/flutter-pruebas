typedef Dispose = void Function();
void useEffect(Dispose? Function() effect, [List<Object?>? keys]) {
  bool execute = false;
  if (!execute) {
    effect.call();
    execute = true;
  }
}
