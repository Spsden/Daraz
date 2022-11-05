import 'dart:io';

import 'package:daraz/dataclasses/DataModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;

class DataFetch {
  static const String base_url = 'https://furnitureapi-spsden.vercel.app/all';

  static Future<List<Furniture>> getAllFurniture(String category) async {
    try {
      final response = await http.get(Uri.parse(base_url));

      if (response.statusCode == 200) {
        // var responseList =  jsonDecode (response.body);
        List<Furniture> current = [];
        List<Furniture> furniture = furnitureFromJson(response.body.toString());
        switch (category) {
          case "all":
            {
              current = furniture;
            }
            break;
          case "bed":
            {
              for (int i = 0; i < furniture.length; i++) {
                if (furniture[i].cat == "bed") {
                  current.add(furniture[i]);
                }
              }
            }
            break;
          case "chair":
            {
              for (int i = 0; i < furniture.length; i++) {
                if (furniture[i].cat == "chair") {
                  current.add(furniture[i]);
                }
              }
            }
            break;
          case "table":
            {
              for (int i = 0; i < furniture.length; i++) {
                if (furniture[i].cat == "table") {
                  current.add(furniture[i]);
                }
              }
            }
            break;
          case "vase":
            {
              for (int i = 0; i < furniture.length; i++) {
                if (furniture[i].cat == "vase") {
                  current.add(furniture[i]);
                }
              }
            }
            break;
          case "shelf":
            {
              for (int i = 0; i < furniture.length; i++) {
                if (furniture[i].cat == "shelf") {
                  current.add(furniture[i]);
                }
              }
            }
            break;
        }

        // dev.log(furniture.toString(),name: "furny");

        //print(current[0].desc);
        return current;
      } else {
        return <Furniture>[];
      }
    } on SocketException {
      return [];
      if (kDebugMode) {
        print("Internet error");
      }
    }
  }

}

// final dataProvider = Provider<DataFetch>((ref) => DataFetch());
// final furnitureDataProvider = FutureProvider<List<Furniture>>((ref) async{
//   return ref.read(dataProvider).
//
// })


