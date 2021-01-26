T min<T extends Comparable>(T v1, T v2) {
  if (v1.compareTo(v2) < 0) {
    return v1;
  }

  return v2;
}

T max<T extends Comparable>(T v1, T v2) {
  if (v1.compareTo(v2) > 0) {
    return v1;
  }

  return v2;
}
