import 'package:flutter/cupertino.dart';
import 'package:movies/data_layer/models/Movies.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(Results? movieResponse, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.destructiveRed,
    );
  }
}
