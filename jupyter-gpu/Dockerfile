FROM sciberia/iris:latest
ARG TIMEZONE
ENV TZ="${TIMEZONE}"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ARG PASSWORD
ENV PSW="${PASSWORD}"
RUN jupyter notebook --generate-config
RUN python3 -c "from notebook.auth import passwd; print(passwd('$PSW'))" > /tmp/token
RUN export TOKEN=$(cat /tmp/token);echo "c.NotebookApp.password = u'$TOKEN'" >> /root/.jupyter/jupyter_notebook_config.py
CMD jupyter notebook --allow-root --no-browser --ip=0.0.0.0
