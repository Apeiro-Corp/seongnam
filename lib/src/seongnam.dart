import 'package:flutter/widgets.dart';

class Seongnam extends StatefulWidget {
  const Seongnam({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onTap;

  @override
  State<Seongnam> createState() => _SeongnamState();
}

class _SeongnamState extends State<Seongnam> {
  bool _isTap = false;

  void _onTapDown(_) {
    setState(() {
      _isTap = true;
    });
  }

  void _onTapUp(_) {
    Future.delayed(const Duration(milliseconds: 30), () {
      if (mounted) {
        widget.onTap();
        setState(() {
          _isTap = false;
        });
      }
    });
  }

  void _onTapCancel() {
    setState(() {
      _isTap = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        duration: const Duration(milliseconds: 30),
        curve: Curves.easeOut,
        transform: _isTap
            ? (Matrix4.translationValues(0, 0, 0)..scale(0.90))
            : Matrix4.identity(),
        child: widget.child,
      ),
    );
  }
}
