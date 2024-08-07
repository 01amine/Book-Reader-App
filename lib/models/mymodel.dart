// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'mymodel.freezed.dart';
part 'mymodel.g.dart';

@freezed
class MyModel with _$MyModel {
  factory MyModel({
    required String id,
    required String kind,
    required String etag,
    required VolumeInfo volumeInfo,
    SaleInfo? saleInfo,
    AccessInfo? accessInfo,
    SearchInfo? searchInfo,
  }) = _MyModel;

  factory MyModel.fromJson(Map<String, dynamic> json) =>
      _$MyModelFromJson(json);
}

@freezed
class VolumeInfo with _$VolumeInfo {
  factory VolumeInfo({
    required String title,
    String? description,
    MyImages? imageLinks,
    List<IndustryIdentifier>? industryIdentifiers,
    int? pageCount,
    @JsonKey(name: "printType") String? printType,
    List<String>? categories,
    String? maturityRating,
    bool? allowAnonLogging,
    String? contentVersion,
    PanelizationSummary? panelizationSummary,
    String? language,
    String? previewLink,
    String? infoLink,
    String? canonicalVolumeLink,
  }) = _VolumeInfo;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);
}

@freezed
class MyImages with _$MyImages {
  factory MyImages({
    String? smallThumbnail,
    String? thumbnail,
  }) = _MyImages;

  factory MyImages.fromJson(Map<String, dynamic> json) =>
      _$MyImagesFromJson(json);
}

@freezed
class IndustryIdentifier with _$IndustryIdentifier {
  factory IndustryIdentifier({
    String? type,
    String? identifier,
  }) = _IndustryIdentifier;

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifierFromJson(json);
}

@freezed
class PanelizationSummary with _$PanelizationSummary {
  factory PanelizationSummary({
    bool? containsEpubBubbles,
    bool? containsImageBubbles,
  }) = _PanelizationSummary;

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) =>
      _$PanelizationSummaryFromJson(json);
}

@freezed
class SaleInfo with _$SaleInfo {
  factory SaleInfo({
    String? country,
    String? saleability,
    bool? isEbook,
  }) = _SaleInfo;

  factory SaleInfo.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoFromJson(json);
}

@freezed
class AccessInfo with _$AccessInfo {
  factory AccessInfo({
    String? country,
    String? viewability,
    bool? embeddable,
    bool? publicDomain,
    String? textToSpeechPermission,
    Epub? epub,
    Pdf? pdf,
    String? webReaderLink,
    String? accessViewStatus,
    bool? quoteSharingAllowed,
  }) = _AccessInfo;

  factory AccessInfo.fromJson(Map<String, dynamic> json) =>
      _$AccessInfoFromJson(json);
}

@freezed
class Epub with _$Epub {
  factory Epub({
    bool? isAvailable,
  }) = _Epub;

  factory Epub.fromJson(Map<String, dynamic> json) => _$EpubFromJson(json);
}

@freezed
class Pdf with _$Pdf {
  factory Pdf({
    bool? isAvailable,
    String? acsTokenLink,
  }) = _Pdf;

  factory Pdf.fromJson(Map<String, dynamic> json) => _$PdfFromJson(json);
}

@freezed
class SearchInfo with _$SearchInfo {
  factory SearchInfo({
    String? textSnippet,
  }) = _SearchInfo;

  factory SearchInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchInfoFromJson(json);
}
