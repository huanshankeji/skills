#!/bin/sh
p=huanshankeji-skills
cd "$(dirname "$0")" || exit
zip -r -FS "$OLDPWD/$p.zip" plugin.json .codex-plugin skills LICENSE
