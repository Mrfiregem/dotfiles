# Send file to the trash.
def trash [file: path] {
  ^trash-put $file
}

# Empty files from trash.
def 'trash empty' [] {
  ^trash-empty
}

# List trashed files.
def 'trash list' [] {
  ^trash-list | lines |
  parse -r '^(?P<date>.+) (?P<file>.+$)' |
  update date {
    get date | ^date -d $"($it.date)" |
    str to-datetime
  } |
  roll column
}

