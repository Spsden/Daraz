import 'package:daraz/HomePage.dart';
import 'package:daraz/utils/DataFetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';



class HorizontalList extends ConsumerStatefulWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  ConsumerState<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends ConsumerState<HorizontalList> {

  int currSelected = 0;

  List allCategories = ['All','Bed','Chair','Table','Vase','Shelf'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 30,
      padding:const EdgeInsets.fromLTRB(20, 0, 20, 0),
      margin: const EdgeInsets.only(bottom: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: allCategories.length,
        itemBuilder: ((context, index) => InkWell(
          onTap: () {

            setState(() {
              currSelected = index;


            });
            ref.read(categoryState.notifier).state = allCategories[index];
            print(DataFetch.getAllFurniture(allCategories[index]).toString());

          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 15),

            decoration: BoxDecoration(
              color: index == currSelected ? Colors.white.withOpacity(0.5) : Colors.transparent,
              borderRadius: BorderRadius.circular(8),

            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              allCategories[index],
              style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            ),
          ),
        )),


      ),
    );
  }
}

Widget tab(BuildContext context,String category){
  return Container(
    // height: 30,
    // padding:const EdgeInsets.fromLTRB(20, 0, 20, 0),
    // margin: const EdgeInsets.only(bottom: 20),
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 15),

    decoration: BoxDecoration(
      color:  Colors.white.withOpacity(0.5) ,
      borderRadius: BorderRadius.circular(8),

    ),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Text(
      category,
      style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
    ),

  );
}





