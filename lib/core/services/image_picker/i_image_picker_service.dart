import 'dart:io';

abstract class IImagePickerService {
  Future<File?> pickImageFromGallery();
  Future<File?> pickImageFromCamera();
  Future<File?> pickVideoFromGallery();
  Future<File?> pickVideoFromCamera();
}
