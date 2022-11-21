import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigations/constants.dart';

import '../../widgets/animated_button_bar.dart';
import 'add_area.dart';

class AreasScreen extends StatelessWidget {
  const AreasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => SingleChildScrollView(
              child: Column(
                children: [
                  AnimatedButtonBar(
                    radius: 8.0,
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      ButtonBarEntry(
                          onTap: () =>
                              readersController.selectedIndex.value = 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [Text('عرض'), Icon(Icons.search)],
                          )),
                      ButtonBarEntry(
                          onTap: () =>
                              readersController.selectedIndex.value = 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [Text('إضافة'), Icon(Icons.add)],
                          )),
                      ButtonBarEntry(
                          onTap: () =>
                              readersController.selectedIndex.value = 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [Text('تعديل'), Icon(Icons.edit)],
                          )),
                    ],
                  ),
                  readersController.selectedIndex.value == 0
                      ? const Text('0')
                      : const SizedBox(),
                  readersController.selectedIndex.value == 1
                      ? addArea(context)
                      : const SizedBox(),
                  readersController.selectedIndex.value == 2
                      ? const Text('2')
                      : const SizedBox(),
                ],
              ),
            )));
  }
}
