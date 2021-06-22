{ lib, buildGoModule, fetchFromGitHub, src, version }:

buildGoModule rec {
  pname = "micromdm";

  inherit src version;

  vendorSha256 = "sha256-voshHQjUAK13rfjEyH8ClpBBmV+vBBGnphn5Z1gUVjE=";

  runVend = true;

  meta = with lib; {
    description = "Mobile Device Management server";
    homepage = "https://micromdm.io";
    license = licenses.mit;
    platforms = platforms.linux ++ platforms.darwin;
    hydraPlatforms = platforms.linux;
  };
}
