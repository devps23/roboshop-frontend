if [ -z "$REDIS_HOST" ]; then
  echo "REDIS_HOST not exists"
  exit 1
fi

if [ -z "$CATALOGUE_HOST" ]; then
  echo "CATALOGUE_HOST not exists"
  exit 1
fi

if [ -z "$CATALOGUE_PORT" ]; then
  echo "CATALOGUE_PORT not exists"
  exit 1
fi

node /app/server.js