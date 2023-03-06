part of 'dropdown_cubit.dart';

class DropdownState extends Equatable {
  final Position selected;
  final bool isOpen;

  const DropdownState({
    this.selected = Position.TOP_RIGHT,
    this.isOpen = false,
  });

  DropdownState copyWith({
    bool? isOpen,
    Position? selected,
  }) {
    return DropdownState(
      selected: selected ?? this.selected,
      isOpen: isOpen ?? this.isOpen,
    );
  }

  @override
  List<Object?> get props => [isOpen, selected];
}
