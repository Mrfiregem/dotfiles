# Intall a package or update your system.
def pac [
  ...rest: string  # Optional search query
] { ^paru $rest }

# Show info about a repo package
def 'pac info' [
  package: string  # Package name
  ...rest: string  # Additional packages
] { ^paru -Si $package $rest }

# Install a package
def 'pac install' [
  package: string  # Package to install
  ...rest: string  # Additional packages
] { ^paru -S $package $rest }

# List all packages installed by pacman.
def 'pac list' [] {
  ^paru -Qs | lines | each group 2 {
    echo [[_, description]; [$it.0 $it.1]]
  } | str trim | update _ {
    get _ | parse 'local/{package} {vg}'
  } | flatten _ | update vg {
    get vg | parse -r '^(?P<version>\S+)(?: \((?P<groups>.*)\))?$' |
    default groups ''
  } | flatten vg | update groups {
    get groups | split row ' '
  }
}

# Search for packages in the repos.
def 'pac search' [
  ...rest: string  # Search terms
] {
  ^paru -Ss $rest | lines | each group 2 {
    echo [[_, description]; [$it.0 $it.1]]
  } | str trim | update _ {
    get _ | str find-replace ' \[.+\]' '' | parse "{repo}/{package} {vg}"
  } | flatten _ | update vg {
    get vg | parse -r '^(?P<version>\S+)(?: \((?P<groups>.*)\))?$' |
    default groups ''
  } | flatten vg | update groups {
    get groups | split row ' '
  }
}

# Show info about installed packages
def 'pac show' [
  package: string  # Package name
  ...rest: string  # Additional packages
] { ^paru -Qi $package $rest }

# Uninstalls specified package(s)
def 'pac uninstall' [
  package: string  # Package to remove
  ...rest: string  # Additional packages
] { ^paru -Rns $package $rest }

# Output list of pending updates.
def 'pac updates' [] {
  let x = (^checkupdates | wrap _ | default _ '')

  if $x._ != '' {
    $x._ | lines | parse '{package} {current} -> {upgrade}'
  } {}
}

