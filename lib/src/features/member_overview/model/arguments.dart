class MemberOverviewArguments {
  const MemberOverviewArguments({
    this.isOnlySelectionMode = false,
    this.membersId = const <int>[],
  });

  final bool isOnlySelectionMode;
  final List<int> membersId;

  MemberOverviewArguments copyWith({
    bool? isOnlySelectionMode,
    List<int>? membersId,
  }) {
    return MemberOverviewArguments(
      isOnlySelectionMode: isOnlySelectionMode ?? this.isOnlySelectionMode,
      membersId: membersId ?? this.membersId,
    );
  }
}
