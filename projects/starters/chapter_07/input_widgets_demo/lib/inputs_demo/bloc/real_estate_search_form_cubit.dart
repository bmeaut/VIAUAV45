import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../util.dart';

class RealEstateSearchFormCubit extends Cubit<FormState> {
  RealEstateSearchFormCubit()
    : super(FormState.initial(soonestMovingInDate: DateTime.now()));

  void newlyBuiltCheckedChanged(bool checked) {
    emit(state.copyWith(isNewlyBuiltChecked: checked));
  }

  void setPropertySearchType(PropertySearchType type) {
    emit(state.copyWith(propertySearchType: type));
  }

  void onPriceValuesChanged(double start, double end) {
    emit(state.copyWith(minPriceValue: start, maxPriceValue: end));
  }

  void setDetailedSearchVisible(bool visible) {
    emit(state.copyWith(isShowingDetailedSearch: visible));
  }

  void setSoonestMovingInDate(DateTime date) {
    emit(state.copyWith(soonestMovingInDate: date));
  }
}

@immutable
class FormState extends Equatable {
  final bool isNewlyBuiltChecked;
  final bool isShowingDetailedSearch;
  final PropertySearchType propertySearchType;
  final double minPriceValue;
  final double maxPriceValue;
  final DateTime soonestMovingInDate;

  const FormState(
    this.isNewlyBuiltChecked,
    this.isShowingDetailedSearch,
    this.propertySearchType,
    this.minPriceValue,
    this.maxPriceValue,
    this.soonestMovingInDate,
  );

  const FormState.initial({
    this.isNewlyBuiltChecked = false,
    this.isShowingDetailedSearch = false,
    this.propertySearchType = PropertySearchType.forSale,
    this.minPriceValue = minPrice,
    this.maxPriceValue = maxPrice,
    required this.soonestMovingInDate,
  });

  FormState copyWith({
    bool? isNewlyBuiltChecked,
    bool? isShowingDetailedSearch,
    PropertySearchType? propertySearchType,
    double? minPriceValue,
    double? maxPriceValue,
    DateTime? soonestMovingInDate,
  }) {
    return FormState(
      isNewlyBuiltChecked ?? this.isNewlyBuiltChecked,
      isShowingDetailedSearch ?? this.isShowingDetailedSearch,
      propertySearchType ?? this.propertySearchType,
      minPriceValue ?? this.minPriceValue,
      maxPriceValue ?? this.maxPriceValue,
      soonestMovingInDate ?? this.soonestMovingInDate,
    );
  }

  @override
  List<Object> get props => [
    isNewlyBuiltChecked,
    isShowingDetailedSearch,
    propertySearchType,
    minPriceValue,
    maxPriceValue,
    soonestMovingInDate,
  ];
}
