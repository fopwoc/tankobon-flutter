import 'package:flutter/material.dart';
import 'package:tankobon/widgets/common/icon_button.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookWidget buttonStories() => WidgetbookWidget(
      name: 'Button',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => Center(
            child: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Expanded(
                    child: Button(
                      icon: Icons.warning,
                      text: 'button',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
