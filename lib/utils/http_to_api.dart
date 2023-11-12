String toRepoAPIResource(final String url,
    {final int? endIndex, final bool isPull = false,}) {
  final bool isApiURL = url.startsWith('https://api.github.com/repos/');
  final List<String> str = url
      .replaceAll(
        isApiURL ? 'https://api.github.com/repos/' : 'https://github.com/',
        '',
      )
      .split('/');
  if (isPull) {
    str[2] = 'pulls';
  }
  return 'https://api.github.com/repos/${str.sublist(0, endIndex).join('/')}';
}
