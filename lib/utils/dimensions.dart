final dimensions = Dimensions.instance;

class Dimensions {
  Dimensions._();

  static final Dimensions instance = Dimensions._();

  late double? _deviceHeight;
  late double? _deviceWidth;

  double get deviceHeight => _deviceHeight ?? 0;
  double get deviceWidth => _deviceWidth ?? 0;
  double get deviceAverage => (deviceHeight + deviceWidth) / 2;

  set setDeviceHeight(double value) {
    _deviceHeight = value;
  }

  set setDeviceWidth(double value) {
    _deviceWidth = value;
  }
}

final commonHorizontalSpacing = dimensions.deviceWidth * 0.04;
