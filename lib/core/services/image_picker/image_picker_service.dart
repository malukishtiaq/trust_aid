import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import 'i_image_picker_service.dart';

@Injectable(as: IImagePickerService)
class ImagePickerService implements IImagePickerService {
  final ImagePicker _picker;

  ImagePickerService(this._picker);

  @override
  Future<File?> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image != null ? File(image.path) : null;
  }

  @override
  Future<File?> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    return image != null ? File(image.path) : null;
  }

  @override
  Future<File?> pickVideoFromGallery() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    return video != null ? File(video.path) : null;
  }

  @override
  Future<File?> pickVideoFromCamera() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    return video != null ? File(video.path) : null;
  }
}
