import 'package:flutter/material.dart';
import 'package:flutter_l10n/domain/model/warrior.dart';
import 'package:flutter_l10n/presentation/page/details/detail_page.dart';

class WarriorItem extends StatelessWidget {
  final Warrior warrior;

  const WarriorItem({
    Key key,
    @required this.warrior,
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
                      child: DetailPage(warrior: warrior),
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
            tag: "background_${warrior.name}",
            child: Container(
              //height: MediaQuery.of(context).size.height * 0.1,
              //width: MediaQuery.of(context).size.width * 0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(16)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 200, bottom: 8),
                child: Text(
                  warrior.name,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 8,
            top: 4,
            child: Hero(
              tag: "image_${warrior.name}",
              child: Image.network(
                warrior.avatar,
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
