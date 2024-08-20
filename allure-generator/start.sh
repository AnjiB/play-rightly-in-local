#!/bin/bash

#Hard wait -> debug later
 sleep 30
# Wait for the playwright-tests service to generate allure-results
echo "Waiting for allure-results to be populated..."
while [ ! "$(ls -A /tests/allure-results)" ]; do
    sleep 5
done

echo "allure-results are available. Generating report..."
allure generate /tests/allure-results --clean -o /tests/allure-report
