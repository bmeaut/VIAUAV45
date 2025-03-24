import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_widgets_demo/inputs_demo/bloc/real_estate_search_form_cubit.dart';

import 'widgets/checkbox_row.dart';
import 'widgets/date_chooser.dart';
import 'widgets/radio_group.dart';
import 'widgets/slider_row.dart';
import 'widgets/switch_row.dart';

class RealEstateSearchFormPage extends StatefulWidget {
  const RealEstateSearchFormPage({super.key, required this.title});

  final String title;

  @override
  State<RealEstateSearchFormPage> createState() =>
      _RealEstateSearchFormPageState();
}

class _RealEstateSearchFormPageState extends State<RealEstateSearchFormPage> {
  final queryTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RealEstateSearchFormCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black12,
            ),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Search query", textAlign: TextAlign.start),
                TextField(
                  decoration: const InputDecoration(
                    labelText: "City, Street, etc.",
                  ),
                  controller: queryTextController,
                ),
                const CheckboxRow(),
                const RadioGroup(),
                const SliderRow(),
                const SwitchRow(),
                /*
                * A row that acts as a date chooser, opening a DatePicker when a button is clicked
                * and that displays the selected date as the soonest moving in date.
                * This row must only be displayed when the switch above is ON.
                */
                const DateChooser(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(queryTextController.value.text),
                            ),
                          );
                        },
                        icon: const Icon(Icons.search),
                        label: const Text("SEARCH"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    queryTextController.dispose();
    super.dispose();
  }
}
