enum PopularityFrom { emailed, shared, viewed }

enum PopularityPeriod { day, week, month }

extension PopularityFromExtension on PopularityFrom {
  String toStringCustom(
      {PopularityPeriod popularityPeriod = PopularityPeriod.week}) {
    int time = popularityPeriod.toIntCustom();
    switch (this) {
      case PopularityFrom.emailed:
        return '/emailed/$time.json';
      case PopularityFrom.shared:
        return '/shared/$time.json';
      case PopularityFrom.viewed:
        return '/viewed/$time.json';
      default:
        return '/viewed/7.json';
    }
  }
}

extension PopularityPeriodExtension on PopularityPeriod {
  int toIntCustom() {
    switch (this) {
      case PopularityPeriod.day:
        return 1;
      case PopularityPeriod.week:
        return 7;
      case PopularityPeriod.month:
        return 30;
      default:
        return 7;
    }
  }
}
