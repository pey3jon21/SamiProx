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

# ایجاد یک فایل لاگ برای ذخیره خروجی
RUN touch /var/log/mtproxymax.log

# اجرای پروکسی به عنوان فرآیند اصلی (دائمی)
CMD ["sh", "-c", "mtproxymax start > /var/log/mtproxymax.log 2>&1"]
