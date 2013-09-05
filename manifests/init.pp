class dotdeb (
  $key   = 'http://www.dotdeb.org/dotdeb.gpg',
  $php54 = false,
  $php55 = false
) {

    require stdlib

    class { 'dotdeb::install':
    } -> anchor { 'dotdeb::end': }
}
