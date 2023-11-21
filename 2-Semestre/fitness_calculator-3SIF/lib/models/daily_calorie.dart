class DailyCalorie {
  double? bMR;
  Goals? goals;

  DailyCalorie({this.bMR, this.goals});

  DailyCalorie.fromJson(Map<String, dynamic> json) {
    bMR = json['BMR'];
    goals = json['goals'] != null ? Goals.fromJson(json['goals']) : null;
  }
}

class Goals {
  double? maintainWeight;
  MildWeightLoss? mildWeightLoss;
  MildWeightLoss? weightLoss;
  MildWeightLoss? extremeWeightLoss;
  MildWeightGain? mildWeightGain;
  MildWeightGain? weightGain;
  MildWeightGain? extremeWeightGain;

  Goals(
      {this.maintainWeight,
      this.mildWeightLoss,
      this.weightLoss,
      this.extremeWeightLoss,
      this.mildWeightGain,
      this.weightGain,
      this.extremeWeightGain});

  Goals.fromJson(Map<String, dynamic> json) {
    maintainWeight = json['maintain weight'];
    mildWeightLoss = json['Mild weight loss'] != null
        ? MildWeightLoss.fromJson(json['Mild weight loss'])
        : null;
    weightLoss = json['Weight loss'] != null
        ? MildWeightLoss.fromJson(json['Weight loss'])
        : null;
    extremeWeightLoss = json['Extreme weight loss'] != null
        ? MildWeightLoss.fromJson(json['Extreme weight loss'])
        : null;
    mildWeightGain = json['Mild weight gain'] != null
        ? MildWeightGain.fromJson(json['Mild weight gain'])
        : null;
    weightGain = json['Weight gain'] != null
        ? MildWeightGain.fromJson(json['Weight gain'])
        : null;
    extremeWeightGain = json['Extreme weight gain'] != null
        ? MildWeightGain.fromJson(json['Extreme weight gain'])
        : null;
  }
}

class MildWeightLoss {
  String? lossWeight;
  double? calory;

  MildWeightLoss({this.lossWeight, this.calory});

  MildWeightLoss.fromJson(Map<String, dynamic> json) {
    lossWeight = json['loss weight'];
    calory = json['calory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loss weight'] = lossWeight;
    data['calory'] = calory;
    return data;
  }
}

class MildWeightGain {
  String? gainWeight;
  double? calory;

  MildWeightGain({this.gainWeight, this.calory});

  MildWeightGain.fromJson(Map<String, dynamic> json) {
    gainWeight = json['gain weight'];
    calory = json['calory'];
  }
}
