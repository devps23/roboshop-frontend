if [ -z "$REDIS_HOST" ]; then
  echo REDIS_HOST not exists
  exit 1
fi

if [ -z "$MONGO_URL" ]; then
  echo MONGO_URL not exists
  exit 1
fi

node /app/server.js