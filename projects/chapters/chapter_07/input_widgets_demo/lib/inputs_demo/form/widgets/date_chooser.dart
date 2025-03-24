import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_widgets_demo/inputs_demo/bloc/real_estate_search_form_cubit.dart';

import '../../../util.dart';

class DateChooser extends StatefulWidget {
  const DateChooser({super.key});

  @override
  State<DateChooser> createState() => _DateChooserState();
}

class _DateChooserState extends State<DateChooser> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<RealEstateSearchFormCubit>().state;
    final isShowingDetailedSearch = state.isShowingDetailedSearch;
    final soonestMovingInDate = state.soonestMovingInDate;

    if (isShowingDetailedSearch) {
      return Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 4),
            child: Text("Soonest moving in date:"),
          ),
          Text(getFormattedDate(soonestMovingInDate)),
          TextButton(
            child: const Text("SELECT"),
            onPressed:
                () =>
                    showSoonestMovingInDatePicker(context, soonestMovingInDate),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  void showSoonestMovingInDatePicker(
    BuildContext context,
    DateTime initialDate,
  ) async {
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
