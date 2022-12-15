class Inks {
  double canPaint_500;
  double canPaint_2500;
  double canPaint_3600;
  double canPaint_18000;

  late double inkTotal;
  late double remainingInk;

  Inks({
    required this.inkTotal,
    this.canPaint_500 = 0.5,
    this.canPaint_2500 = 2.5,
    this.canPaint_3600 = 3.6,
    this.canPaint_18000 = 18.0,
    this.remainingInk = 0,
  });

  int get can18000 => calculate18000();
  int get can3600 => calculate3600();
  int get can2500 => calculate2500();
  int get can500 => calculate500();

  int calculate18000() {
    int ret = 0;
    if (inkTotal >= 18) {
      ret = (inkTotal / canPaint_18000).truncate();
      remainingInk = inkTotal - ret * canPaint_18000;
    } else {
      remainingInk = inkTotal;
      ret = 0;
    }
    return ret;
  }

  int calculate3600() {
    int ret = 0;
    if (remainingInk >= 3.6) {
      ret = (remainingInk / canPaint_3600).truncate();
      remainingInk = remainingInk - ret * canPaint_3600;
    } else {
      ret = 0;
    }
    return ret;
  }

  int calculate2500() {
    int ret = 0;
    if (remainingInk >= 2.5) {
      ret = (remainingInk / canPaint_2500).truncate();
      remainingInk = remainingInk - ret * canPaint_2500;
    } else {
      ret = 0;
    }
    return ret;
  }

  int calculate500() {
    int ret = 0;
    if (remainingInk >= 0.5) {
      ret = (remainingInk / canPaint_500).truncate();
      remainingInk = remainingInk - ret * canPaint_500;
      if (remainingInk > 0) {
        ret++;
      }
    } else {
      ret = 0;
    }
    return ret;
  }
}
