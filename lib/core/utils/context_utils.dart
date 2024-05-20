import 'package:flutter/material.dart';

extension XBuildContext<T> on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  Brightness get brightness => theme.brightness;
  TextTheme get textTheme => theme.textTheme;
  Color? get textColor => theme.textTheme.bodyMedium?.color;
  Size get screenSize => MediaQuery.sizeOf(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  EdgeInsets get edgeInset => MediaQuery.viewPaddingOf(this);
}
