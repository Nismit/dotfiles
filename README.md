# Dotfiles
Work in progress. Probably, all the files will be updated or removed.

## Note
Symbolic link Command Memo (Should be automation in this task)

```bash
cd dotfiles/
ln -nfs $HOME/.atom/config.cson config.cson
```

### Atom export/import packages Memo

Export
```bash
apm list --installed --bare > packages.txt
```

Import
```bash
apm install --packages-file packages.txt
```
### Atom Theme

UI / Syntax -> One Dark
