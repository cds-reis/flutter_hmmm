import 'package:flutter_hooks/flutter_hooks.dart';

/// A hook that runs an effect only once.
///
/// This hook is useful for running an effect only once, such as initializing a
/// resource or setting up a listener.
///
/// The effect function is called only once, and the effect is not re-run even if
/// the component is re-rendered.
void useEffectOnce(Dispose? Function() effect) {
  useEffect(effect, const []);
}
