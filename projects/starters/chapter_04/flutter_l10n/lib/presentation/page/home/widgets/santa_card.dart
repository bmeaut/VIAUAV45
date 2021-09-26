import 'package:flutter/material.dart';
import 'package:flutter_l10n/domain/model/santa.dart';
import 'package:flutter_l10n/presentation/page/home/details/details_page.dart';

class SantaCard extends StatelessWidget {
  final Santa santa;

  const SantaCard({
    Key? key,
    required this.santa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder<void>(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return AnimatedBuilder(
                  animation: animation,
                  builder: (_, Widget? child) {
                    return Opacity(
                      opacity: animation.value,
                      child: DetailPage(santa: santa),
                    );
                  });
            },
            transitionDuration: const Duration(milliseconds: 400),
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
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    end: 16, top: 160, bottom: 16),
                child: Text(
                  santa.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: 32,
            child: Hero(
              tag: "image_${santa.name}",
              child: Image.asset(
                santa.avatar,
                height: 114,
                width: 171,
              ),
            ),
          )
        ],
      ),
    );
  }
}
