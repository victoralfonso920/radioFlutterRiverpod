import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio_player/radio_player.dart';
import '../../../utils/resources/colors.dart';
import '../../../utils/resources/img_routes.dart';
import '../../../utils/utils.dart';
import 'provider/data_radio_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RadioPlayer radioPlayer = RadioPlayer();
    final data = ref.watch(dataRadioProvider);

    radioPlayer.stateStream.listen(
      (value) {
        ref.read(bannerRadioPlayingProvider.state).state = value;
      },
    );

    void configRadio(String name, String url, String image) {
      radioPlayer.stop();
      radioPlayer.setChannel(
        title: name,
        url: url,
        imagePath: image,
      );
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          radioPlayer.play();
        },
      );
    }

    return Scaffold(
      backgroundColor: black,
      body: data.when(
        data: ((data) => SafeArea(
              child: Stack(children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    bgMetalDark,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      color: black,
                      height: 280,
                      child: Consumer(builder: (_, WidgetRef ref, __) {
                        final banner = ref.watch(bannerRadioProvider);
                        return Image.asset(
                          banner,
                          fit: BoxFit.fill,
                        );
                      }),
                    ),
                    Center(
                      child: CircleList(
                        origin: const Offset(0, 0),
                        showInitialAnimation: true,
                        centerWidget: SizedBox(
                          width: 100,
                          height: 100,
                          child: Consumer(
                            builder: (_, WidgetRef ref, __) {
                              final isPlaying =
                                  ref.watch(bannerRadioPlayingProvider);
                              return InkWell(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  child: Image.asset(
                                      isPlaying ? iconPause : iconPlay),
                                ),
                                onTap: () {
                                  isPlaying
                                      ? radioPlayer.stop()
                                      : radioPlayer.play();
                                },
                              );
                            },
                          ),
                        ),
                        childrenPadding: 2,
                        children: [
                          ...data.map(
                            (e) => SizedBox(
                              width: 80,
                              height: 80,
                              child: InkWell(
                                onTap: () {
                                  ref.read(bannerRadioProvider.state).state =
                                      getBannerAssets(e.name);
                                  configRadio(
                                    e.name,
                                    e.urlStreamingRadio,
                                    getImageAssets(e.name),
                                  );
                                },
                                radius: 100,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  child: Image.asset(
                                    getImageAssets(e.name),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Consumer(
                    builder: (_, WidgetRef ref, __) {
                      final banner = ref.watch(dataBannerProvider);
                      return banner.when(
                          data: (data) => Container(
                                color: black,
                                child: ImageSlideshow(
                                  width: double.infinity,
                                  height: 90,
                                  initialPage: 0,
                                  autoPlayInterval: 3000,
                                  isLoop: true,
                                  children: [
                                    ...data.map(
                                      (e) =>
                                          CachedNetworkImage(imageUrl: e.image),
                                    ),
                                  ],
                                ),
                              ),
                          error: (err, s) => Container(),
                          loading: () => const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ));
                    },
                  ),
                )
              ]),
            )),
        error: (err, s) => Text(
          err.toString(),
        ),
        loading: (() => const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )),
      ),
    );
  }
}
