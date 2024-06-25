extension IntUtils on int {
  double get toMb => this / 1024 / 1024;
  int get toKb => (this / 1024).round();
}
