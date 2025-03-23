import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

({TextEditingController controller, T state}) useTextEditingControllerWithState<
  T
>({required T Function(String value) transformer, String? initialText}) {
  final controller = useTextEditingController(text: initialText);
  final state = useState(transformer(controller.text));

  controller.addListener(() => state.value = transformer(controller.text));

  return (controller: controller, state: state.value);
}
