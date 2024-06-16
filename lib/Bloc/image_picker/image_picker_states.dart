import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerStates extends Equatable {
  XFile? file;

  XFile? galleryFile;

  ImagePickerStates({this.file, this.galleryFile});

  ImagePickerStates copyWith({XFile? file, XFile? galleryFile}) {
    return ImagePickerStates(
        file: file ?? this.file, galleryFile: galleryFile ?? this.galleryFile);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [file, galleryFile];
}
