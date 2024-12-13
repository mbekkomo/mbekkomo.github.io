{ pkgs, ... }: {
  packages = with pkgs; [
    emmet-language-server
    vscode-langservers-extracted
    tailwindcss
    tailwindcss-language-server
    superhtml
    nodePackages.nodejs
    pnpm
  ];

  processes = {
    tailwindcss.exec = ''
      PATH+=:${pkgs.tailwindcss}/bin
      tailwindcss --input input.css --output output.css --watch
    '';
    serve.exec = ''
      pnpx live-server --no-browser --watch=index.html,output.css
    '';
  };
}
