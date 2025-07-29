#!/bin/bash

# Dotfiles installer script
# Creates hard links from home directory to dotfiles in this directory

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$HOME"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to create hard link
create_hardlink() {
    local source="$1"
    local target="$2"
    
    # Check if target already exists
    if [ -e "$target" ]; then
        # Check if it's already the same file (same inode)
        if [ "$source" -ef "$target" ]; then
            print_status "Already linked: $target"
            return 0
        else
            print_warning "File exists: $target"
            read -p "Do you want to replace it? (y/N): " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                rm "$target"
            else
                print_status "Skipping: $target"
                return 0
            fi
        fi
    fi
    
    # Create the hard link
    if ln "$source" "$target" 2>/dev/null; then
        print_status "Linked: $target -> $source"
    else
        print_error "Failed to link: $target"
        return 1
    fi
}

# Main installation
print_status "Starting dotfiles installation..."
print_status "Dotfiles directory: $DOTFILES_DIR"
print_status "Home directory: $HOME_DIR"
echo

# List of dotfiles to link
DOTFILES=(
    ".vimrc"
    ".gvimrc"
    ".tmux.conf"
    ".zshrc"
)

# Create hard links for each dotfile
for dotfile in "${DOTFILES[@]}"; do
    source_file="$DOTFILES_DIR/$dotfile"
    target_file="$HOME_DIR/$dotfile"
    
    if [ -f "$source_file" ]; then
        create_hardlink "$source_file" "$target_file"
    else
        print_warning "Source file not found: $source_file"
    fi
done

# Handle special cases
print_status "Setting up Karabiner configuration..."
KARABINER_CONFIG_DIR="$HOME_DIR/.config/karabiner"
if [ ! -d "$KARABINER_CONFIG_DIR" ]; then
    mkdir -p "$KARABINER_CONFIG_DIR"
    print_status "Created Karabiner config directory"
fi

if [ -f "$DOTFILES_DIR/karabiner.json" ]; then
    create_hardlink "$DOTFILES_DIR/karabiner.json" "$KARABINER_CONFIG_DIR/karabiner.json"
fi

# Handle vim plugins
print_status "Setting up vim configuration..."
VIM_DIR="$HOME_DIR/.vim"
if [ ! -d "$VIM_DIR" ]; then
    mkdir -p "$VIM_DIR"
    print_status "Created .vim directory"
fi

if [ -f "$DOTFILES_DIR/plugins.vim" ]; then
    create_hardlink "$DOTFILES_DIR/plugins.vim" "$VIM_DIR/plugins.vim"
fi

echo
print_status "Dotfiles installation completed!"
print_status "Note: Hard links were created, so editing files in either location will affect both."