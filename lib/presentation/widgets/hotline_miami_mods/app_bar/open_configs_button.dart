import 'package:flutter/material.dart';

import '../../configuration/configuration_dialog.dart';

class OpenConfigsButton extends StatelessWidget {
  const OpenConfigsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _onPressed(context),
      icon: Icon(Icons.settings, color: Colors.purpleAccent.shade400),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.purpleAccent.shade400, width: 4),
        ),
      ),
    );
  }

  Future<void> _onPressed(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const ConfigurationDialog(),
    );
  }
}
