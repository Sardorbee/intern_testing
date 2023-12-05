import 'package:equatable/equatable.dart';

class FileModel extends Equatable {
  final String fileName;
  final String filePath;
  final double progress;

  const FileModel({
    required this.fileName,
    required this.filePath,
    required this.progress,
  });

  FileModel copyWith({
    String? fileName,
    String? filePath,
    double? progress,
  }) =>
      FileModel(
        fileName: fileName ?? this.fileName,
        filePath: filePath ?? this.filePath,
        progress: progress ?? this.progress,
      );

  @override
  List<Object?> get props => [
        fileName,
        filePath,
        progress,
      ];
}

List<FileModel> filesData = [
  const FileModel(
    progress: 0.0,
    fileName: "Peek a Boo",
    filePath: "assets/videos/peek_a_boo.mp4",
  ),
  const FileModel(
    progress: 0.0,
    fileName: "Hamdam Sobirov - Janze",
    filePath: "music/xamdam_sobirov_janze.mp3",
  ),
  const FileModel(
    progress: 0.0,
    fileName: "Peek a Boo",
    filePath: "assets/videos/peek_a_boo.mp4",
  ),
  const FileModel(
    progress: 0.0,
    fileName: "Hamdam Sobirov - Janze",
    filePath: "music/xamdam_sobirov_janze.mp3",
  ),
  const FileModel(
    progress: 0.0,
    fileName: "Peek a Boo",
    filePath: "assets/videos/peek_a_boo.mp4",
  ),
  const FileModel(
    progress: 0.0,
    fileName: "Hamdam Sobirov - Janze",
    filePath: "music/xamdam_sobirov_janze.mp3",
  ),
];
