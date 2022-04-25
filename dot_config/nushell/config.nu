# A wrapper around pacman
def pac [
  ...args: string # Arguments passed to pacman (wrapper)
] { ^paru $args }

# List upgradable packages
def "pac updates" [] {
  ^checkupdates
  | lines
  | parse "{package} {current} -> {upgrade}"
}

# List orphan packages
def "pac unneeded" [
  --clean (-c): bool # Remove packages instead of listing them
] { if $clean { ^paru -c } else { ^paru -Qdt } }

# Search repos for installable packages
def "pac search" [
  ...terms: string # Search terms
] {
  let out = (^paru -Ss $terms | lines | compact)

  let p1 = (
    $out
    | each -n {
      |it| if (math eval $"($it.index) % 2") == 0 {
        $it.item | parse '{repo}/{package} {version}'
      }
    }
    | flatten
    | update version {
      |it| $it.version | str replace ' .*' ''
    }
  )

  let p2 = (
    $out
    | each -n {
      |it| if (math eval $"($it.index) % 2") != 0 {
        $it.item
      }
    }
    | str trim
    | wrap desc
  )

  $p1 | merge { $p2 }
  | sort-by package
}

# Return the user's config file
def config [] { open $nu.config-path }

# Edit the config file
def "config edit" [] { ^nvim $nu.config-path }

# Go to the config file's location
def-env "config cd" [] { cd ($nu.config-path | path dirname) }

# Show wallpaper information
def "wallpaper get" [] {
  open $"($env.XDG_CONFIG_HOME)/wpaperd/output.conf"
  | from toml | flatten
  | insert type { |it| $it.path | path type }
  | roll left
}
