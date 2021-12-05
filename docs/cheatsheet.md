# Cheat sheet

## Run a regex substitution over all files in a git index and working directory but not symlinks to such files:

```Shell
datalad run "git ls-files -z | xargs --null -I '()' find './()' -type f -print0 | xargs --null sed --in-place --regexp-extended 's/23/42/g;'"
```
