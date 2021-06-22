{
  description = "Mobile Device Management server";

  inputs = {
    utils.url = "github:kreisys/flake-utils";
    src.url = "github:micromdm/micromdm";
    src.flake = false;
  };

  outputs = { self, utils, nixpkgs, src }: utils.lib.simpleFlake {
    inherit nixpkgs;
    systems = [ "x86_64-linux" "x86_64-darwin" ];

    overlay = final: prev: {
      micromdm = final.callPackage self { inherit src; version = src.shortRev; };
    };

    packages = { micromdm }: {
      inherit micromdm;
      defaultPackage = micromdm;
    };

    hydraJobs = { micromdm }: {
      inherit micromdm;
    };
  };
}
