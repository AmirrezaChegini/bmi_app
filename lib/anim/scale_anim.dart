import 'package:flutter/material.dart';

class ScaleAnim extends StatefulWidget {
  final Widget child;
  final bool isClicked;
  ScaleAnim({required this.child, required this.isClicked});

  @override
  State<ScaleAnim> createState() => _ScaleAnimState();
}

class _ScaleAnimState extends State<ScaleAnim>
    with SingleTickerProviderStateMixin {
  late final AnimationController animCtrl;
  late final Animation<double> anim;

  @override
  void initState() {
    super.initState();

    animCtrl =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    anim = CurvedAnimation(parent: animCtrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    super.dispose();

    animCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    showAnim();
    return ScaleTransition(
      scale: anim,
      child: widget.child,
    );
  }

  Future<void> showAnim() async {
    widget.isClicked ? await animCtrl.forward() : await animCtrl.reverse();
  }
}
