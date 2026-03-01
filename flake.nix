{
  description = "Dotfiles development shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { nixpkgs, ... }: {
    devShells.aarch64-darwin.default =
      let
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          config.allowUnfree = true;
        };
      in
      pkgs.mkShell {
        packages = with pkgs; [
          jdk21
          nodejs_22
          pnpm
          python3
          rustup
          terraform
          zoxide
        ];
      };

    devShells.x86_64-darwin.default =
      let
        pkgs = import nixpkgs {
          system = "x86_64-darwin";
          config.allowUnfree = true;
        };
      in
      pkgs.mkShell {
        packages = with pkgs; [
          jdk21
          nodejs_22
          pnpm
          python3
          rustup
          terraform
          zoxide
        ];
      };
  };
}
