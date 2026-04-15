# dotfiles

Source of truth for my dotfiles. Edit only in this repository checkout, typically under `$(ghq root)/github.com/01-mu/dotfiles`.
macOS is managed with `nix-darwin` plus `home-manager`.
Prereq: Nix with flakes enabled.

## Apply on macOS

```shell
cd "$(ghq root)/github.com/01-mu/dotfiles"
```

First switch:

```shell
./scripts/bootstrap/mac.sh
```

Later switches:

```shell
darwin-rebuild switch --flake .#01-mu
```

`home-manager` is wired through the Darwin configuration, so one switch applies both system settings and user dotfiles.
The package policy is split by responsibility:

- [`nix/modules/home/packages.nix`](nix/modules/home/packages.nix): minimal global CLI tooling managed by Nix.
- [`nix/modules/darwin/homebrew.nix`](nix/modules/darwin/homebrew.nix): GUI apps and macOS-specific exceptions managed by Homebrew casks.
- Project repositories: language runtimes, build tools, and framework dependencies via `devShell`s.

## Package policy

Global packages are intentionally minimal. Keep only navigation and workflow tools such as `git`, `gh`, `ghq`, `fzf`, `ripgrep`, `zoxide`, and `direnv` in Home Manager.

Do not install language runtimes like `node` globally. Do not keep build libraries such as `autoconf`, `m4`, `pkgconf`, `gettext`, `openssl`, `icu4c`, or media stacks like `ffmpeg`, `x264`, `x265`, `lame`, and `opus` in Homebrew. Put them in per-repository flakes instead.

Homebrew should stay limited to GUI applications and a few host-specific exceptions like `docker-desktop`.

## Project devShell example

Use a repo-local `flake.nix` to define runtimes and build inputs close to the project:

```nix
{
  description = "example project shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          nodejs_22
          pnpm
          python312
          pkg-config
          openssl
        ];
      };
    };
}
```

Recommended repository layout:

- `flake.nix`: project shell entry point.
- `nix/devshells/default.nix`: shared shell definition when the project grows.
- `nix/packages/`: reusable package fragments for large repositories.
- `.envrc`: `use flake` so `direnv` loads the shell automatically.

## Layout

- `home/` mirrors files that land in `$HOME`, such as `.zshrc`, `.vimrc`, and `.config/...`.
- `nix/` contains the Nix modules used by `flake.nix`.
- `codex/` keeps Codex-specific policies, prompts, rules, and skills.
- `vscode/` keeps editor metadata such as `extensions.txt`.
- `windows/` keeps Windows-specific setup files.

## ghq

```shell
ghq get https://github.com/OWNER/REPO
ghq list
```

This repo manages the `ghq` config too. The root is `~/ghq`, so GitHub repositories are stored under `~/ghq/github.com/OWNER/REPO`.

Clone with `ghq get`, then move to a repo under `$(ghq root)`.

## Codex

### Safe wrapper

```shell
export PATH="$HOME/.codex/bin:$PATH"
```

```shell
codex-safe
```

Optional checks:

```shell
codex execpolicy check --pretty --rules ~/.codex/rules/policy-deny.rules -- sudo ls
sandbox-exec -f ~/.codex/sandbox/deny-secrets.sb cat .env
```

## mac bootstrap

```shell
./scripts/bootstrap/mac.sh
```

Windows: see `windows/README.md`.
