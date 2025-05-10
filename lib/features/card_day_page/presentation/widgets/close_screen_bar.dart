import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CloseScreenBar extends StatelessWidget {
  const CloseScreenBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () => context.go('/home'),
          icon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.close),
          ),
        )
      ],
    );
  }
}
