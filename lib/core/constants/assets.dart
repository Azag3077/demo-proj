class AssetImages {
  static final png = _PngAssetsName();
  static final svgs = _SvgAssetsName();
}

class _PngAssetsName {
  static const _root = 'assets/images/png';

  final icon = '$_root/icon.png';
  final leftBrain = '$_root/left-brain.png';
  final rightBrain = '$_root/right-brain.png';
  final stackedEllipses = '$_root/stacked-ellipses.png';
}

class _SvgAssetsName {
  static const _root = 'assets/images/svg';

  final splashLogo = '$_root/splash_logo.svg';
}
