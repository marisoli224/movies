import 'package:flutter/material.dart';
import '../data_layer/models/Movies.dart';
import '../home_sc/datails/details_screen.dart';



class SearchItem extends StatefulWidget {
  Results? movieResponse;
  int index;

  SearchItem(this.movieResponse, this.index);

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  bool isMarked = false;
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          Flexible(
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            DetailsScreen(widget.movieResponse),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500' +
                          '${widget.movieResponse!.posterPath}',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 100,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                   // addMarked();
                  isMarked = !isMarked;
                    setState(() {

                    });
                  },
                  child: isMarked
                      ? Image.asset('assets/images/bookmark_marked.png')
                      : Image.asset('assets/images/bookmark.png'),
                ),
              ],
            ),
          ),
          SizedBox(width: 30),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.movieResponse!.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  widget.movieResponse!.releaseDate ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(181, 180, 180, 1.0),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.movieResponse!.overview ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
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


}
