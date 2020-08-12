# Install VSCode Extensions
# code --install-extension coenraads.bracket-pair-colorizer-2
# code --install-extension editorconfig.editorconfig
# code --install-extension dbaeumer.vscode-eslint
# code --install-extension oderwat.indent-rainbow
# code --install-extension slevesque.shader

# Symbolic Link
DOTPATH=~/.dotfiles/vscode; export DOTPATH
VSCODE_PATH=$HOME/Library/Application\ Support/Code/User; export VSCODE_PATH

for f in "$VSCODE_PATH"/*;
do
    [[ "$f" == "$VSCODE_PATH/globalStorage" ]] && continue
    [[ "$f" == "$VSCODE_PATH/snippets" ]] && continue
    [[ "$f" == "$VSCODE_PATH/workspaceStorage" ]] && continue

    # Check Symbolic Link
    # If the files have already symbolic linked
    # this state will be true
    if [ ! -L "$f" ]; then
        # echo `basename "$f"`;
        # echo "$DOTPATH/`basename "$f"`"
        echo "Make Backup..."
        command mv "$f" "$f.bak"
        command ln -snf "$DOTPATH/`basename "$f"`" "$VSCODE_PATH/"
    fi
done
