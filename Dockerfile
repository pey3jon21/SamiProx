FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN apt-get update && \
    apt-get install -y \
        bash curl sudo tzdata \
        && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN curl -fsSL https://raw.githubusercontent.com/SamNet-dev/MTProxyMax/main/mtproxymax.sh -o /usr/local/bin/mtproxymax && \
    chmod +x /usr/local/bin/mtproxymax
ENV PATH="/usr/local/bin:${PATH}"
# کپی فایل entrypoint به داخل کانتینر و قابل اجرا کردن آن
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# استفاده از entrypoint به عنوان دستور پیش‌فرض
ENTRYPOINT ["/entrypoint.sh"]
