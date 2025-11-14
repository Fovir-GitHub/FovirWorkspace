valuePath=(./machines/*/values/* ./modules/values/*)
keywords=("data" "sops" "age" "lastmodified" "mac")

for f in "${valuePath[@]}"; do
    [[ ! -f "$f" ]] && continue

    match=0
    for k in "${keywords[@]}"; do
        grep -q "$k" "$f" || match=1
    done
    [[ $match -eq 1 ]] && echo "$f"
done
