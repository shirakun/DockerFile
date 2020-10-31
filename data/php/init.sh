#/bin/sh

[ -n "$SUPERVISOR_PATH" ] && cp -rf "$SUPERVISOR_PATH" "/etc";
[ -n "$CRON_FILE" ] && cat "$CRON_FILE" >> "/etc/crontabs/root";
/usr/bin/supervisord
