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
          // TODO 4.1 Slider
          // TODO 4.2 RangeSlider
          child: Container(),
        ),
        Text("${maxPrice.round()} MFt"),
      ],
    );
  }
}
