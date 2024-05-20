import 'package:flutter/material.dart';
import 'package:ui_challenge/core/utils/app_constants.dart';
import 'package:ui_challenge/core/utils/app_icons.dart';
import 'package:ui_challenge/core/utils/config.dart';
import 'package:ui_challenge/core/utils/context_utils.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: const EdgeInsets.all(0),
      color: context.colorScheme.background,
      surfaceTintColor: context.colorScheme.background,
      icon: CircleAvatar(
        backgroundColor: context.colorScheme.outline.withOpacity(0.5),
        child: Icon(
          AppIcons.direct,
          size: 18,
          color: context.textColor,
        ),
      ),
      offset: const Offset(0, -210),
      position: PopupMenuPosition.over,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Config.radius16),
      ),
      elevation: 0,
      itemBuilder: (context) {
        return AppConstants.mapMenuItems
            .map(
              (item) => PopupMenuItem(
                padding: const EdgeInsets.all(0),
                child: TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    item.icon,
                    size: 18,
                    color: context.textColor,
                  ),
                  label: Text(
                    item.label,
                    style: context.textTheme.bodySmall,
                  ),
                ),
              ),
            )
            .toList();
      },
    );
  }
}
