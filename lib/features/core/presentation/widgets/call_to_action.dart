import 'package:flutter/material.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({super.key, this.onPressed, required this.child});

  final void Function()? onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      child: child,
    ),
  );
}
