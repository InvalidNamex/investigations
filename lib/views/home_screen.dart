import 'package:flutter/material.dart';

import '/views/investigation_screen.dart';
import '/views/query_screen.dart';
import '/views/rating_screen.dart';
import '/views/readers_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tab> tabList = const [
      Tab(
        text: 'استعلام',
      ),
      Tab(
        text: 'بيانات القراء',
      ),
      Tab(
        text: 'تحقيقات وجزاءات',
      ),
      Tab(
        text: 'تقيمات',
      )
    ];
    List tabViewChildren = [
      const QueryScreen(),
      const ReadersScreen(),
      const InvestScreen(),
      const RatingScreen(),
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
