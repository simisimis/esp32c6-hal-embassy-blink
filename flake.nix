{
  description = "A development shell for `esp32c6-hal-embassy-blink`";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };

      in
      with pkgs;
      {
        devShells.default = mkShell {
          buildInputs = [
            # rust ESP tools
            cargo-generate
            cargo-espflash
            just

            rust-bin.stable.latest.default
          ];

          shellHook = ''
            cat <<EOF
            Welcome to the ❄️ `esp32c6-hal-embassy-blink` development shell.

            $(just -l |sed 's/^Available recipes:/The following `just` recipes are available:/')
            EOF
            user_shell=$(getent passwd "$(whoami)" |cut -d: -f 7)
            exec "$user_shell"
          '';
        };
      }
    );
}
