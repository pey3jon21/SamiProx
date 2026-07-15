# استفاده از تصویر پایه اوبونتو که دارای bash است
FROM ubuntu:22.04

# جلوگیری از سوالات تعاملی و تنظیم منطقه زمانی
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# نصب پیش‌نیازها (bash، curl، sudo و ابزارهای مورد نیاز)
RUN apt-get update && \
    apt-get install -y \
        bash \
        curl \
        sudo \
        tzdata \
        && \
    rm -rf /var/lib/apt/lists/*

# ایجاد پوشه کاری
WORKDIR /app

# دانلود و نصب ابزار MTProxyMax (اسکریپت اصلی)
RUN curl -fsSL https://raw.githubusercontent.com/SamNet-dev/MTProxyMax/main/mtproxymax.sh -o /usr/local/bin/mtproxymax && \
    chmod +x /usr/local/bin/mtproxymax

# افزودن مسیر به PATH
ENV PATH="/usr/local/bin:${PATH}"

# دستور پیش‌فرض برای اجرای bash (تا کنسول کار کند)
CMD ["bash"]
