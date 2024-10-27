import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Animationtest extends StatefulWidget {
  final bool isUserMoving;
  const Animationtest({
    super.key,
    required this.isUserMoving,
  });

  @override
  State<Animationtest> createState() => _AnimationtestState();
}

class _AnimationtestState extends State<Animationtest>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  bool _isUserMoving = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );

    _isUserMoving = widget.isUserMoving;

    // controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     if (_isUserMoving) {
    //       controller.forward(from: 0.0);
    //     } else {
    //       controller.stop();
    //     }
    //   }
    // });

    if (_isUserMoving) {
      controller.repeat();
    } else {
      controller.stop();
    }
  }

  @override
  void didUpdateWidget(covariant Animationtest oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isUserMoving != oldWidget.isUserMoving) {
      setState(() {
        _isUserMoving = widget.isUserMoving;
        if (_isUserMoving /*&&
            (controller.status == AnimationStatus.completed ||
                controller.status == AnimationStatus.dismissed)*/
            ) {
          controller.repeat(); // Start or continue animation
        } else {
          controller.stop(); // Stop animation
        }
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'lib/asset/walking.json',
      controller: controller,
      height: 190,
      // onLoaded: (composition) {
      //   // setState(() {
      //   //   // if logic --
      //   //   if (_isUserMoving) {
      //   //     controller.repeat();
      //   //   } else {
      //   //     controller.stop();
      //   //   }
      //   // });
      // },
    );
  }
}
