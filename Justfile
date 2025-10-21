encrypt input:
  # Encrypt values of {{input}}.
  ls ./machines/{{input}}/values/* | xargs -n 1 sops encrypt -i

decrypt input:
  # Decrypt values of {{input}}.
  ls ./machines/{{input}}/values/* | xargs -n 1 sops decrypt -i

vm input:
  # Build a VM.
  just decrypt {{input}}
  nixos-rebuild build-vm --flake .#{{input}}
  just encrypt {{input}}
