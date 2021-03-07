import 'package:chapter_05/inputs_demo_main/bloc/real_estate_search_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isShowingDetailedSearch = context
        .watch<RealEstateSearchFormCubit>()
        .state
        .isShowingDetailedSearch;
    return Row(
      children: [
        Text("Show more options"),
        Switch(
          value: isShowingDetailedSearch,
          onChanged: (value) {
            context
                .read<RealEstateSearchFormCubit>()
                .setDetailedSearchVisible(value);
          },
        )
      ],
    );
  }
}
