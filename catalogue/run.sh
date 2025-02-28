if [ -z "$MONGO_URL" ]; then
  echo "MONGO_URL not exist"
  exit 1
fi

node /app/server.js



# need to write documentation for catalogue