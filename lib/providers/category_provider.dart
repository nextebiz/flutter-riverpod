import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:p13/data/data.dart";
import "package:p13/models/category.dart";

class CategoryNotifier extends StateNotifier<List<Category>> {
  CategoryNotifier() : super(categories);

  void toggleCategory(Category category) {
    final categoryExists = state.contains((category));

    if (categoryExists) {
      state = state.where((cat) => cat.title != category.title).toList();
    } else {
      state = [...state, category];
    }
  }

  void toggleEnabled(Category category) {
    state = state.map((cat) {
      if (cat.title == category.title) {
        return Category(
          title: cat.title,
          description: cat.description,
          categoryColor: cat.categoryColor,
          enabled: !cat.enabled, // Toggle the enabled value
        );
      }
      return cat;
    }).toList();
  }

  void setInitialState(List<Category> cats) {
    state = cats;
  }
}

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, List<Category>>((ref) {
  return CategoryNotifier();
});
