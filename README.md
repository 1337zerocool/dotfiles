# Dotfiles

These are Dotfiles intended for use on a Macbook running macOS 14 or later.

## Prequisits

  * [Kitty](https://github.com/kovidgoyal/kitty) terminal emulator
  * [Github](https://github.com/cutehax0r) account

# Setup SSH

Setup SSH to access remote systems by placing SSH keys into an appropriate directory
and then adding them to keychain access.

1. Create a director to store ssh keys `mkdir -p ~/.ssh/`
2. Set permissions for the ssh folder to owner read/write/list with `chmod 0700 ~/.ssh`

## Setting up existing keys

Starting with the assumption that the name of the key is `SSH Keys: Foo` in Keychain or
Bitwarden you should copy the contents of the keys to disk.

Copy the ssh keys from either:
  1. Keychain: Use the iCloud Keychain and look under "Secure Notes" for "SSH Keys"
  2. Bitwarden: Look under "Secure Notes" for "SSH Keys"

Copy the private key from Bitwarden or Keychain into `~/.ssh/id_foo`. Change the private
key permissions to owner read/write only with `chmod 0600 ~/.ssh/id_foo`.

Copy the public key from Bitwarden or Keychain into `~/.ssh/id_foo.pub`. Change the public
key permissions to owner read/write and group/world to read only with
`chmod 0644 ~/.ssh/id_foo.pub`.

Then for each key that has been copied to the ssh folder add it to ssh-agent with
`ssh-add --apple-use-keychain ~/.ssh/id_foo`. You will need the password for the key
from Keychain or Bitwarden only once. After that it will be stored in Keychain and
unlocked at login.

## Generating new keys

To cycle keys

1. Generate a new 'private email address' if appropriate
2. Generate a new password
3. Run `ssh-keygen` to generate new keys by answering the questions
   ```sh
   sh-keygen -t ed25519 -o -a 100 -C foo@example.com
   ```
4. Move the `id_foo` and `id_foo.pub` files to `~/.ssh`
5. Ensure `~/.ssh` is chmod 0700
6. Ensure `id_foo` is chmod 0600
7. Ensure `id_foo.pub` is chmod 0644
8. Add the updated keys to Bitwarden and MacOS Keychain
9. Add the keys to SSH agent
   ```sh
   ssh-add --apple-use-keychain ~/.ssh/id_foo
   ```

# Homebrew

Setup [Homebrew](https://brew.sh/) and use it to install software. The installation process is

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Temporarily enable Homebrew to install some additional packages start by sourcing the shell script
`eval "$(/opt/homebrew/bin/brew shellenv)"`. This will only last through the current terminal
session. The ZSH configuration will automatically do this once it's setup.

## Homebrew packages

A number of Homebrew packages are expected to be installed. These add to or update the default
macOS command line interface. The quickest way to install these is with a single command:

```sh
brew install coreutils fzf gawk gh git grep gsed jq neovim openssh openssl pup ripgrep sqlite tree-sitter wget zsh zsh-autosuggestions zsh-fast-syntax-highlighting
```
Then add some programming language specific packages:
  * Ruby: `brew install chruby ruby-install`
  * Python: `brew install python3`
  * Node: `brew install node deno`

Once those packages are installed some additional work may be required. For
example, Neovim expects Packer to be available. Ruby should have gems like Pry
available globally.

## MacOS Software

Not all software is installed by homebrew. Those additional packages include:

  * Affinity Designer 2
  * Affinity Photo 2
  * Affinity Publisher 2
  * Alfred 5
  * Bitwarden
  * Blackmagic ATEM
  * Kitty Terminal
  * Little Snitch
  * Microsoft Excel
  * Microsoft PowerPoint
  * Microsot Word
  * Omnigraffle
  * qFlipper
  * RapidAPI
  * Screenflick
  * Slack
  * Spotify
  * The Unarchiver
  * UTM
  * Visual Studio Code
  * VLC
  * Wipr
  * Xcode

Browser plugins are also expected:

  * Bitwarden
  * Ublock Origin

Install some nice fonts:

  * Cartograph
  * Firacode
  * Operator
  * Source Code Pro

Swap out the mac user icon