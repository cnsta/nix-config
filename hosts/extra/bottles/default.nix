{pkgs, ...}: {
  environment.systemPackages = [pkgs.bottles-unwrapped];
}
