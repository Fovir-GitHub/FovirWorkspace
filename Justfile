encrypt host:
  # Encrypt values of {{host}}.
  ls ./machines/{{host}}/values/* | xargs -n 1 sops encrypt -i

decrypt host:
  # Decrypt values of {{host}}.
  ls ./machines/{{host}}/values/* | xargs -n 1 sops decrypt -i

vm host:
  # Build a VM.
  just decrypt {{host}}
  nixos-rebuild build-vm --flake .#{{host}}
  just encrypt {{host}}

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
