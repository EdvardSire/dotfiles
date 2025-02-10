#!/usr/bin/env bash

if [[ -z "$IN_NIX_SHELL" ]]; then
    exec nix-shell -p sqlite --run "bash $0 $@"
    exit  # Ensure the original script doesn't continue
fi

if [ -z "$SIOYEK_DB_DIR" ]; then
    echo "SIOYEK_DB_DIR is not set."
    exit 1
else
  if command -v sqlite3 &> /dev/null; then
    echo "no sqlite3, [nix-shell -p sqlite3]"
  fi

  find . -type f -name "*.pdf" -print0 | while IFS= read -r -d '' file; do
    real_path=$(realpath "$file")
    hash=$(md5sum "$file" | awk '{print $1}')

    sqlite3 "$SIOYEK_DB_DIR/local.db" <<EOF
      INSERT OR IGNORE INTO document_hash (path, hash)
      VALUES ('$real_path', '$hash');
EOF
    sqlite3 "$SIOYEK_DB_DIR/shared.db" <<EOF
      INSERT OR IGNORE INTO opened_books (path, zoom_level, offset_x, offset_y, last_access_time)
      VALUES ('$hash', 1.0, 0.0, 0.0, Null);
EOF

    echo "$real_path"
  done
fi


