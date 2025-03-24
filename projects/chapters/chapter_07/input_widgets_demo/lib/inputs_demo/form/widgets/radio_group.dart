import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_widgets_demo/inputs_demo/bloc/real_estate_search_form_cubit.dart';

import '../../../util.dart';

class RadioGroup extends StatelessWidget {
  const RadioGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedSearchType =
        context.watch<RealEstateSearchFormCubit>().state.propertySearchType;
    return Column(
      children: [
        Row(
          children: [
            Radio(
              value: PropertySearchType.forSale,
              groupValue: selectedSearchType,
              onChanged: (value) {
                context.read<RealEstateSearchFormCubit>().setPropertySearchType(
                  PropertySearchType.forSale,
                );
              },
            ),
            const Text("For sale"),
          ],
        ),
        Row(
          children: [
            Radio(
              value: PropertySearchType.forRent,
              groupValue: selectedSearchType,
              onChanged: (value) {
                context.read<RealEstateSearchFormCubit>().setPropertySearchType(
                  PropertySearchType.forRent,
                );
              },
            ),
            const Text("For rent"),
          ],
        ),
      ],
    );
  }
}
