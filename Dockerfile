FROM alpine:latest

# نصب پیش‌نیازها
RUN apk add --no-cache bash curl sudo

# تنظیم پوشه کاری
WORKDIR /app

# کپی کردن فایل‌های پروژه به داخل کانتینر
COPY . .

# قابل اجرا کردن فایل‌های اسکریپت
RUN chmod +x install.sh mtproxymax.sh

# دستوری که هنگام اجرای کانتینر اجرا می‌شود
CMD ["bash", "mtproxymax.sh"]
