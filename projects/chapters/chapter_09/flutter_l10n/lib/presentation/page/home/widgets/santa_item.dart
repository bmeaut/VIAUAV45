import 'package:flutter/material.dart';
import 'package:flutter_l10n/domain/model/santa.dart';
import 'package:flutter_l10n/presentation/page/home/details/details_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                    end: 16.w, top: 160.h, bottom: 16.h),
                child: Text(
                  santa.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
          Positioned(
            right: 16.w,
            top: 32.h,
            child: Hero(
              tag: "image_${santa.name}",
              child: Image.asset(
                santa.avatar,
                height: 114.h,
                width: 171.w,
              ),
            ),
          )
        ],
      ),
    );
  }
}
