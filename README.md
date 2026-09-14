# Xentryx
**Automated project health checks for your Flutter CI pipeline**

Xentryx is a GitHub action designed to analyze a Flutter project from multiple angles, run diagnostics, identify problems, and report the results directly in your GitHub actions workflow
## What it does
Xentryx performs a series of automated checks and reports the results without stopping at the first failure.
Currently, it checks:
- **Environment**: Verifies the development environment with diagnostic checks
- **Dependencies**: Resolves project dependencies
- **Static analysis**: Detects code issues and warnings
- **Tests**: Runs the project's test suite
- **Summary**: Reports all failed checks at the end
If a check fails, it preserves the tool's diagnostic output so you can see **what went wrong and where to fix it**
## Usage
Add Xentryx to your GitHub actions workflow:
```yml
name: Project analysis
on:
  push:
  pull-request:

jobs:
  analyzer:
    runs-on: ubuntu-latest
    steps:
      - name: Repo checkout
        uses: actions/checkout@v4
      - name: Run Xentryx
        uses: neal-core/Xentryx@v1
```
## Example output
```txt
Running Flutter checks...

Checking Flutter Environment
Flutter is installed and configured properly

Getting dependencies...
Dependencies fetched successfully

Analyzing Dart Code...
Dart code analysis failed. Please fix the issues reported by the analyzer.

Running Tests...
Tests Failed. Please fix the failing tests

=========================================
Analysis completed with 2 check(s) failed
```
It continues running its checks even when one fails, giving you a complete picture of the project's current state.
## Why Xentryx
Traditional CI workflows can stop as soon as a command fails, forcing developers to repeatedly fix one problem at a time.
Xentryx takes a different approach:
**Run everything. Report everything. Fix everything**
The goal is to make CI failures more informative and reduce the feedback loop between finding a problem and fixing it.
## Built with
- GitHub Actions
- Bash
- YAML
- Project-specific development tooling
## Project Status
Xentryx is currently under active development. More checks, configuration options, and reporting features will be added overtime
## License
MIT License
