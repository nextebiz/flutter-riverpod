import 'dart:math';

import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:p13/models/category.dart';
import 'package:p13/models/enums.dart';
import 'package:p13/providers/category_provider.dart';
import 'package:p13/screens/detail.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
  }

  addCategory(String categoryTitle) {
    final newCat = Category(
      title: categoryTitle,
      description: "kong",
      categoryColor: CategoryColor.red,
      enabled: false,
    );
    ref.read(categoryProvider.notifier).toggleCategory(newCat);
  }

  toggleEnable(Category category) {
    ref.read(categoryProvider.notifier).toggleEnabled(category);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(categoryProvider);
    final cats = ref.read(categoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(" i am app bar"),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  addCategory("King ${Random().nextInt(10000)}");
                },
                child: const Text(
                  "Add Category",
                ),
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: cats.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: () {
                          toggleEnable(cats[index]);
                        },
                        child: Card(
                          child: Container(
                            color: cats[index].enabled
                                ? Colors.red
                                : Colors.yellow,
                            child: Column(
                              children: [
                                Text(
                                  cats[index].title,
                                  style: TextStyle(
                                    color: cats[index].enabled
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return Detail(
                                              category: cats[index],
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: Text("details"))
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
