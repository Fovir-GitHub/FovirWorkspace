encrypt host:
  # Encrypt values of {{host}}.
  ls ./machines/{{host}}/values/* | xargs -n 1 sops encrypt -i

decrypt host:
  # Decrypt values of {{host}}.
  ls ./machines/{{host}}/values/* | xargs -n 1 sops decrypt -i

vm host:
  git add --all
  nixos-rebuild build-vm --flake .#{{host}}
  git restore --staged .

commit-values host:
  # Commit values automatically.
  git add ./machines/{{host}}/values
  git commit -m "chore: Encrypt values."

install host target:
  # Install machine {{host}} to {{target}}.
  clan machines install {{host}} --target-host {{target}}

update host:
  # Update machine configuration.
  just decrypt {{host}}
  git add --all
  clan machines update {{host}}
  git restore --staged .
  just encrypt {{host}}
  just commit-values {{host}}

format:
  # Use alejandra and deadnix to format code
  deadnix -e
  alejandra .

dry-build host:
  # Check whether configurations are valid.
  git add --all
  nix eval .#nixosConfigurations.{{host}}.config.system.build.toplevel
  nixos-rebuild dry-build --flake .#{{host}}
  git restore --staged .
