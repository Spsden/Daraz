

import 'package:daraz/Components/HorizontalList.dart';
import 'package:flutter/material.dart';

class AllLists extends StatefulWidget {
  const AllLists({Key? key}) : super(key: key);

  @override
  State<AllLists> createState() => _AllListsState();
}

class _AllListsState extends State<AllLists>with TickerProviderStateMixin {

  late TabController _tabController ;
  int selectedIndex = 0;
  List allCategories = ['All','Bed','Chair','Table','Vase','Shelf'];




  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return


      TabBar(
        indicator: BoxDecoration(
            color:  Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)
            ),
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


    );
  }
}


Widget tab(BuildContext context,String category){
  return Container(
    height: 30,
    // padding:const EdgeInsets.fromLTRB(20, 0, 20, 0),
    // margin: const EdgeInsets.only(bottom: 20),
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 15),

    // decoration: BoxDecoration(
    //   color:  Colors.white.withOpacity(0.5) ,
    //   borderRadius: BorderRadius.circular(8),
    //
    // ),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Text(
      category,
      style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
    ),

  );
}
