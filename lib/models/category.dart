import "package:p13/models/enums.dart";

class Category {
  const Category({
    required this.title,
    required this.description,
    required this.categoryColor,
    required this.enabled,
  });

  final String title;
  final String description;
  final CategoryColor categoryColor;
  final bool enabled;
}
