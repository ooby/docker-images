FROM sciberia/jupyter:latest
ARG TIMEZONE
ENV TZ="${TIMEZONE}"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ARG PASSWORD
ENV PSW="${PASSWORD}"
RUN echo "c.NotebookApp.password = u'$PSW'" >> /root/.jupyter/jupyter_notebook_config.py
CMD jupyter notebook --allow-root --no-browser --ip=0.0.0.0