{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./virtualisation
    ./greeter
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "warp";

  # Enable networking
  networking.wireless.iwd.enable = true;

  security.sudo.wheelNeedsPassword = false;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_CH.UTF-8";
    LC_IDENTIFICATION = "fr_CH.UTF-8";
    LC_MEASUREMENT = "fr_CH.UTF-8";
    LC_MONETARY = "fr_CH.UTF-8";
    LC_NAME = "fr_CH.UTF-8";
    LC_NUMERIC = "fr_CH.UTF-8";
    LC_PAPER = "fr_CH.UTF-8";
    LC_TELEPHONE = "fr_CH.UTF-8";
    LC_TIME = "fr_CH.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "ch";
    variant = "fr";
  };

  # Configure console keymap
  console.keyMap = "fr_CH";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.larguma = {
    isNormalUser = true;
    description = "larguma";
    extraGroups = [
      "wheel"
      "docker"
      "input"
      "users"
    ];
    shell = pkgs.fish;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.dconf.enable = true;
  programs.hyprland.enable = true;
  programs.fish.enable = true;
  programs.direnv.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  fonts.fontDir.enable = true;
  catppuccin.enable = true;

  security.rtkit.enable = true;
  security.pam.services.hyprlock = { };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
    };
  };
  hardware.bluetooth.powerOnBoot = true;
  hardware.pulseaudio.enable = false;
  services.blueman.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT1 = 40;
      STOP_CHARGE_THRESH_BAT1 = 80;

      TLP_PERSISTENT_DEFAULT = 1;

      CPU_SCALING_GOVERNOR_ON_AC = "performance";

      CPU_SCALING_MIN_FREQ_ON_AC = 400000;
      CPU_SCALING_MAX_FREQ_ON_AC = 4372000;
      CPU_SCALING_MIN_FREQ_ON_BAT = 400000;
      CPU_SCALING_MAX_FREQ_ON_BAT = 1800000;

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      CPU_HWP_DYN_BOOST_ON_AC = 1;

      PLATFORM_PROFILE_ON_AC = "performance";
    };
  };

  environment.variables = {
    NIXOS_OZONE_WL = "1";
    PATH = [
      "\${HOME}/.local/bin"
    ];
    NIXPKGS_ALLOW_UNFREE = "1";
  };

  #Garbage colector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # DO NOT CHANGE
  system.stateVersion = "24.11";

}
