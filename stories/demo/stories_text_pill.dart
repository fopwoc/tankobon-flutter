import 'package:flutter/material.dart';
import 'package:tankobon/widgets/common/text_pill.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookWidget textPillStories() => WidgetbookWidget(
      name: 'Text pill',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => const Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: TextPill(
                text: 'test',
              ),
            ),
          ),
        ),
        WidgetbookUseCase(
          name: 'Custom color',
          builder: (context) => const Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: TextPill(
                text: 'test',
                color: Colors.pink,
              ),
            ),
          ),
        ),
        WidgetbookUseCase(
          name: 'No text',
          builder: (context) => const Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: TextPill(
                text: '',
              ),
            ),
          ),
        ),
      ],
    );
