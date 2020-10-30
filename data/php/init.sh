#/bin/sh

[ -n "$SUPERVISOR_PATH" ] && cp -rf "$SUPERVISOR_PATH" "/etc";
/usr/bin/supervisord
