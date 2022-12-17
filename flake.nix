{
  inputs = {
    nixpkgs.url =  "github:NixOS/nixpkgs/nixos-22.11";
   

  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let 
      supportedSystems = [ "x86_64-linux"  "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
      nixpkgsFor = system: nixpkgs.legacyPackages.${system};
    in {
      packages = forAllSystems (system:
         let pkgs = nixpkgsFor system; in rec {
          default = pkgs.stdenv.mkDerivation {
            
            pname = "docs-muvox-io";
            version = "0.1.2";
            src = ./.;
            buildInputs = [ pkgs.mkdocs pkgs.python310Packages.mkdocs-material ];
            buildPhase = ''
              ${pkgs.mkdocs}/bin/mkdocs build
            '';
            installPhase = ''
              cp -r site $out
            '';
          };
          serve = pkgs.writeShellScriptBin "serve" ''
            ${pkgs.ran}/bin/ran -r ${default}
          '';
         }
      );
    };
     
}
