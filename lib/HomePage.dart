
import 'package:daraz/Components/DataView.dart';
import 'package:daraz/Components/HorizontalList.dart';
import 'package:daraz/Components/SearchBar.dart';
import 'package:daraz/Components/VerticalList.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riverpod/riverpod.dart';

final categoryState = StateProvider((ref) => "all");

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final String cat = ref.watch(categoryState).toString();
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade700,
      appBar: AppBar(
        title:  Text(
          ref.watch(categoryState.notifier).state,
          //'Dashboard',
          style: TextStyle(fontSize: 28),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.bell))
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SearchBar(),
            const SizedBox(
              height: 20,
            ),
          // Expanded(child: AllLists())








           // const HorizontalList(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 70),
                    decoration: const BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                  ),
                   AllLists()
                ],
              ),
            ),






            // ElevatedButton(
            //     onPressed: () {
            //       DataFetch.getAllFurniture("vase");
            //     },
            //     child: Text('Click me'))
            //Expanded(child: VerticalList()),
          ],
        ),
      ),
    );
  }
}
