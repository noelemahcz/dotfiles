{
  inputs.nixpkgs.url = "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git?shallow=1&ref=nixos-24.11";
  outputs = { self, nixpkgs }: {
    nixosConfigurations.nixos-vm = nixpkgs.lib.nixosSystem {
      modules = [ ./configuration.nix ];
    };
  };
}
