import 'package:app_alpop/core/help/image.dart';
import 'package:app_alpop/core/widget/custom_textfild.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeBageBody extends StatelessWidget {
  const HomeBageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 10, 105),
        automaticallyImplyLeading: false,
        title:const Center(
          child:Text(
            'الصفحه الرئيسه',
          ),
        ),
      ),
      body: Stack(
        children: [
          // الصورة كخلفية
          Positioned.fill(
            child: Image.asset(
              AssetsData.backgraund,
              fit: BoxFit.cover, // يجعل الصورة تغطي الشاشة بالكامل
            ),
          ),
          // باقي المحتوى
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextButton(
                  buttonText: 'ورشة البلاط',
                  onPressed: () {
                    GoRouter.of(context).push('/warshetalbalat');
                  },
                ),
                const SizedBox(height: 10),
                CustomTextButton(
                  buttonText: 'بنك التنمية',
                  onPressed: () {
                    GoRouter.of(context).push('/bankaltanmia');
                  },
                ),
                const SizedBox(height: 10),
                CustomTextButton(
                  buttonText: 'ورشة ظريف',
                  onPressed: () {
                    GoRouter.of(context).push('/warshetzaref');
                  },
                ),
                const SizedBox(height: 10),
                CustomTextButton(
                  buttonText: 'كوبرى نبيلة',
                  onPressed: () {
                    GoRouter.of(context).push('/kobrynabial');
                  },
                ),
                const SizedBox(height: 10),
                CustomTextButton(
                  buttonText: 'جوارجى ملاك',
                  onPressed: () {
                    GoRouter.of(context).push('/gaorgymalak');
                  },
                ),
                const SizedBox(height: 10),
                CustomTextButton(
                  buttonText: 'منطقة الملاك ميخائيل',
                  onPressed: () {
                    GoRouter.of(context).push('/elmalakmekael');
                  },
                ),
                const SizedBox(height: 10),
                CustomTextButton(
                  buttonText: 'المناطق الاخرى',
                  onPressed: () {
                    GoRouter.of(context).push('/almnatekalaokra');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
