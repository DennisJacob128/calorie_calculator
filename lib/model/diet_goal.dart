enum DietGoal {
  loose('loose'),
  gain('gain'),
  maintain('maintain');

  const DietGoal(this.goal);

  factory DietGoal.fromString(String goal) {
    return values.firstWhere((value) => value.goal == goal);
  }

  final String goal;
}
