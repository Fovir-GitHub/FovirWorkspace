encrypt input:
  ls ./machines/{{input}}/values/* | xargs -n 1 sops encrypt -i

decrypt input:
  ls ./machines/{{input}}/values/* | xargs -n 1 sops decrypt -i
