# US Address Validator

## Introduction
This is a command-line program that validates a US address using the SmartyStreets US Address Verification API. The program will read input from a CSV file and output the original address and the corrected address or "Invalid Address" if the address cannot be validated.

### Example IO

Given a file with the following contents:

```
Street, City, Zip Code
143 e Maine Street, Columbus, 43215
1 Empora St, Title, 11111
```

The output should be:

```
143 e Maine Street, Columbus, 43215 -> 143 E Main St, Columbus, 43215-5370
1 Empora St, Title, 11111 -> Invalid Address
```

## Table of Contents
- [Getting Started](#getting-started)
- [Running the Program](#running-the-program)
- [Running Tests](#running-tests)
- [Thought Process](#thought-process)

## Getting Started
1. Clone the repository and `cd` to the project's root directory.
2. Install dependencies: `bundle install`.
3. Replace the placeholder API keys with your own API keys in `config.yml`.
4. Run the program as described in the [Running the Program](#running-the-program) section.
5. Run tests as described in the [Running Tests](#running-tests) section.

## Running the Program
Provide the file path as a command-line argument in the root directory: `ruby validator.rb input.csv`

The input format is CSV with the following fields: Street, City, and Zip Code.

## Running Tests
To run the test suite, execute the following command: `bundle exec rspec spec`.
To run a specific test file, execute the following command: `bundle exec rspec relative/path/to/file`

## Thought Process
The app can be broken down into roughly three concerns:
  1. Extracting addresses from the CSV file
  2. Validating addresses against the API
  3. Formatting and printing the validated addresses to the CLI

These three concerns will be managed by a mediator class, ValidatorApp, that simply manages the flow of data through the application.

#### Extracting addresses from the CSV file
The CSVReader class will be responsible for reading and returning data from the input CSV file. It will use Ruby's built-in CSV library to parse the CSV data into a collection of address objects.
#### Validating addresses against the API
Address validation can be broken down into two pieces: the APIClient class, and the AddressValidator class, which makes use of the APIClient to package data into an extendible format for the rest of the app. Separating the APIClient from the Validator class makes it easier to change or adjust both the API service and data format as the needs of the application evolve.
#### Formatting and printing the validated addresses to the CLI
The CLIWriter class is responsible for formatting and printing the output data to the console.

## Testing
The rspec gem will be used for testing. The test suite focuses on unit testing of individual classes, and also includes a few end-to-end integration tests. We will also use stubbing and mocking to prevent excessive API requests during testing.
