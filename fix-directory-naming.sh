#!/bin/bash

# Recursively rename all subfolders in a given directory from
# "Title Case With Spaces & Special@Chars!" to "kebab-case",
# at any depth.
# Usage: ./rename_folders.sh [path]

input_path="${1:-.}"
target_dir=$(realpath "$input_path" 2>/dev/null)

if [ -z "$target_dir" ] || [ ! -d "$target_dir" ]; then
    echo "Error: '$input_path' is not a valid directory."
    exit 1
fi

echo "Resolved path: $target_dir"

sanitize() {
    local name="$1"
    echo "$name" \
        | tr '[:upper:]' '[:lower:]' \
        | tr ' ' '-' \
        | sed -E 's/[^a-z0-9-]+//g' \
        | sed -E 's/-+/-/g' \
        | sed -E 's/^-+|-+$//g'
}

# -depth processes deepest folders first, so renaming a parent
# doesn't break the path to its children mid-loop.
find "$target_dir" -depth -type d | while IFS= read -r old_path; do
    # Skip the root folder itself
    [ "$old_path" = "$target_dir" ] && continue

    parent_dir=$(dirname "$old_path")
    base_name=$(basename "$old_path")
    new_base=$(sanitize "$base_name")

    # Fallback in case sanitizing strips everything
    if [ -z "$new_base" ]; then
        new_base="unnamed"
    fi

    if [ "$base_name" != "$new_base" ]; then
        new_path="$parent_dir/$new_base"

        # Avoid collisions if target already exists
        if [ -e "$new_path" ]; then
            echo "Skipped (target exists): '$old_path' -> '$new_path'"
            continue
        fi

        mv -- "$old_path" "$new_path"
        echo "Renamed: '$old_path' -> '$new_path'"
    fi
done
