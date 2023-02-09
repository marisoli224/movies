import 'package:flutter/material.dart';

import '../data_layer/models/Movies.dart';
import '../data_layer/network/remote/api_manager.dart';
import 'search_item.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Results> result = [];
  String quary = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
            height: 48,
            child: TextFormField(
              onChanged: (String? value) {
                quary = value ?? '';
                setState(() {});
              },
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: const Color.fromRGBO(81, 79, 79, 1.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                enabled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 24,
                ),
                hintText: 'search',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          quary.isNotEmpty
              ? Expanded(
                  child: ListView.separated(

                    itemCount: loadingSearchData().length,

                    itemBuilder: (BuildContext context, index) {
                      return SearchItem(
                          loadingSearchData().elementAt(index), index);
                    },

                    separatorBuilder: (BuildContext context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                            left: 2, right: 2, top: 18, bottom: 18),
                        width: double.infinity,
                        height: 1,
                        color: const Color.fromRGBO(181, 180, 180, 1.0),
                      );
                    },

                  ),
                )
              : Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.local_movies,
                        color: Color.fromRGBO(181, 180, 180, 1.0),
                        size: 150,
                      ),
                      Text(
                        'No movies found',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(181, 180, 180, 1.0),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  List<Results> loadingSearchData() {
    ApiManager.search(quary).then((value) {
      result = value.results ?? [];
    }).onError((error, stackTrace) {
      print('error => ${error.toString()}');
    });
    return result;
  }
}
