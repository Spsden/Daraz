import 'package:daraz/Components/FurniCard.dart';
import 'package:daraz/utils/DataFetch.dart';
import 'package:flutter/material.dart';

import '../dataclasses/DataModel.dart';

class VerticalList extends StatefulWidget {
  const VerticalList({Key? key,
   required this.category
  }) : super(key: key);
  final String category;

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  late Future<List<Furniture>> furniture;

  @override
  void initState() {
    furniture = DataFetch.getAllFurniture(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: furniture,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {

          if (snapshot.hasData) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) =>
                    FurnitureCard(
                        name: snapshot.data![index].name,
                        price: snapshot.data![index].price,
                        img: snapshot.data![index].imgUrl,
                      desc: snapshot.data![index].desc,
                    ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }


      } ));
  }
}

// class VerticalList extends ConsumerWidget {
//   const VerticalList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final String category = ref.watch(categoryState.notifier).state;
//     print(category);
//     //print(widget.category);
//     return FutureBuilder(
//       future: DataFetch.getAllFurniture('all').then((value) =>
//           value.where((element) => element.cat == category).toList()),
//       builder: ((context, snapshot) => snapshot.hasData
//           ? ListView.builder(
//               physics: const BouncingScrollPhysics(),
//               itemCount: snapshot.data?.length,
//               itemBuilder: (context, index) => FurnitureCard(
//                   name: snapshot.data![index].name,
//                   price: snapshot.data![index].price,
//                   img: snapshot.data![index].imgUrl))
//           : const Center(
//               child: CircularProgressIndicator(),
//             )),
//     );
//   }
// }
