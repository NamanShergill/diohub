String toRepoAPIResource(String url, {int? endIndex, bool isPull = false}) {
  bool isApiURL = url.startsWith('https://api.github.com/repos/');
  List<String> str = url
      .replaceAll(
          isApiURL ? 'https://api.github.com/repos/' : 'https://github.com/',
          '')
      .split('/');
  if (isPull) {
    str[2] = 'pulls';
  }
  return 'https://api.github.com/repos/' + str.sublist(0, endIndex).join('/');
}
