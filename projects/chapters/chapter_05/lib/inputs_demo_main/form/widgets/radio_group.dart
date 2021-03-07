import 'package:chapter_05/inputs_demo_main/bloc/real_estate_search_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../util.dart';

class RadioGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<RealEstateSearchFormCubit>().state;
    final selectedSearchType = state.propertySearchType;
    return Column(
      children: [
        Row(
          children: [
            Radio(
              value: PropertySearchType.forSale,
              groupValue: selectedSearchType,
              onChanged: (value) {
                context.read<RealEstateSearchFormCubit>().setPropertySearchType(PropertySearchType.forSale);
              },
            ),
            Text("For sale"),
          ],
        ),
        Row(
          children: [
            Radio(
              value: PropertySearchType.forRent,
              groupValue: selectedSearchType,
              onChanged: (value) {
                context.read<RealEstateSearchFormCubit>().setPropertySearchType(PropertySearchType.forRent);
              },
            ),
            Text("For rent"),
          ],
        ),
      ],
    );
  }
}
