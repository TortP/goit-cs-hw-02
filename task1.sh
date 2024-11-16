websites=("https://google.com" "https://facebook.com" "https://twitter.com")

log_file="website_status.log"

> "$log_file"

echo "Перевірка доступності вебсайтів..."

for website in "${websites[@]}"; do
  status_code=$(curl -s -o /dev/null -w "%{http_code}" -L "$website")

  if [ "$status_code" -eq 200 ]; then
    echo "$website is UP" | tee -a "$log_file"
  else
    echo "$website is DOWN" | tee -a "$log_file"
  fi
done

echo "Результати записані у файл: $log_file"
