class dotdeb(
  $key   = 'http://www.dotdeb.org/dotdeb.gpg',
  $php54 = false,
  $php55 = false
) {
    class { 'dotdeb::install':
    } -> anchor { 'dotdeb::end': }
}
