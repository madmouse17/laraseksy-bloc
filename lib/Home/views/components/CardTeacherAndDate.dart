import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:laraseksy_bloc/Home/bloc/cardAbsensibloc/card_absensi_bloc.dart';
import 'package:laraseksy_bloc/Home/bloc/datebloc/date_bloc.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:sizer/sizer.dart';

class CardTeacherAndDate extends StatefulWidget {
  const CardTeacherAndDate({
    Key? key,
  }) : super(key: key);

  @override
  State<CardTeacherAndDate> createState() => _CardTeacherAndDateState();
}

class _CardTeacherAndDateState extends State<CardTeacherAndDate> {
  late BuildContext _context;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _context.read<CardAbsensiBloc>().add(
            AbsensiLoadedEvent(
              tanggal: DateFormat('y-M-d').format(DateTime.now()),
            ),
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardAbsensiBloc, CardAbsensiState>(
      builder: (contextCard, state) {
        _context = contextCard;

        return Container(
          height: 5.h,
          width: 83.w,
          margin: EdgeInsets.only(left: 4.w),
          decoration: BoxDecoration(
              color: Pallete.boxLoginColor,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (state is LoadingState) ...[
                  Container(
                    child: CircularProgressIndicator(),
                  )
                ] else if (state is LoadedState) ...[
                  AutoSizeText(
                    state.cardAbsensiModels.data!.waliKelas!.nama!,
                    maxLines: 1,
                    minFontSize: 8,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Pallete.primaryDarkColor,
                        fontWeight: FontWeight.bold),
                  )
                ] else if (state is ErrorState) ...[
                  (state.waliKelas!.isEmpty)
                      ? Container()
                      : AutoSizeText(
                          state.waliKelas!,
                          maxLines: 1,
                          minFontSize: 8,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Pallete.primaryDarkColor,
                              fontWeight: FontWeight.bold),
                        )
                ],
                BlocBuilder<DateBloc, DateState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: state.now,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(3050))
                            .then((date) {
                          context
                              .read<DateBloc>()
                              .add(ChooseDateEvent(now: date!));
                          _context.read<CardAbsensiBloc>().add(
                                AbsensiLoadedEvent(
                                  tanggal: date.toIso8601String(),
                                ),
                              );
                        });
                      },
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                context
                                    .read<DateBloc>()
                                    .add(DecrementDateEvent());
                                _context.read<CardAbsensiBloc>().add(
                                      AbsensiLoadedEvent(
                                        tanggal: state.now
                                            .subtract(Duration(days: 1))
                                            .toIso8601String(),
                                      ),
                                    );
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Pallete.primaryDarkColor,
                              )),
                          Text(
                            DateFormat('d MMM y').format(state.now),
                            style: TextStyle(color: Pallete.primaryDarkColor),
                          ),
                          IconButton(
                              onPressed: () {
                                context
                                    .read<DateBloc>()
                                    .add(IncrementDateEvent());
                                log(state.now.toString());
                                _context.read<CardAbsensiBloc>().add(
                                      AbsensiLoadedEvent(
                                        tanggal: state.now
                                            .add(Duration(days: 1))
                                            .toIso8601String(),
                                      ),
                                    );
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Pallete.primaryDarkColor,
                              ))
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
