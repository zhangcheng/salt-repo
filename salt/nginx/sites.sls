include:
  - nginx

/etc/nginx/sites-available:
  file.recurse:
    - source: salt://nginx/conf/sites-available

/etc/nginx/sites-enabled/mmb-static:
  file.symlink:
    - target: ../sites-available/mmb-static

/etc/nginx/sites-enabled/stub-status:
  file.symlink:
    - target: ../sites-available/stub-status
