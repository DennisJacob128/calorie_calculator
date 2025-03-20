class Info {
  ///

  static final Map<String, String> palFactor = {
    '1.2': 'Chair-bound or bed-bound',
    '1.4 - 1.5':
        'Seated work without strenuous free time activities (students)',
    '1.6 - 1.7': 'Seated work with additional standing (laboratory technician)',
    '1.8 - 1.9': 'Standing/walking work (waiter)',
    '2.0 - 2.4': 'Strenuous work (agrarian, high performance sport)',
  };

  static final Map<String, String> bmiMale = {
    '< 18.5': 'Underweight',
    '18.5 – 24.9': 'Healthy weight',
    '25 – 29.9': 'Overweight',
    '30 – 34.9': 'Grade 1 obesity',
    '35 – 39.9': 'Grade 2 obesity',
    '> 40': 'Grade 3 obesity',
  };

  static final Map<String, String> bmiFemale = {
    '< 17.5': 'Underweight',
    '17.5 – 24': 'Healthy weight',
    '24 – 29': 'Overweight',
    '29 – 34': 'Grade 1 obesity',
    '34 – 36.5': 'Grade 2 obesity',
    '> 39': 'Grade 3 obesity',
  };

  static final String weightDelta =
      'Experts recommend a weight change of no more than 0.5kg per week.';
}
