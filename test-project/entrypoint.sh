#!/bin/sh

JAVA_PATH=$(dirname $(dirname $(readlink -f $(which java))))
export JAVA_HOME=$JAVA_PATH
export PATH=$JAVA_HOME/bin:$PATH

# Directory where allure results are stored
RESULTS_DIR="/tests/allure-results"

DEFAULT_PORT=8089
PORT=${ALLURE_PORT:-$DEFAULT_PORT}
BROWSER=${BROWSER:-chromium}

# Check if the directory exists and delete it
if [ -d "$RESULTS_DIR" ]; then
  echo "Deleting existing Allure results directory..."
  rm -rf "$RESULTS_DIR"
fi

# Run Playwright tests
npm run test:$BROWSER

echo "Playwright tests completed."

echo "Generating allure report"

npx allure serve allure-results -p $PORT
