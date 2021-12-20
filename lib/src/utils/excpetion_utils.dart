String getMessage(Object e, String defaultMessage) {
  if (e is Map) {
    return e['message'] ?? defaultMessage;
  }

  return (e as dynamic)?.message ?? defaultMessage;
}
