#/bin/sh

[ -n "$SUPERVISOR_PATH" ] && cp -rf "$SUPERVISOR_PATH/*" "/etc/supervisor.d";
/usr/bin/supervisord
