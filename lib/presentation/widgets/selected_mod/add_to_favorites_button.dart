import 'package:flutter/material.dart';

class AddToFavoritesButton extends StatelessWidget {
  const AddToFavoritesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      color: Colors.pink,
      icon: const Icon(Icons.favorite_outline_sharp),
    );
  }
}
