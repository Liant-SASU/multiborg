# MultiBorg

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

MultiBorg is a secure backup tool using Borg to manage multiple repositories. It facilitates the management of secure and deduplicated backups for multiple sites or services using BorgBackup, providing a simple interface to automate and monitor backup processes.

## Features

- Secure and deduplicated backups using Borg.
- Simple interface for managing multiple backup repositories.
- Automated backup processes with monitoring capabilities.

## Installation

To install MultiBorg, you can use RubyGems:

```sh
gem install multiborg
```

Alternatively, you can build it from source:

Clone the repository:

```sh
git clone https://github.com/Liant-SASU/multiborg.git
```

Navigate to the project directory:

```
cd multiborg
```

Install the gem:

```
bundle install
rake install
```

## Usage

To use MultiBorg, you can run the following command:

```sh
multiborg help
```
For more detailed usage instructions, please refer to the documentation.

### When using from source (not installed)

After having run `bundle install`, you can run the following command:

```sh
bundle exec bin/multiborg help
```

## Configuration

Prefere usage of the integrate commands for setting up configuration:

```sh
multiborg add <backup_name> <uri> <repo_destination>
```

The `repo_destination` is the path where the backup repository will be stored, and can be an URI that borg accepts, like `ssh://user@host:port/path/to/repo`.

MultiBorg can be configured using a configuration file. Here is an example configuration:

```yaml
# Example configuration for MultiBorg
backups:
  - name: "backup1"
    # The URI of the directory you want to backup
    uri: "/path/to/repo1"
    # The destination of the backup repository
    repo_destination: "/path/to/backup1"
  - name: "backup2"
    uri: "/path/to/repo2"
    repo_destination: "/path/to/backup2"
    # Additional configuration options
```

## Contributing

We welcome contributions to MultiBorg! To contribute:

- Fork the repository.
- Create a new branch for your feature or bug fix.
- Make your changes and commit them with descriptive messages.
- Push your changes to your fork.
- Submit a pull request to the main repository.

Please ensure your code adheres to the existing style and includes appropriate tests.

## License

MultiBorg is licensed under the GNU GPLv3. See the LICENSE file for more details.

## Contact

If you have any questions or feedback, feel free to open an issue or contact us at your@email.com.

## Changelog

For information on recent changes, see the CHANGELOG.
