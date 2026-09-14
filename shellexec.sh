#!/bin/bash

echo "Running Flutter Checks..."
echo
echo "Checking Flutter Environment..."
failures=0
flutter doctor
status=$?

if [ $status -ne 0]; then
    echo "Flutter is not installed or not configured properly. Please install Flutter and set up your environment."
    failures=$((failures + 1))
else
    echo "Flutter is installed and configured properly."
fi

echo
echo "Getting Dependencies..."
flutter pub get


status=$?
if [ $status -ne 0 ]; then
    echo "Failed to get dependencies. Please check your pubspec.yaml file and try again."
    failures=$((failures + 1))
else
    echo "Dependencies fetched successfully."
fi

echo "Analyzing Dart Code..."
flutter analyze
status=$?
if [ $status -ne 0 ]; then
    echo "Dart code analysis failed. Please fix the issues reported by the analyzer."
    failures=$((failures + 1))
else
    echo "Dart code analysis passed successfully."
fi

echo "Running Tests..."
flutter test
status=$?
if [ $status -ne 0 ]; then
    echo "Tests failed. Please fix the failing tests."
    failures=$((failures + 1))
else
    echo "All tests passed successfully."
fi

if [$failures -eq 0]; then
    echo "All checks passed successfully."
    exit 0
else
    echo "$failures checks failed. Please fix the issues and try again."
    exit 1
fi