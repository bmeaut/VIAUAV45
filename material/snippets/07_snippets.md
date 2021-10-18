# 1.1 Create text controller

```dart
final queryTextController = TextEditingController();
```

# 1.2 Add text controller

```dart
controller: queryTextController,
```

# 1.3 Use value from text controller

```dart
content: Text(queryTextController.value.text),
```

# 1.4 Dispose text controller

```dart
queryTextController.dispose();
```

# 2.1 CheckBoxRow

```dart
final isNewlyBuiltChecked = context.watch<RealEstateSearchFormCubit>().state.isNewlyBuiltChecked;
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
        const Text("Only newly built properties")
      ],
    );
```

# 3.1 RadioGroup

```dart
final selectedSearchType = context.watch<RealEstateSearchFormCubit>()
        .state.propertySearchType;
    return Column(
      children: [
        Row(
          children: [
            Radio(
              value: PropertySearchType.forSale,
              groupValue: selectedSearchType,
              onChanged: (value) {
                context.read<RealEstateSearchFormCubit>()
                    .setPropertySearchType(PropertySearchType.forSale);
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
                context.read<RealEstateSearchFormCubit>()
                    .setPropertySearchType(PropertySearchType.forRent);
              },
            ),
            const Text("For rent"),
          ],
        ),
      ],
    );
```

# 4.1 Slider

Don't forget to adjust the Cubit!

```dart
child: Slider(
            value: maxPriceValue,
            min: minPrice,
            max: maxPrice,
            divisions: 30,
            label: "${maxPriceValue.round().toString()} MFt",
            onChanged: (value) {
              context.read<RealEstateSearchFormCubit>().onPriceValueChanged(
                    value,
                  );
            },
          ),
```

# 4.2 RangeSlider

```dart
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
```

# 5.1 SwitchRow

```dart
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
```

# 6.1 Date picker row

```dart
final state = context.watch<RealEstateSearchFormCubit>().state;
    final isShowingDetailedSearch = state.isShowingDetailedSearch;
    final soonestMovingInDate = state.soonestMovingInDate;

    if (isShowingDetailedSearch) {
      return Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 4),
            child: Text("Soonest moving in date:"),
          ),
          Text(getFormattedDate(soonestMovingInDate)),
          TextButton(
            child: const Text("SELECT"),
            onPressed: () => showSoonestMovingInDatePicker(
              context,
              soonestMovingInDate,
            ),
          )
        ],
      );
    } else {
      return Container();
    }
```

# 6.2 Date picker function

```dart
void showSoonestMovingInDatePicker(BuildContext context, DateTime initialDate) async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: now,
      lastDate: DateTime(now.year + 1, now.month, now.day),
    );
    if (date != null) {
      context.read<RealEstateSearchFormCubit>().setSoonestMovingInDate(date);
    }
  }
```

