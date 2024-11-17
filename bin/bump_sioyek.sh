#!/usr/bin/env bash

DB_DIR=$SIOYEK_DB_DIR
if [ -z "$SIOYEK_DB_DIR" ]; then
    echo "SIOYEK_DB_DIR is not set."
    exit 1
else

  find . -type f -name "*.pdf" -print0 | while IFS= read -r -d '' file; do
    real_path=$(realpath "$file")
    hash=$(md5sum "$file" | awk '{print $1}')

    sqlite3 "$DB_DIR/local.db" <<EOF
      INSERT OR IGNORE INTO document_hash (path, hash)
      VALUES ('$real_path', '$hash');
EOF
    sqlite3 "$DB_DIR/shared.db" <<EOF
      INSERT OR IGNORE INTO opened_books (path, zoom_level, offset_x, offset_y, last_access_time)
      VALUES ('$hash', 1.0, 0.0, 0.0, Null);
EOF
  

    echo "$real_path"
  done
fi


