# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    ];
  };

  boot = {
    loader.systemd-boot = {
      enable = true;
      edk2-uefi-shell.enable = true;
    };
    kernelParams = [
      "video=Virtual-1:1920x1080"
    ];
  };
  boot.loader.efi.canTouchEfiVariables = true;  # Wiki: https://nixos.wiki/wiki/Bootloader 

  virtualisation.hypervGuest.enable = true;
  # virtualisation.hypervGuest.videoMode = "1920x1080";  # PR: https://github.com/NixOS/nixpkgs/pull/372743

  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";

  networking.hostName = "nixos-vm";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.interfaces.eth0.ipv4.addresses = [{
    address = "10.43.96.100";
    prefixLength = 24;
  }];
  networking.defaultGateway = {
    address = "10.43.96.1";
    interface = "eth0";
  };
  networking.nameservers = [ "223.5.5.5" "119.29.29.29" ];
  # networking.proxy.default = "http://10.43.96.1:10809";

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
    };
  };

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  users.mutableUsers = false;
  users.users.root = {
    hashedPassword = "$6$0EVx1k/DSPJAG2sU$Ep3MBAdBaR5g0gR5HGID5hxQWO0CoaXILF3k00BRztmwteXXkaSrZBSyrvrQLxsV/BJNv7ya9aGt5tlGbYY9T0";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDH2IsQpivVqN77IOREN6dOPSWsICz8t+WsQ/r9zVmhjKuI5ghf7/n4M4UuXeu/29/8N2/v3GQOAUog5SsgIEoEiip5JQgYy6fM9Oy2FF7Adx4Wm+EBpit0WBER4Ve/l6cJjkwEwzv/TX+by9x8VcGWucXvU44TMgJlvyy2mzYIbCYo1pwEpjSMoLFy9ef9lwrzhUW5uuN0P3sTN714R4fose6LAzqM/OZQg+XCU+ow+V8deYbVb9vnFGZ1Gi5bG+yoTSfGIiyPx0XZm2CuGMigwQjiew88APmruwQnLomHaSTCWYeCU9kM0xj77X/a8SpP+y6gqH0Nqmv+zuKkQODCKMalsApbNpN38/PE6hToQLGVB6RtiehwvY+E9CGBFR04onddg+Pbgy9U9bQjgpS7rqE1c1Cz3SKCFypOyUCm79RBkpOUJukvxUVitDIrOMmSb5nmLnYP9p2QafesTMWCrsXj/yKrqaiAvztsIc5rxa9p8Xg36jLTu0xrOIIavLM= noele@DESKTOP-2BKL0DD"
    ];
  };
  users.users.noelemahcz = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    hashedPassword = "$6$50R828YktSCW/AHj$45wWtB..mRsPYN1pS0w0Uh.2BldZ0S1iRfIOawu4jDBjQRJp3sC.Zx/urk4dwbUhcvPwUqQTmTE.x84EN39nu/";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDH2IsQpivVqN77IOREN6dOPSWsICz8t+WsQ/r9zVmhjKuI5ghf7/n4M4UuXeu/29/8N2/v3GQOAUog5SsgIEoEiip5JQgYy6fM9Oy2FF7Adx4Wm+EBpit0WBER4Ve/l6cJjkwEwzv/TX+by9x8VcGWucXvU44TMgJlvyy2mzYIbCYo1pwEpjSMoLFy9ef9lwrzhUW5uuN0P3sTN714R4fose6LAzqM/OZQg+XCU+ow+V8deYbVb9vnFGZ1Gi5bG+yoTSfGIiyPx0XZm2CuGMigwQjiew88APmruwQnLomHaSTCWYeCU9kM0xj77X/a8SpP+y6gqH0Nqmv+zuKkQODCKMalsApbNpN38/PE6hToQLGVB6RtiehwvY+E9CGBFR04onddg+Pbgy9U9bQjgpS7rqE1c1Cz3SKCFypOyUCm79RBkpOUJukvxUVitDIrOMmSb5nmLnYP9p2QafesTMWCrsXj/yKrqaiAvztsIc5rxa9p8Xg36jLTu0xrOIIavLM= noele@DESKTOP-2BKL0DD"
    ];
  };

  environment.systemPackages = with pkgs; [
    curl
    git
    lf
  ];

  environment.etc = {
    lfrc = {
      target = "lf/lfrc";
      source = ./lfrc;
      enable = true;
    };
  };

  programs.vim.enable = true;
  programs.vim.defaultEditor = true;

  programs.hyprland.enable = true;

  environment.shellAliases = {
    sudo = "sudo ";
    ls = "ls -F --color=auto";
    ll = "ls -lh";
    la = "ll -A";
    nixosconf = "vim /etc/nixos/configuration.nix";
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

