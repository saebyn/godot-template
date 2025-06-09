# godot-template

This is a template for Godot projects. It includes a basic structure and some common files to help you get started quickly.

## Features

- Pre-configured project structure for Godot 4.4.1
- Unit testing setup with [Gut](https://github.com/bitwes/Gut)
- GitHub Actions workflows for CI/CD (builds and tests)
- Basic UI components (menus, settings)
- Audio bus layout
- Input remapping system

## Template Structure

```
.
├── .gitignore
├── .github
│   └── workflows
│       ├── godot-ci.yml     # GitHub Actions for builds
│       └── code-checks.yml  # GitHub Actions for tests/lint
├── addons
│   └── gut                  # Unit testing framework
├── assets                   # Binary assets
│   ├── fonts
│   ├── images
│   ├── models
|   └── music
│   ├── sounds
│   └── textures
├── materials
│   └── shaders
├── scenes                   # Godot scenes
│   ├── game.tscn
│   └── main.tscn
├── scripts
│   ├── gamemanager.gd
│   └── main.gd
├── test                     # Unit tests
│   ├── unit
│   │   ├── test_game_manager.gd
│   │   ├── test_main.gd
│   │   └── test_menu.gd
│   └── README.md
├── theme                    # Theme files for UI
│   └── theme.tres
├── ui                       # User Interface components
│   ├── ...
│   └── menu.tscn
├── .gutconfig.json          # Gut test configuration
├── test_runner.sh           # Script to run tests
├── LICENSE
├── README.md
├── bus_layout.tres          # Bus layout for audio
└── project.godot
```

## Testing

This project includes unit testing with Gut. See [test/README.md](test/README.md) for details on running and writing tests.

```bash
# Run tests locally
./test_runner.sh
```

