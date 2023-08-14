{pkgs}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs;
    [
      nodejs
      yarn
    ]
    ++ lib.optionals stdenv.isLinux [
      inotify-tools
    ]
    ++ lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.CoreFoundation
      darwin.apple_sdk.frameworks.CoreServices
    ];
}
