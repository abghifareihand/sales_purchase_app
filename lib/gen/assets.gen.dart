/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bg_home.png
  AssetGenImage get bgHome => const AssetGenImage('assets/images/bg_home.png');

  /// File path: assets/images/product.png
  AssetGenImage get product => const AssetGenImage('assets/images/product.png');

  /// File path: assets/images/success.png
  AssetGenImage get success => const AssetGenImage('assets/images/success.png');

  /// File path: assets/images/vendor.png
  AssetGenImage get vendor => const AssetGenImage('assets/images/vendor.png');

  /// List of all assets
  List<AssetGenImage> get values => [bgHome, product, success, vendor];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/ic_about.svg
  String get icAbout => 'assets/svg/ic_about.svg';

  /// File path: assets/svg/ic_account.svg
  String get icAccount => 'assets/svg/ic_account.svg';

  /// File path: assets/svg/ic_chevron-right.svg
  String get icChevronRight => 'assets/svg/ic_chevron-right.svg';

  /// File path: assets/svg/ic_email.svg
  String get icEmail => 'assets/svg/ic_email.svg';

  /// File path: assets/svg/ic_exit.svg
  String get icExit => 'assets/svg/ic_exit.svg';

  /// File path: assets/svg/ic_help.svg
  String get icHelp => 'assets/svg/ic_help.svg';

  /// File path: assets/svg/ic_home.svg
  String get icHome => 'assets/svg/ic_home.svg';

  /// File path: assets/svg/ic_home_active.svg
  String get icHomeActive => 'assets/svg/ic_home_active.svg';

  /// File path: assets/svg/ic_password.svg
  String get icPassword => 'assets/svg/ic_password.svg';

  /// File path: assets/svg/ic_person.svg
  String get icPerson => 'assets/svg/ic_person.svg';

  /// File path: assets/svg/ic_person_active.svg
  String get icPersonActive => 'assets/svg/ic_person_active.svg';

  /// File path: assets/svg/ic_photo.svg
  String get icPhoto => 'assets/svg/ic_photo.svg';

  /// File path: assets/svg/ic_profile.svg
  String get icProfile => 'assets/svg/ic_profile.svg';

  /// File path: assets/svg/ic_profile_active.svg
  String get icProfileActive => 'assets/svg/ic_profile_active.svg';

  /// File path: assets/svg/ic_transaction.svg
  String get icTransaction => 'assets/svg/ic_transaction.svg';

  /// File path: assets/svg/ic_transaction_active.svg
  String get icTransactionActive => 'assets/svg/ic_transaction_active.svg';

  /// File path: assets/svg/ic_username.svg
  String get icUsername => 'assets/svg/ic_username.svg';

  /// List of all assets
  List<String> get values => [
        icAbout,
        icAccount,
        icChevronRight,
        icEmail,
        icExit,
        icHelp,
        icHome,
        icHomeActive,
        icPassword,
        icPerson,
        icPersonActive,
        icPhoto,
        icProfile,
        icProfileActive,
        icTransaction,
        icTransactionActive,
        icUsername
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
