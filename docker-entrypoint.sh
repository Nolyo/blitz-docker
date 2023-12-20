#!/bin/sh

echo "Prisma migrations and starting Blitz app..."
MIGRATION_DIR="/app/db/migrations"

if [ "$NODE_ENV" = "production" ]; then
  blitz prisma migrate deploy
  blitz start
else
  if find $MIGRATIONS_DIR -mindepth 1 ! -name '.keep' | read; then
    blitz prisma migrate dev
  else
    blitz prisma migrate dev --name init
  fi
  blitz dev
fi