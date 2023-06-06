import "package:flutter/widgets.dart";
import "package:tankobon/widget/common/cover/cover.dart";
import "package:tankobon/widget/common/tankobon_ratio.dart";

class CoverList extends StatelessWidget {
  const CoverList({
    required this.children,
    required this.rowCount,
    super.key,
  });

  final List<Cover> children;
  final int rowCount;

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = (MediaQuery.of(context).size.width / 180).round();

    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount < rowCount ? rowCount : crossAxisCount,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: tankobonRatio,
      ),
      children: children,
    );
  }
}
