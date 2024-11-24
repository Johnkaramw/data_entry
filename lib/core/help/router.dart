import 'package:app_alpop/fueatuer/home/presentation/view/home_page.dart';
import 'package:app_alpop/fueatuer/home/presentation/view/widget/%D8%A7%D9%84%D9%85%D9%86%D8%A7%D8%B7%D9%82_%D8%A7%D9%84%D8%A7%D8%AE%D8%B1%D9%89.dart';
import 'package:app_alpop/fueatuer/home/presentation/view/widget/%D8%A8%D9%86%D9%83%20%D8%A7%D9%84%D8%AA%D9%86%D9%85%D9%8A%D8%A9.dart';
import 'package:app_alpop/fueatuer/home/presentation/view/widget/%D8%AC%D9%88%D8%A7%D9%88%D8%B1%D8%AC%D9%89_%D9%85%D9%84%D8%A7%D9%83.dart';
import 'package:app_alpop/fueatuer/home/presentation/view/widget/%D9%83%D9%88%D8%A8%D8%B1%D9%89_%D9%86%D8%A8%D9%8A%D9%84%D8%A9.dart';
import 'package:app_alpop/fueatuer/home/presentation/view/widget/%D9%85%D9%86%D8%B7%D9%82%D9%87_%D8%A7%D9%84%D9%85%D9%84%D8%A7%D9%83_%D9%85%D9%8A%D8%AE%D8%A7%D8%A6%D9%8A%D9%84.dart';
import 'package:app_alpop/fueatuer/home/presentation/view/widget/%D9%88%D8%B1%D8%B4%D9%87_%D8%A7%D9%84%D8%A8%D9%84%D8%A7%D8%B7.dart';
import 'package:app_alpop/fueatuer/home/presentation/view/widget/%D9%88%D8%B1%D8%B4%D9%87_%D8%B8%D8%B1%D9%8A%D9%81.dart';
import 'package:app_alpop/fueatuer/spalsh/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AcssesRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/HomePage',
        builder: (context, state) => const HomePage(),
        ),
         GoRoute(
        path: '/bankaltanmia',
        builder: (context, state) => const  Bankaltanmia(),
        ),
        GoRoute(
        path: '/warshetalbalat',
        builder: (context, state) => const  warshetalbalat(),
        ),
         GoRoute(
        path: '/warshetzaref',
        builder: (context, state) => const  warshetzaref(),
        ),
         GoRoute(
        path: '/kobrynabial',
        builder: (context, state) => const   kobrynabial(),
        ),
         GoRoute(
        path: '/gaorgymalak',
        builder: (context, state) => const   gaorgymalak(),
        ),
         GoRoute(
        path: '/elmalakmekael',
        builder: (context, state) => const  elmalakmekael(),
        ),
         GoRoute(
        path: '/almnatekalaokra',
        builder: (context, state) => const  almnatekalaokra(),
        ),
    ]  
  );
  
}
