
#!/bin/bash
# نصب خودکار در اولین اجرا (اگر قبلاً نصب نشده باشد)
if [ ! -f /app/.installed ]; then
    echo "Running first-time installation..."
    mtproxymax install --non-interactive || true
    touch /app/.installed
fi
# اجرای خود پروکسی
exec mtproxymax start
