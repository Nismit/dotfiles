# Install VSCode Extensions
vscode_install_extensions() {
    code --install-extension coenraads.bracket-pair-colorizer-2
    code --install-extension editorconfig.editorconfig
    code --install-extension dbaeumer.vscode-eslint
    code --install-extension oderwat.indent-rainbow
    code --install-extension slevesque.shader
}

# Symbolic Link
DOTPATH=~/.dotfiles/vscode; export DOTPATH
VSCODE_PATH=$HOME/Library/Application\ Support/Code/User; export VSCODE_PATH

vscode_config_install() {
    for f in "$VSCODE_PATH"/*;
    do
        [[ "$f" == "$VSCODE_PATH/globalStorage" ]] && continue
        [[ "$f" == "$VSCODE_PATH/snippets" ]] && continue
        [[ "$f" == "$VSCODE_PATH/workspaceStorage" ]] && continue

        if [ ${f##*.} = "json" ]; then
            echo "Make Backup..."
            command mv "$f" "$f.bak"
        fi
        command ln -snf "$DOTPATH/`basename "$f"`" "$VSCODE_PATH/"
    done
}

if [ ! -L "$VSCODE_PATH/keybindings.json" ]; then
    vscode_config_install
    vscode_install_extensions
else
    echo "Settings Already Linked!"
fi
