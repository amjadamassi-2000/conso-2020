import 'package:easy_localization/easy_localization.dart';

extension Translation on String {
  String get t => tr(this) ?? this;
}
