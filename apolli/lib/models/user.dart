class User {
  const User({
    required this.dob,
    required this.gender,
    required this.race,
    required this.maritalStatus,
    required this.householdSize,
    required this.numberOfChildren,
    required this.educationLevel,
    required this.employmentStatus,
    required this.householdIncome,
    required this.homeOwnershipStatus,
    required this.stateResidence,
  });

  final DateTime dob;
  final Gender gender;
  final RaceAndEthnicity race;
  final MaritalStatus maritalStatus;
  final int householdSize;
  final int numberOfChildren;
  final EducationLevel educationLevel;
  final EmploymentStatus employmentStatus;
  final int householdIncome;
  final HomeOwnershipStatus homeOwnershipStatus;
  final String stateResidence;
}

enum Gender {
  male,
  female,
  nonbinary,
}

enum RaceAndEthnicity {
  americanIndian,
  asian,
  black,
  hispanic,
  nativeHawaiin,
  white,
}

enum MaritalStatus {
  single,
  married,
  divorced,
  widowed,
  other,
}

enum EducationLevel {
  someHighSchool,
  highSchool,
  someCollege,
  associate,
  bachelors,
  masters,
  doctorate,
}

enum EmploymentStatus {
  fullTime,
  partTime,
  unemployed,
  student,
  retired,
}

enum HomeOwnershipStatus {
  homeowner,
  renter,
  familyAndFriends,
}
