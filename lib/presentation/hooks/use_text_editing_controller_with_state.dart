import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

({TextEditingController controller, T state}) useTextEditingControllerWithState<
  T
>({required T Function(String value) transformer}) {
  final controller = useTextEditingController();
  final state = useState(transformer(controller.text));

  controller.addListener(() => state.value = transformer(controller.text));

  return (controller: controller, state: state.value);
}
