import 'package:flutter/material.dart';
import 'package:flutter_l10n/domain/model/santa.dart';
import 'package:flutter_l10n/presentation/page/home/details/details_page.dart';

class SantaItem extends StatelessWidget {
  final Santa santa;

  const SantaItem({
    Key key,
    @required this.santa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder<Null>(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return AnimatedBuilder(
                  animation: animation,
                  builder: (BuildContext context, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: DetailPage(santa: santa),
                    );
                  });
            },
            transitionDuration: Duration(milliseconds: 400),
          ),
        );
      },
      child: Stack(
        children: [
          Hero(
            tag: "background_${santa.name}",
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(16)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 200, bottom: 8),
                child: Text(
                  santa.name,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ),
          Positioned(
            right: 8,
            top: 4,
            child: Hero(
              tag: "image_${santa.name}",
              child: Image.asset(
                santa.avatar,
                height: 200,
                width: 200,
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}
