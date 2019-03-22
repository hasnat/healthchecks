FROM python:3

COPY requirements.txt /tmp
RUN pip install --no-cache-dir -r /tmp/requirements.txt

RUN groupadd -g 999 appuser && \
    useradd -r -u 999 --home /opt/healthchecks -g appuser appuser
WORKDIR /opt/healthchecks
RUN chown appuser:appuser .
USER appuser
COPY --chown=appuser:appuser . .

EXPOSE 8000

ENTRYPOINT "./entrypoint.sh"

LABEL io.portainer.commands.createsuperuser="./manage.py createsuperuser"
LABEL io.portainer.commands.prunepings="./manage.py prunepings"
LABEL io.portainer.commands.prunechecks="./manage.py prunechecks"
LABEL io.portainer.commands.prunenotifications="./manage.py prunenotifications"
LABEL io.portainer.commands.pruneusers="./manage.py pruneusers"