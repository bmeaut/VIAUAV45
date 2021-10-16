import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_widgets_demo/inputs_demo/bloc/real_estate_search_form_cubit.dart';

class SwitchRow extends StatelessWidget {
  const SwitchRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isShowingDetailedSearch = context
        .watch<RealEstateSearchFormCubit>()
        .state
        .isShowingDetailedSearch;
    return Row(
      children: [
        const Text("Show more options"),
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
