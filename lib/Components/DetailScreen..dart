import 'package:flutter/material.dart';
import 'package:daraz/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundBlue,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back,color: Colors.black,)),
        title: Text('Back',style: TextStyle(
          color: Colors.black
        ),),
        actions: [
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.bell),color: Colors.black,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(

              )
          ),
          Container(

          )

        ],

    ),
    );
  }
}
