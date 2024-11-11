#!/bin/bash

docker compose up -d

echo "Docker tunnel started. shutdown in 15m."

sleep 15m

echo "Timeout! Shuttin down tunnel.
protect your wallet..!"

docker compose down

echo "Shutdown complete"