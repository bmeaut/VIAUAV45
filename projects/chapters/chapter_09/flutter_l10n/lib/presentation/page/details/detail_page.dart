import 'package:flutter/material.dart';
import 'package:flutter_l10n/domain/model/warrior.dart';

class DetailPage extends StatefulWidget {
  final Warrior warrior;

  const DetailPage({
    Key key,
    @required this.warrior,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: "background_${widget.warrior.name}",
          child: Container(
            color: Theme.of(context).primaryColor,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            title: Text(widget.warrior.name),
            leading: CloseButton(),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: "image_${widget.warrior.name}",
                  child: Image.network(
                    widget.warrior.avatar,
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, widget) => Transform.translate(
                    transformHitTests: false,
                    offset: Offset.lerp(
                        Offset(0.0, 200.0), Offset.zero, _controller.value),
                    child: widget,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      widget.warrior.description,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
