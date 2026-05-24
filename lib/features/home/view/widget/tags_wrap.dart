import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/view/widget/tags_wrap_item.dart';

class TagsWrap extends StatelessWidget {
  const TagsWrap({super.key, required this.tags});

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 8,
      runSpacing: 10,
      children: List.generate(tags.length, (index) {
        return TagsWrapItem(tag: tags[index]);
      }),
    );
  }
}
