import 'package:flutter/material.dart';
import 'package:flutter_firebase_news/feature/home/home_view.dart';
import 'package:flutter_firebase_news/feature/splash/splash_provider.dart';
import 'package:flutter_firebase_news/product/constants/index.dart';
import 'package:flutter_firebase_news/product/enums/image_constants.dart';
import 'package:flutter_firebase_news/product/widget/text/wavy_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> with _SplashViewListenMixin {
  final splashProvider = StateNotifierProvider<SplashProvider, SplashState>((ref) {
    return SplashProvider();
  });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(splashProvider.notifier).checkApplicationVersion(''.version);
  }

  @override
  Widget build(BuildContext context) {
    listenAndNavigate(splashProvider);
    return Scaffold(
      backgroundColor: ColorConsts.purplePrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconConsts.appIcon.toImage,
            Padding(
              padding: context.onlyTopPaddingLow,
              child: const WavyBoldText(
                title: StringConsts.appName,
              ),
            )
          ],
        ),
      ),
    );
  }
}

mixin _SplashViewListenMixin on ConsumerState<SplashView> {
  void listenAndNavigate(StateNotifierProvider<SplashProvider, SplashState> provider) {
    ref.listen(provider, (previous, next) {
      if (next.isRequiredForcedUpdate ?? false) {
        showAboutDialog(context: context);
        return;
      }

      if (next.isRedirectHome != null) {
        if (next.isRedirectHome!) {
          //true
          context.navigateToPage(const HomeView());
        } else {
          //false
        }
      }
    });
  }
}
