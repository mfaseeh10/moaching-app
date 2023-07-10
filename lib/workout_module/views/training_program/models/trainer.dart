class Trainer {
  final String Id;

  final String Name;

  final String Phone;

  final DateTime? Birthday;

  final String Email;

  final String ProfilePicture_Path;

  final bool EnabledInApp;

  final bool EnabledCallInApp;

  final bool EnabledMailInApp;

  final String About;

  final bool HasTrainingPermission;

  final bool HasFoodplanPermission;

  final String City;

  final List<int> TrainerGroups;

  final List<String> Roles;
  //
  // final Gender Gender  ;

  final bool WaitingForAccept;

  Trainer({
    this.About = "",
    this.Birthday,
    this.City = "",
    this.Email = "",
    this.EnabledCallInApp = false,
    this.EnabledInApp = false,
    this.EnabledMailInApp = false,
    this.HasFoodplanPermission = false,
    this.HasTrainingPermission = false,
    this.Id = "",
    this.Name = "",
    this.Phone = "",
    this.ProfilePicture_Path = "",
    this.Roles = const ["c"],
    this.TrainerGroups = const [],
    this.WaitingForAccept = true,
  });

  factory Trainer.empty() => Trainer();
  factory Trainer.fromJson() => Trainer();
  Map<String, dynamic> toJson() {
    return {"": About};
  }
}
