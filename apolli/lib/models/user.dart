class User {
  const User({
    this.dob,
    this.gender,
    this.race,
    this.maritalStatus,
    this.householdSize,
    this.numberOfChildren,
    this.educationLevel,
    this.employmentStatus,
    this.homeOwnershipStatus,
    this.stateResidence,
  });

  final DateTime? dob;
  final Gender? gender;
  final RaceAndEthnicity? race;
  final MaritalStatus? maritalStatus;
  final int? householdSize;
  final int? numberOfChildren;
  final EducationLevel? educationLevel;
  final EmploymentStatus? employmentStatus;
  final HomeOwnershipStatus? homeOwnershipStatus;
  final String? stateResidence;
}

enum Gender {
  male,
  female,
  nonbinary,
}

enum RaceAndEthnicity {
  asian,
  black,
  hawaiin,
  hispanic,
  nativeAmerican,
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
