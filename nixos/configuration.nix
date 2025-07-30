{ inputs, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      pivner = import ../home/home.nix;
    };
  };

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    plymouth = {
      enable = true;
      theme = "deus_ex";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "deus_ex" ];
        })
      ];
    };
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    loader.timeout = 0;
    supportedFilesystems = [ "ntfs" ];
  };
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      enable = true;
    };
  };
  i18n.defaultLocale = "en_CA.UTF-8";
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      videoDrivers = [ "amdgpu" ];
    };
    displayManager.sddm = {
      enable = true;
      theme = "${import ../splash/sddm-theme.nix {inherit pkgs;}}";
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
    mpd = {
      enable = true;
      user = "pivner";
      musicDirectory = "/home/pivner/Music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "pipewire"
        }
        auto_update "yes"
        restore_paused "yes"
      '';
    };
    pulseaudio = {
      enable = false;
    };
    input-remapper = {
      enable = true;
    };
    automatic-timezoned.enable = true;
    geoclue2.geoProviderUrl = "https://api.beacondb.net/v1/geolocate";
    printing.enable = true;
    mullvad-vpn.enable = true;
  };
  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000";
  };
  hardware = {
    graphics.enable = true;
    graphics.enable32Bit = true;
  };
  security.rtkit.enable = true;

  programs = {
    zsh.enable = true;
    hyprland.enable = true;
  };
  environment.variables.EDITOR = "nvim";
  environment.pathsToLink = [ "/share/zsh"];
  users.groups.libvirtd.members = [ "pivner" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  users.users.pivner = {
    isNormalUser = true;
    description = "pivner";
    extraGroups = [ "networkmanager" "wheel" "audio" "kvm" "adbusers" ];
    packages = with pkgs; [
      home-manager
    ];
    shell = pkgs.zsh;
  };
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    i2c-tools
    hyprpaper
    calcure
    #    temurin-jre-bin-8
    temurin-jre-bin-23
    prismlauncher
    legcord
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg
    taskwarrior3
    libqalculate
    ffmpeg
    typescript
    nodejs
    puddletag
    virt-manager
    qemu
    wine
    lutris
    geckodriver
    input-remapper
    android-studio
    android-tools
  ];
  # i2c for https://github.com/mohamed-badaoui/asus-touchpad-numpad-driver
  hardware.i2c.enable = true;
  systemd.services.asus-touchpad-numpad = {
    description = "Activate Numpad inside the touchpad with top right corner switch";
    documentation = [ "https://github.com/mohamed-badaoui/asus-touchpad-numpad-driver" ];
    path = [ pkgs.i2c-tools ];
    script = ''
      cd ${pkgs.fetchFromGitHub {
        owner = "mohamed-badaoui";
        repo = "asus-touchpad-numpad-driver";
        # These needs to be updated from time to time
        rev = "d80980af6ef776ee6acf42c193689f207caa7968";
        sha256 = "sha256-JM2wrHqJTqCIOhD/yvfbjLZEqdPRRbENv+N9uQHiipc=";
      }}
      # In the last argument here you choose your layout.
      ${pkgs.python3.withPackages(ps: [ ps.libevdev ])}/bin/python asus_touchpad.py ux433fa
    '';
    # Probably needed because it fails on boot seemingly because the driver
    # is not ready yet. Alternatively, you can use `sleep 3` or similar in the
    # `script`.
    serviceConfig = {
      RestartSec = "1s";
      Restart = "on-failure";
    };
    wantedBy = [ "multi-user.target" ];
  };
  system.stateVersion = "24.11"; # Did you read the comment?

}
