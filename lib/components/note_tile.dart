import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({
    super.key,
    required this.text,
    required this.onEditPressed,
    required this.onDeletePressed,
  });
  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 25,
        right: 25,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onEditPressed,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: onDeletePressed,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
