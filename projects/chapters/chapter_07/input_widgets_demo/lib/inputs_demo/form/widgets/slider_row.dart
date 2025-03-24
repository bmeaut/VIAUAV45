import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_widgets_demo/inputs_demo/bloc/real_estate_search_form_cubit.dart';

import '../../../util.dart';

class SliderRow extends StatelessWidget {
  const SliderRow({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RealEstateSearchFormCubit>().state;
    final minPriceValue = state.minPriceValue;
    final maxPriceValue = state.maxPriceValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("${minPrice.round()} MFt"),
        Expanded(
          child: RangeSlider(
            values: RangeValues(minPriceValue, maxPriceValue),
            min: minPrice,
            max: maxPrice,
            divisions: 30,
            labels: RangeLabels(
              "${minPriceValue.round().toString()} MFt",
              "${maxPriceValue.round().toString()} MFt",
            ),
            onChanged: (values) {
              context.read<RealEstateSearchFormCubit>().onPriceValuesChanged(
                values.start,
                values.end,
              );
            },
          ),
        ),
        Text("${maxPrice.round()} MFt"),
      ],
    );
  }
}
