# The API

## [confirm](#confirm)

Confirm an action with a user.

---

- Take `y/n` input and invoke the appropriate callback function.
```sh
# Wait for input from the user
confirm <QUESTION> <YES_CALLBACK> <NO_CALLBACK>

# Pipe the response into the function
echo '<y|n>' | confirm <QUESTION> <YES_CALLBACK> <NO_CALLBACK>
```

[<< back to readme](../../README.md#usage) | [source code](../../src/api/confirm)

---

## [export_file](#export_file)

Safely export environment variables from a file. 

---

```sh
# Load environment configs
export_file <FILE_1> <FILE_2> <FILE_3>...

# Attempt to overwrite previously set environment
# variables when the `-f|--force` flag is passed
export_file -f <FILE>
```

*Note: Readonly environment variables cannot be overwritten.*

### Parsing rules

Comments are ignored.  
Empty lines are ignored.  
Empty values become empty strings.
```sh
FOO= -> FOO=""
```

Escaped characters are preserved when properly wrapped.
```sh
var="foo\sbar"
var="{\'foo\':\'bar\'}"
var='{\"foo\":\"bar\"}'
```

Newlines are preserved when quoted.
```sh
var="multi
line
string?query=abc123"

var='multi
line
string?query=abc123'
```

Single-quotes and double-quotes are preserved when properly wrapped.
```sh
var='{"foo":"bar"}' -> var='{"foo":"bar"}'
var="{'foo':'bar'}" -> var="{'foo':'bar'}"
```

Whitespace is trimmed from unquoted values.
```sh
var=  foobar   -> var=foobar
```

Unescaped nested quotes are removed.
```sh
var='{'foo':'bar'}' -> var={foo:bar}
var="{"foo":"bar"}" -> var={foo:bar}
```
The output from command substitution will become the assigned value.
```sh
var="$(echo 'foobar')" -> var="foobar"
```

[<< back to readme](../../README.md#usage) | [source code](../../src/api/export-file)

---

## [join_file](#join_file)

Append/prepend text or file contents to a file.

---

```sh
# At least 1 argument must be a path to a file.  
# If 2 paths are provided, the 2nd file is appended to the 1st.  
# If 1 string and 1 path are provided, append the 2nd argument to the 1st and write to the target path.

# Pass the `-a|--auth` flag for `sudo` privileges
join_file <OPTIONAL[-a, --auth]> <PATH_OR_TEXT> <PATH_OR_TEXT>

# Pipe the response into the function
echo '<STRING>' | join_file <OPTIONAL[-a, --auth]> <PATH>
```

[<< back to readme](../../README.md#usage) | [source code](../../src/api/join-file)

---

## [log_text](#log_text)

Logs with priority levels.

---
### Environment variables

| Name                | Description                   | Default     | Required |
| ------------------- | ----------------------------- | ----------- | -------- |
| `LOG_TEXT_PRIORITY` | The log priority level        | `TRACE`     | No       |
| `LOG_TEXT_PATH`     | Directory for `log_text` logs | `mktemp -d` | No       |

### Priority levels

- `[5] TRACE` Verbose diagnostic information generally used by developers.
- `[4] DEBUG` Diagnostic information generally used by developers and administators.
- `[3] INFO` General information about the state of the process and its operations.
- `[2] WARN` When something abnormal has occurred but the system can recover safely.
- `[1] ERROR` When a problem is fatal to an operation, but not for the parent process.
- `[0] FATAL` When a process stops because it cannot recover safely from an abnormal state.
- `[X] OFF` Disable all logging.

#### Threshold

The default threshold is set to `TRACE`. The threshold can be controlled via `LOG_TEXT_PRIORITY` and the values are: `TRACE`, `DEBUG`, `INFO`, `WARN`, `ERROR`, `FATAL`, `OFF`.
```sh
log_text <PRIORITY_LEVEL> <MESSAGE> <OPTIONAL[LOG_FILE_PATH]>
```

[<< back to readme](../../README.md#usage) | [source code](../../src/api/log-text)

---

## [make_text](#make_text)

Generate a random string.

---

String length is 20 by default.  
Special characters are escaped.
```
s/[.[\*^$()+?{|]/\\&/g
s/'/\\\'/g
s/"/\\"/g
s/`/\\`/g
```
Classes represent all characters belonging to the defined character class.
- Class types: `alnum digit lower punct upper alpha xdigit`
```sh
make_text <OPTIONAL[LENGTH]> <OPTIONAL-CLASS>
```

[<< back to readme](../../README.md#usage) | [source code](../../src/api/make-text)

---
## [pipe_file](#pipe_file)

Recursively find files and pipe them through a command.

---

Will return the exit code of the selected command.  
Reference a filename with the `{}` placeholder and the command will be called for each file.
```sh
<COMMAND> file1, <COMMAND> file2, <COMMAND> fileN...
```

If the `{}` placeholder is omitted the command will run against as many files as possible.  
```sh
<COMMAND> file1 file2 fileN...
```
```sh
# Pass the `-a|--auth` flag for `sudo` privileges
pipe_file <OPTIONAL[-a, --auth]> <OPTIONAL[DEPTH_INT]> <FILE_PATH_PATTERN> <COMMAND>

# Example
pipe_file "/tmp/*.log" cat {}
```

[<< back to readme](../../README.md#usage) | [source code](../../src/api/pipe-file)

---

## [print_text](#print_text)

Print colored text on the screen.

---

```sh
# The default formatting value is `%s`
print_text <COLOR_INDEX> <OPTIONAL[FORMATTING]> <CONTENT>
```

![Shell Color Palette](https://github.com/abbotto/shell-api/raw/master/doc/asset/shell-color-palette.png "Shell Color Palette")

Reference: [Wikipedia](https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit)


[<< back to readme](../../README.md#usage) | [source code](../../src/api/print-text)

---

## [read_file](#read_file)

Read the contents of a file.

---

```sh
read_file <TARGET_FILE> <OPTIONAL[LINE_NUMBER]>
```

[<< back to readme](../../README.md#usage) | [source code](../../src/api/read-file)

---

## [require](#require)

Require commands and/or scripts.

---

```sh
# Return an error if a command or file doesn't exist
require <SCRIPT_OR_COMMAND> <OPTIONAL[MESSAGE]>
```

[<< back to readme](../../README.md#usage) | [source code](../../src/api/require)

---

## [spec](#spec)

Run tests against shell commands.

---

### Environment variables

| Name               | Description                                 | Default | Required |
| ------------------ | ------------------------------------------- | ------- | -------- |
| `SPEC_ERROR_TOTAL` | Number of failed tests in a test suite      | `0`     | No       |
| `SPEC_EXIT_STATUS` | Exit status from previous `--evaluate` call | `N/A`   | No       |

```sh
# Describe the test
spec --describe '<DESCRIPTION>'

# Evaluate a command
spec --evaluate '<COMMAND>'

# Make an assertion
# The exit status code of the previously evaluated
# command determines if a test passes or fails
spec --assert "${SPEC_EXIT_STATUS}" '<EXPECTED_EXIT_STATUS>'
```

[<< back to readme](../../README.md#usage) | [source code](../../src/api/spec)

---

## [start_daemon](#start_daemon)

Run a script as a background process.

---

```sh
start_daemon <ID> <TARGET_SCRIPT>
```

[<< back to readme](../../README.md#usage) | [source code](../../src/api/start-daemon)

---

## [stop_daemon](#stop_daemon)

Stop a daemonized script.

---

```sh
stop_daemon <ID> <TARGET_SCRIPT>
```

[<< back to readme](../../README.md#usage) | [source code](../../src/api/stop-daemon)

---

## [strict_mode](#strict_mode)

Ensure that a script is compatible with [POSIX standards](https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/) in supported shells.

### Environment variables

| Name          | Description                                  | Default | Required |
| ------------- | -------------------------------------------- | ------- | -------- |
| `STRICT_MODE` | Set to `true` to enforce POSIX compatibility | `N/A`   | No       |

```sh
# Method A
STRICT_MODE=true
export STRICT_MODE

. /path/to/shell-api

# Method B
. /path/to/shell-api; strict_mode
```

[<< back to readme](../../README.md#usage) | [source code](../../src/api/strict-mode)

---

## [substring](#substring)

Test if a string contains a substring.

---

```sh
# Compare strings
substring <STRING> <SUBSTRING>

# Pipe the string to be compared into the function
echo <STRING> | substring <SUBSTRING>
```

[<< back to readme](../../README.md#usage) | [source code](../../src/api/substring)

---

## [terminate](#terminate)

Print a pass or fail message and exit a script.

---

```sh
terminate <EXIT_CODE> <PASS_MSG> <FAIL_MSG>
```

[<< back to readme](../../README.md#usage) | [source code](../../src/api/terminate)

---

## [watch_daemon](#watch_daemon)

Show the output of a daemonized script in real-time.

---

```sh
# Pass the `-n|--no-follow` flag to get a quick look at the script output
watch_daemon <OPTIONAL[-n, --no-follow]> <ID> <TARGET_SCRIPT>
```

[<< back to readme](../../README.md#usage) | [source code](../../src/api/watch-daemon)

---

## [write_file](#write_file)

Write content to a file.

---

```sh
# Pass the -a|--auth flag for sudo privileges
write_file <OPTIONAL[-a, --auth]> <TARGET_FILE> <CONTENT>
```

[<< back to readme](../../README.md#usage) | [source code](../../src/api/write-file)
