import 'dart:async';

import 'package:flutter/material.dart';

class Toast {
  static void showToast({
    required BuildContext context,
    required String message,
  }) {
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox?;

    if (overlay != null) {
      final GlobalKey<_ToastViewState> key = GlobalKey();
      final overlayEntry = OverlayEntry(
        builder: (context) => ToastView(
          key: key,
          message: message,
        ),
      );

      Overlay.of(context).insert(overlayEntry);

      Timer(const Duration(seconds: 5), () {
        overlayEntry.remove();
      });
    }
  }
}

class ToastView extends StatefulWidget {
  final String message;

  const ToastView({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  _ToastViewState createState() => _ToastViewState();
}

class _ToastViewState extends State<ToastView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _isVisible = true;
    _animationController.forward();

    Timer(const Duration(milliseconds: 4000), () {
      hideToast();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void hideToast() {
    if (mounted) {
      setState(() {
        _isVisible = false;
      });
      _animationController.reverse().whenComplete(() {
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 600),
        child: Visibility(
          visible: _isVisible,
          child: FadeTransition(
            opacity: _animation,
            child: Material(
              color: Colors.transparent,
              child: Container(
                alignment: Alignment.center,
                child: Card(
                  color: Theme.of(context).cardColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Text(
                      widget.message,
                      style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
