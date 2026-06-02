final dimensions = Dimensions.instance;

class Dimensions {
  Dimensions._();

  static final Dimensions instance = Dimensions._();

  double _deviceHeight = 0;
  double _deviceWidth = 0;

  double get deviceHeight => _deviceHeight;
  double get deviceWidth => _deviceWidth;
  double get deviceAverage => (deviceHeight + deviceWidth) / 2;

  set setDeviceHeight(double value) {
    _deviceHeight = value;
  }

  set setDeviceWidth(double value) {
    _deviceWidth = value;
  }
}

double get commonHorizontalSpacing => dimensions.deviceWidth * 0.04;
