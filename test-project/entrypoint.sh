#!/bin/sh

# Directory where allure results are stored
RESULTS_DIR="/tests/allure-results"

DEFAULT_PORT=8089
PORT=${ALLURE_PORT:-$DEFAULT_PORT}

# Check if the directory exists and delete it
if [ -d "$RESULTS_DIR" ]; then
  echo "Deleting existing Allure results directory..."
  rm -rf "$RESULTS_DIR"
fi

# Run Playwright tests
npm run test:chrome

echo "Playwright tests completed."

echo "Generating allure report"

npx allure serve allure-results -p $PORT
