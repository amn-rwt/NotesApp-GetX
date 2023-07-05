import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final String body;

  const NoteTile({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          body,
          style: const TextStyle(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
