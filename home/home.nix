{ inputs, ... }:

{
  imports = [
    ../modules/default.nix
    inputs.nixvim.homeManagerModules.nixvim
  ];
  fonts.fontconfig.enable = true;
  home = {
    username = "pivner";
    homeDirectory = "/home/pivner";
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.11";
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
  programs.home-manager.enable = true;
}
