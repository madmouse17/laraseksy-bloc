import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:laraseksy_bloc/Home/bloc/cardAbsensibloc/card_absensi_bloc.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sizer/sizer.dart';

class CardAbsensi extends StatefulWidget {
  CardAbsensi({
    Key? key,
  }) : super(key: key);

  @override
  State<CardAbsensi> createState() => _CardAbsensiState();
}

class _CardAbsensiState extends State<CardAbsensi> {
  final RoundedLoadingButtonController btnAbsen =
      RoundedLoadingButtonController();
  late BuildContext _context;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _context.read<CardAbsensiBloc>().add(
            AbsensiLoadedEvent(
              tanggal: DateFormat('y-M-d').format(DateTime.now()),
            ),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardAbsensiBloc, CardAbsensiState>(
      builder: (context, state) {
        _context = context;
        return SizedBox(
          height: 55.h,
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1.h,
                mainAxisExtent: 20.h,
                mainAxisSpacing: 2.w),
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Pallete.tertiaryColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.5.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            'Bahasa Indonesia',
                            maxLines: 1,
                            minFontSize: 8,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          AutoSizeText(
                            'Martini S.pd',
                            maxLines: 1,
                            minFontSize: 8,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          AutoSizeText(
                            '08:00 -10:00',
                            maxLines: 1,
                            minFontSize: 8,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const Divider(
                          color: Colors.black,
                          height: 0,
                          thickness: 2,
                        ),
                        RoundedLoadingButton(
                          color: Pallete.tertiarySecondaryColor,
                          controller: btnAbsen,
                          borderRadius: 0,
                          onPressed: () {},
                          child: const Text('Absen'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
