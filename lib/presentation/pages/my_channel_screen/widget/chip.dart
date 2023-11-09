import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final String label;

  // final ValueChanged<int> onDeleted;
  // final int index;
  const ChipWidget({
    required this.label,
    // required this.onDeleted,
    // required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      // deleteIcon: const Icon(
      //   Icons.close,
      //   size: 18,
      // ),
      // onDeleted: () {
      //   onDeleted(index);
      // },
    );
  }
}
