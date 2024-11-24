import 'package:app_alpop/core/help/image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBady extends StatefulWidget {
  const SplashViewBady({super.key});

  @override
  State<SplashViewBady> createState() => _SplashViewBadyState();
}

class _SplashViewBadyState extends State<SplashViewBady>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> textAnimation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    textAnimation = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).push('/HomePage');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 250,
            width: 250,
            child: Image.asset(AssetsData.logo),
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedBuilder(
              animation: textAnimation,
              builder: (context, _) {
                return SlideTransition(
                  position: textAnimation,
                  child: const Column(
                    children: [
                      Text(
                        'مطرانية  الأقباط  الأرثوذكس  فى  ابوتيج',
                        style: TextStyle(
                          color: Color.fromARGB(221, 255, 255, 255),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text('خدمة مدارس الأحد',
                          style: TextStyle(
                            color: Color.fromARGB(221, 255, 255, 255),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                    ],
                  ),
                );
              }),
        ]);
  }
}
