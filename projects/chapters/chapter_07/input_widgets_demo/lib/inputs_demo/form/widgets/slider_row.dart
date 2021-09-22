import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_widgets_demo/inputs_demo/bloc/real_estate_search_form_cubit.dart';

import '../../../util.dart';

class SliderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<RealEstateSearchFormCubit>().state;
    final minPriceValue = state.minPriceValue;
    final maxPriceValue = state.maxPriceValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("${MIN_PRICE.round()} MFt"),
        Expanded(
          child: RangeSlider(
            values: RangeValues(minPriceValue, maxPriceValue),
            min: MIN_PRICE,
            max: MAX_PRICE,
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
        Text("${MAX_PRICE.round()} MFt"),
      ],
    );
  }
}
