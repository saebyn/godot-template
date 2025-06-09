# Testing Documentation

This project uses [Gut](https://github.com/bitwes/Gut) for unit testing Godot code.

## Running Tests

### Locally
To run tests locally, you need Godot 4.4.1 installed:

```bash
# Run all tests
./test_runner.sh

# Or run tests directly with Gut
godot --headless -s addons/gut/gut_cmdln.gd -gexit
```

### In Editor
1. Open the project in Godot
2. Go to Project -> Tools -> Gut
3. Click "Run All" to execute tests

## Test Structure

Tests are located in the `test/unit/` directory and follow the naming convention `test_*.gd`.

### Current Tests
- `test_game_manager.gd` - Tests for the GameManager singleton
- `test_main.gd` - Tests for main scene functionality  
- `test_menu.gd` - Tests for menu UI functionality

## Writing Tests

Tests extend `GutTest` and use assertions like:
- `assert_eq(actual, expected, message)`
- `assert_true(condition, message)`
- `assert_not_null(object, message)`

Example:
```gdscript
extends GutTest

func test_something():
    var result = some_function()
    assert_eq(result, expected_value, "Function should return expected value")
```

## CI/CD

Tests run automatically on push/PR via GitHub Actions in the "Code Checks and Tests" workflow.