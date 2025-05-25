import 'package:equatable/equatable.dart';

import '../../../models/home_labels_icons.dart';

class HomeState extends Equatable {
  final List<Home> items;
  final String header;
  final bool isLoading;

  const HomeState({
    required this.items,
    required this.header,
    required this.isLoading,
  });

  factory HomeState.initial() => const HomeState(
        items: [],
        header: '',
        isLoading: false,
      );

  HomeState copyWith({
    List<Home>? items,
    String? header,
    bool? isLoading,
  }) {
    return HomeState(
      items: items ?? this.items,
      header: header ?? this.header,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [items, header, isLoading];
}
