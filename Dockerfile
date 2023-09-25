FROM nginx:1.12

ENV USER=appuser
ENV UID=1001

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/bin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    "${USER}"

COPY ./app/ /app
ADD custom.conf /etc/nginx/conf.d/

EXPOSE 8000

CMD ["nginx", "-g", "daemon off;"]

