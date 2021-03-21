import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_widgets_demo/inputs_demo/bloc/real_estate_search_form_cubit.dart';

import 'widgets/checkbox_row.dart';
import 'widgets/date_chooser.dart';
import 'widgets/radio_group.dart';
import 'widgets/slider_row.dart';
import 'widgets/switch_row.dart';

class RealEstateSearchFormPage extends StatefulWidget {
  RealEstateSearchFormPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _RealEstateSearchFormPageState createState() =>
      _RealEstateSearchFormPageState();
}

class _RealEstateSearchFormPageState extends State<RealEstateSearchFormPage> {
  final queryTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RealEstateSearchFormCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black12,
            ),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Search query",
                  textAlign: TextAlign.start,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "City, Street, etc.",
                  ),
                  controller: queryTextController,
                ),
                CheckboxRow(),
                RadioGroup(),
                SliderRow(),
                SwitchRow(),
                /* A row that acts as a date chooser, opening a DatePicker when a button is clicked
                * and that displays the selected date as the soonest moving in date.
                * This row must only be displayed when the switch above is ON.
                */
                DateChooser(),
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
                        icon: Icon(Icons.search),
                        label: Text("SEARCH"),
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
