import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:daraz/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsScreen extends StatefulWidget {
  final String name;
  final String price;
  final String desc;
  final String imgUrl;

  const DetailsScreen(
      {Key? key,
      required this.name,
      required this.price,
      required this.desc,
      required this.imgUrl})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List imgList = [widget.imgUrl, widget.imgUrl, widget.imgUrl];
    return Scaffold(
      backgroundColor: kBackgroundBlue,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Back',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.bell),
            color: Colors.black,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40))),
              child: Column(
                children: [
                  CarouselSlider(
                    items: [
                      ImageViewer(widget.imgUrl),
                      ImageViewer(widget.imgUrl),
                      ImageViewer(widget.imgUrl),
                    ],
                    options: CarouselOptions(
                        viewportFraction: 1,
                        height: 300,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((e) {
                        return GestureDetector(
                            onTap: () => _controller.animateToPage(e.key),
                            child: indicator());
                      }).toList()),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.price,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.desc,
                          style: TextStyle(color: Colors.black.withOpacity(0.5)),
                          maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 120,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                alignment: Alignment.center,
                margin: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.amberAccent),
                child: const Text(
                  'Buy',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget indicator() {
  List colors = [Colors.blueAccent, Colors.red, Colors.grey];
  Random random = Random();
  return Container(
    width: 12,
    height: 12,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
    decoration:
        BoxDecoration(shape: BoxShape.circle, color: colors[random.nextInt(2)]),
  );
}

Widget ImageViewer(String imgUrl) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    //height: 400,
    //width: 400,
    child: Image(
      image: NetworkImage(imgUrl),
      fit: BoxFit.fill,
    ),
  );
}
