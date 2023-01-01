import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:laraseksy_bloc/Home/bloc/datebloc/date_bloc.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:sizer/sizer.dart';

class CardTeacherAndDate extends StatelessWidget {
  const CardTeacherAndDate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            AutoSizeText(
              'Sartini S.pd',
              maxLines: 1,
              minFontSize: 8,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Pallete.primaryDarkColor),
            ),
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
                      context.read<DateBloc>().add(ChooseDateEvent(now: date!));
                    });
                  },
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<DateBloc>().add(DecrementDateEvent());
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
                            context.read<DateBloc>().add(IncrementDateEvent());
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
  }
}
