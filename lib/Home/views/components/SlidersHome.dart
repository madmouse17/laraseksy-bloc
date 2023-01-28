import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laraseksy_bloc/Home/bloc/homebloc/home_bloc.dart';
import 'package:laraseksy_bloc/Home/bloc/sliderbloc/slider_bloc.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:sizer/sizer.dart';
import 'package:dots_indicator/dots_indicator.dart';

class SlidersHome extends StatefulWidget {
  SlidersHome({super.key});

  @override
  State<SlidersHome> createState() => _SlidersHomeState();
}

class _SlidersHomeState extends State<SlidersHome> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  int _current = 0;
  late BuildContext _context;
  late BuildContext _contexthome;
  int length = 0;

  final CarouselController _controller = CarouselController();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _context.read<SliderBloc>().add(SliderEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderBloc, SliderState>(builder: (context, state) {
      _context = context;
      return RefreshIndicator(
        onRefresh: () async => context.read<SliderBloc>().add(SliderEvent()),
        child: SizedBox(
          height: 22.h,
          child: Column(children: [
            (state is LoadedState)
                ? Expanded(
                    child: CarouselSlider(
                      items: state.sliderModels.data
                          .map((item) => Container(
                                child: Container(
                                  child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      child: Stack(
                                        children: <Widget>[
                                          CachedNetworkImage(
                                            imageUrl: item.image,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                CircularProgressIndicator(
                                                    value: downloadProgress
                                                        .progress),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                          Positioned(
                                            bottom: 0.0,
                                            left: 0.0,
                                            right: 0.0,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(
                                                        200, 0, 0, 0),
                                                    Color.fromARGB(0, 0, 0, 0)
                                                  ],
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ))
                          .toList(),
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2.8,
                          onPageChanged: (index, reason) {
                            _contexthome
                                .read<HomeBloc>()
                                .add(CurrentSliderEvent(currentSlider: index));
                          }),
                    ),
                  )
                : (state is LoadingState)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(),
            // if (state is CurrentSlidersState) ...[
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, stateHome) {
                _contexthome = context;
                if (state is LoadedState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DotsIndicator(
                        dotsCount: state.sliderModels.data.length,
                        position:
                            double.parse(stateHome.currentSlider.toString()),
                        decorator: DotsDecorator(
                          color: Pallete.primaryColor.withOpacity(0.5),
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                        onTap: (position) {
                          _controller.animateToPage(int.parse(
                              position.toString().replaceAll('.0', '')));
                          context.read<HomeBloc>().add(CurrentSliderEvent(
                              currentSlider: int.parse(
                                  position.toString().replaceAll('.0', ''))));
                        },
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
            // ]
          ]),
        ),
      );
    });
  }
}
