# Cheat sheet

## Run a regex substitution over all files in a git index and working directory but not symlinks to such files

```Shell
datalad run "git ls-files -z | xargs --null -I '()' find './()' -type f -print0 | xargs --null sed --in-place --regexp-extended 's/23/42/g;'"

# Escape regex metachar . in Prometheus instance label that is likely to be meant literally.
read -r -d '' cmd <<'EOF'; datalad run --dataset "$(git rev-parse --show-toplevel)" "$(echo -E "$cmd" | sed --regexp-extended 's/([{}])/\1\1/g;')"
git ls-files -z | xargs --null -I '()' find './()' -type f -path "*prometheus*" -print0 | xargs --null perl -Wpi -e 'if (/(?<pre>.*instance=~")(?<instance>[^"]+)(?<post>".*)/) { my $pre = $+{pre}; my $post = $+{post}; my $esc_seq = "\\" x 2; (my $escaped = $+{instance}) =~ s/(\.(:?[^*]|$))/$esc_seq$1/g; $_ = "$pre$escaped$post\n" }'
EOF
```

## Search for characters that are not indexed in GitHub issues

```Shell
git bug ls -f id | while read -r id; do git bug select "$id"; git bug show -f json > current.json; yq '.' -p json -o y current.json > "$(jq --raw-output '[.human_id, .status, .title|gsub("/"; "_")] | join(": ")' current.json).yml"; done; rm current.json
rg "%" -c
```
