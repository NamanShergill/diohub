import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/style/colors.dart';

class StarButton extends StatefulWidget {
  final int stars;
  final String repoRef;
  StarButton({Key key, this.repoRef, this.stars}) : super(key: key);

  @override
  _StarButtonState createState() => _StarButtonState();
}

class _StarButtonState extends State<StarButton> {
  @override
  Widget build(BuildContext context) {
    return Button(
      listenToLoadingController: false,
      stretch: false,
      padding: EdgeInsets.symmetric(vertical: 12),
      color: AppColor.onBackground,
      onTap: () {},
      child: Row(
        children: [
          Icon(
            Octicons.star,
            color: AppColor.grey3,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            'STAR',
            style: TextStyle(color: AppColor.grey3),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              width: 1,
              height: 15,
              color: AppColor.grey3,
            ),
          ),
          Text(widget.stars.toString()),
        ],
      ),
    );
  }
}
