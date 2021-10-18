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

# 7.1 Add routes to FirstPage and SecondPage

```dart
routes: {
        "/firstpage": (context) => const FirstPage(),
        "/secondpage": (context) => const SecondPage(),
      },
```

# 7.2 Add unknown route handling

```dart
onUnknownRoute: (route) {
        return MaterialPageRoute(
          builder: (_) =>
              ParameterPage(
                parameter: route.toString(),
              ),
        );
      },
```

# 7.3 Add WillPopScope

```dart
return WillPopScope(
      onWillPop: () async {
        var result = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Are you sure?"),
              content: const Text("Do you really want to quit?"),
              actions: [
                TextButton(
                  child: const Text("No"),
                  onPressed: () => Navigator.pop(context, false),
                ),
                TextButton(
                  child: const Text("Yes"),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            );
          },
        );
        return result ?? false;
      },
      child:
```

# 7.3 maybePop

```dart
var handledPop = await Navigator.maybePop(context);
                if (!handledPop) {
                  SystemNavigator.pop();
                }
```

# 7.4 Named navigation to "/firstpage"

```dart
Navigator.pushNamed(
                  context,
                  "/firstpage",
                );
```

# 7.5 Named navigation to "/secondpage"

```dart
Navigator.pushNamed(
                  context,
                  "/secondpage",
                );
```

# 7.6 Named navigation to "/parameterpage" with parameter

```dart
Navigator.pushNamed(
                  context,
                  "/parameterpage",
                  arguments: "Hello",
                );
```

# 7.7 Anonymous navigation to SecondPage

```dart
Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(),
                    ),
                  );
```

# 7.8 Implement onGenerateRoute

```dart
onGenerateRoute: (route) {
        switch (route.name) {
          case "/parameterpage":
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/parameterpage"),
              builder: (context) => ParameterPage(
                // TODO 7.9 Add RouteSettings  
                parameter: route.arguments.toString(),
              ),
            );
        }
        // TODO 7.10 Route URL param handling
        return null;
      },
```

# 7.9 Add RouteSettings

```dart
settings: const RouteSettings(name: "/parameterpage"),
```

# 7.10 Route URL param handling

```dart
if (route.name?.contains("/parameterpage/") ?? false) {
          final routeName = route.name!;
          final arg =
              routeName.substring(routeName.lastIndexOf("/")+1, routeName.length);
          return MaterialPageRoute(
            settings: RouteSettings(name: "/parameterpage/$arg"),
            builder: (context) => ParameterPage(
              parameter: Uri.decodeFull(arg),
            ),
          );
        }
```

