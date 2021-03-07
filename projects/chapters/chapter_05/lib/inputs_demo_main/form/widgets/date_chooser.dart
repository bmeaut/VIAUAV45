import 'package:chapter_05/inputs_demo_main/bloc/real_estate_search_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../util.dart';

class DateChooser extends StatefulWidget {
  @override
  _DateChooserState createState() => _DateChooserState();
}

class _DateChooserState extends State<DateChooser> {

  final emptyContainer = Container();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RealEstateSearchFormCubit>().state;
    final isShowingDetailedSearch = state.isShowingDetailedSearch;
    final soonestMovingInDate = state.soonestMovingInDate;

    if (isShowingDetailedSearch) {
      return Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 4),
            child: Text("Soonest moving in date:"),
          ),
          Text(getFormattedDate(soonestMovingInDate)),
          TextButton(
            child: Text("SELECT DATE"),
            onPressed: () => showSoonestMovingInDatePicker(
              context,
              soonestMovingInDate,
            ),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  void showSoonestMovingInDatePicker(
      BuildContext context, DateTime initialDate) async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: now,
      lastDate: DateTime(now.year + 1, now.month, now.day),
    );
    if (date != null) {
      context.read<RealEstateSearchFormCubit>().setSoonestMovingInDate(date);
    }
  }
}
