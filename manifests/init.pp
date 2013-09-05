class dotdeb (
  $key           = 'http://www.dotdeb.org/dotdeb.gpg',
  $squeeze_php54 = false,
  $wheezy_php55  = false
) {
    class { 'dotdeb::install':
    } -> anchor { 'dotdeb::end': }
}
