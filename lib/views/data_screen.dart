import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigations/views/areas_management/areas_screen.dart';
import 'package:investigations/views/readers_management/readers_screen.dart';
import 'package:investigations/views/supervisor_management/supervisor_screen.dart';

import '../constants.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List tiles = [
      [
        'إدارة المناطق',
        const Icon(Icons.maps_home_work),
        () {
          dataController.dataIndex.value = 1;
        }
      ],
      [
        'إدارة القراء',
        const Icon(Icons.person),
        () {
          dataController.dataIndex.value = 0;
        }
      ],
      [
        'إدارة المشرفين',
        const Icon(Icons.person_outline),
        () {
          dataController.dataIndex.value = 0;
        }
      ],
    ];
    return Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height,
            color: Colors.blueGrey,
            child: ListView.builder(
              itemBuilder: (context, index) => Obx(
                () => Container(
                  color: index == dataController.dataIndex.value
                      ? Colors.white
                      : null,
                  child: ListTile(
                      title: Text(
                        tiles[index][0],
                        style: const TextStyle(
                            fontFamily: 'almarai', fontWeight: FontWeight.bold),
                      ),
                      leading: tiles[index][1],
                      autofocus:
                          dataController.dataIndex.value == 0 ? true : false,
                      selectedColor: Theme.of(context).primaryColor,
                      selectedTileColor: Theme.of(context).primaryColor,
                      textColor: Colors.black54,
                      selected: index == dataController.dataIndex.value,
                      onTap: () {
                        dataController.dataIndex.value = index;
                      }),
                ),
              ),
              itemCount: tiles.length,
            )),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  // switch between readers, areas management, supervisors
                  Obx(
                () => Column(
                  children: [
                    dataController.dataIndex.value == 0
                        ? const Flexible(child: AreasScreen())
                        : const SizedBox(),
                    dataController.dataIndex.value == 1
                        ? const Flexible(child: ReadersScreen())
                        : const SizedBox(),
                    dataController.dataIndex.value == 2
                        ? const Flexible(child: SuperVisorScreen())
                        : const SizedBox(),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
