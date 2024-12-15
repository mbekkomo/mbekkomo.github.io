{ pkgs, ... }:
let
  getPackageBin = x: ":${x}/bin";
in
{
  packages = with pkgs; [
    luajitPackages.lua
    luajitPackages.luarocks
  ];

  processes = {
    serve.exec = ''
      lapis serve
    '';
  };

  tasks = {
    "project:install-deps" = {
      exec = ''
        PATH+=${getPackageBin pkgs.m4}
        ./luarocks install --deps-only website-dev-1.rockspec \
          CRYPTO_INCDIR=${pkgs.openssl.dev}/include \
          CRYPTO_LIBDIR=${pkgs.openssl.out}/lib \
          OPENSSL_INCDIR=${pkgs.openssl.dev}/include \
          OPENSSL_LIBDIR=${pkgs.openssl.out}/lib
      '';
      before = [ "devenv:enterShell" ];
    };
  };
}
