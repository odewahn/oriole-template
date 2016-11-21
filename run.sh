#!/bin/sh
# Start nginx
nginx -c /etc/nginx/nginx.conf &
# Start watching for changes to ipynb files
ls *.ipynb | entr jupyter nbconvert \
  --NotebookApp.TemplateExporter.template_path=['./setup', '/opt/conda/lib/python3.5/site-packages/nbconvert/templates/html/'] \
  --to html \
  --template ./setup/parse-html.tpl \
  main.ipynb \
  &
  ROOT=/usr/workdir/ PORT=8001 APPROOT=/usr/satturn-editor/ bash -c '/usr/satturn-editor/api/api-linux'
  & 
  # Start the notebook
  jupyter notebook --NotebookApp.allow_origin='*' --no-browser --port 8888 --ip=*

