# Cheat sheet

## Shell

```Shell
## Run a regex subsitution over all files in a git index and working directory but not symlinks to such files:

git ls-files -z "$(git rev-parse --show-toplevel)" | xargs --null -I '{}' find '{}' -type f -print0 | xargs --null sed --in-place --regexp-extended 's/23/42/g;'

```
