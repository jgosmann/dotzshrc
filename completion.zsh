
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:*:open:*' ignored-patterns '*?.bib' '*?.aux' '*?.bbl' \
    '*?.bcf' '*?.blg' '*?.log' '*?.out' '*?.xml' '*?.synctex.gz' '*?.tex'

