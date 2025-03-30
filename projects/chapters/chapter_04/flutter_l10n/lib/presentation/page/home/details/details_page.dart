import 'package:flutter/material.dart';
import 'package:flutter_l10n/domain/model/santa.dart';

class DetailPage extends StatefulWidget {
  final Santa santa;

  const DetailPage({super.key, required this.santa});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
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
          tag: "background_${widget.santa.name}",
          child: Container(color: Theme.of(context).primaryColor),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            title: Text(widget.santa.name),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: "image_${widget.santa.name}",
                  child: Image.asset(
                    widget.santa.avatar,
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder:
                      (context, widget) => Transform.translate(
                        transformHitTests: false,
                        offset:
                            Offset.lerp(
                              const Offset(0.0, 200.0),
                              Offset.zero,
                              _controller.value,
                            )!,
                        child: widget,
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      widget.santa.description,
                      style: const TextStyle(
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
        ),
      ],
    );
  }
}
