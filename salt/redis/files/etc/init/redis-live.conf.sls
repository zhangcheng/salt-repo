description "RedisLive web interface"

start on (net-device-up
          and local-filesystems
          and runlevel [2345])
stop on runlevel [!2345]

respawn
respawn limit 10 5

exec /sbin/start-stop-daemon --start --chuid redislive --chdir {{ dir }} --pidfile /var/run/redis-live.pid --make-pidfile --startas redis-live.py
