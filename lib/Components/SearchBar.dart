import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white.withOpacity(0.5),
          filled: true,
          isDense: true,

          // prefix: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(top: 13, left: 10),
            child: FaIcon(
              FontAwesomeIcons.search,
              size: 20,
              color: Colors.white,
            ),
          ),
          hintStyle: const TextStyle(color: Colors.white, fontSize: 15),
          hintText: "Search",
        ),
      ),
    );
  }
}
