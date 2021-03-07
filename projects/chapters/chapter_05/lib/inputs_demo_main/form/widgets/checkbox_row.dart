import 'package:chapter_05/inputs_demo_main/bloc/real_estate_search_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckboxRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isNewlyBuiltChecked =
        context.watch<RealEstateSearchFormCubit>().state.isNewlyBuiltChecked;
    return Row(
      children: [
        Checkbox(
          value: isNewlyBuiltChecked,
          onChanged: (checked) {
            if (checked != null) {
              context.read<RealEstateSearchFormCubit>().newlyBuiltCheckedChanged(checked);
            }
          },
        ),
        Text("Only newly built properties")
      ],
    );
  }
}
