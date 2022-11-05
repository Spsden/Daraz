import 'package:daraz/Components/SearchBar.dart';
import 'package:daraz/Components/VerticalList.dart';
import 'package:daraz/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Components/DataView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  int selectedIndex = 0;
  List allCategories = ['All', 'Bed', 'Chair', 'Table', 'Vase', 'Shelf'];

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundBlue,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: kBackgroundBlue,
          title: const Text(
            'Dashboard',
            style: TextStyle(fontSize: 28),
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.bell))
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(160),
            child: Column(
              children: [
                const SearchBar(),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                  child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    controller: _tabController,
                    isScrollable: true,
                    tabs: [
                      tab(context, 'All'),
                      tab(context, 'Bed'),
                      tab(context, 'Chair'),
                      tab(context, 'Table'),
                      tab(context, 'Vase'),
                      tab(context, 'Shelf'),
                    ],
                  ),
                )
              ],
            ),
          )),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            margin: const EdgeInsets.only(top: 90),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
          ),
          TabBarView(controller: _tabController, children: const [
            VerticalList(
              category: 'all',
            ),
            VerticalList(
              category: 'bed',
            ),
            VerticalList(
              category: 'chair',
            ),
            VerticalList(
              category: 'table',
            ),
            VerticalList(
              category: 'vase',
            ),
            VerticalList(
              category: 'shelf',
            )
          ])
        ],
      ),
    );
  }
}
