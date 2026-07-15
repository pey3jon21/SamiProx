#!/bin/bash
# این اسکریپت کانتینر را همیشه فعال نگه می‌دارد
echo "Starting MTProxyMax..."
# اجرای پروکسی به عنوان فرآیند اصلی
exec mtproxymax start
