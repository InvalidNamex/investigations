import 'package:flutter/material.dart';
import '/views/investigation_screen.dart';
import '/views/query_screen.dart';
import '/views/data_screen.dart';
import 'management_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tab> tabList = const [
      Tab(
        text: 'استعلام',
      ),
      Tab(
        text: 'إدارة البيانات',
      ),
      Tab(
        text: 'تحقيقات وجزاءات',
      ),
      Tab(
        text: 'إدارة البرنامج',
      ),
    ];
    List tabViewChildren = [
      const QueryScreen(),
      const DataScreen(),
      const InvestScreen(),
      const ManagementScreen(),
    ];
    return DefaultTabController(
      length: tabList.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // WHAT HAPPENS WHEN TAB IS CHANGED
          }
        });
        return Scaffold(
          appBar: AppBar(
            title: const Text(''),
            bottom: TabBar(
              controller: tabController,
              isScrollable: true,
              tabs: tabList,
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: tabViewChildren.cast<Widget>(),
          ),
        );
      }),
    );
  }
}
