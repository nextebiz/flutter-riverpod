import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p13/models/category.dart';
import 'package:p13/providers/category_provider.dart';

class Detail extends ConsumerStatefulWidget {
  const Detail({super.key, required this.category});

  final Category category;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DetailState();
  }
}

class _DetailState extends ConsumerState<Detail> {
  toggleEnable(Category category) {
    ref.read(categoryProvider.notifier).toggleEnabled(category);
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoryProvider);
    final updateCategory =
        categories.firstWhere((cat) => cat.title == widget.category.title);
    return Scaffold(
      appBar: AppBar(
        title: Text(updateCategory.title),
      ),
      body: InkWell(
        onTap: () {
          toggleEnable(updateCategory);
        },
        child: Container(
          color: updateCategory.enabled ? Colors.red : Colors.yellow,
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                updateCategory.description,
                style: TextStyle(
                  color: updateCategory.enabled ? Colors.white : Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
