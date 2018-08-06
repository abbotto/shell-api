# The API

## [confirm](#confirm)

- Confirm an action with a user.
- Take `y/n` input and invoke the appropriate callback function.

      Usage: confirm <QUESTION> <YES_CALLBACK> <NO_CALLBACK>

[source code](../shell/confirm)

---

## [import](#import)

- Fetch a `.env` file and export it's environment variables.

      Usage: import <ENV>

[source code](../shell/import)

---

## [join-file](#join-file)

- Append/prepend text or file contents to a file.
  - At least 1 argument must be a path to a file.
  - If 2 paths are provided, the 2nd file is appended to the 1st.
  - If 1 string and 1 path are provided, append the 2nd argument to the 1st and write to the target path.
- Pass the `auth` flag for `sudo` privileges.

      Usage: join-file <OPTIONAL[-a, --auth]> <PATH_OR_TEXT> <PATH_OR_TEXT>

[source code](../shell/join-file)

---

## [pipe-file](#pipe-file)

- Recursively find files and pipe them through a command.
- Will return the exit code of the selected command.
- Reference a filename with the `{}` placeholder and the command will be called for each file.
  - `<COMMAND> file1, <COMMAND> file2, <COMMAND> fileN...`
- If the `{}` placeholder is omitted the command will run against as many files as possible.
  - `<COMMAND> file1 file2 fileN...`
- Pass the `auth` flag for `sudo` privileges.

      Usage: pipe-file <OPTIONAL[-a, --auth]> <OPTIONAL[DEPTH_INT]> <FILE_PATH_PATTERN> <COMMAND>
      Example: pipe-file "/tmp/*.log" cat {}

[source code](../shell/pipe-file)

---

## [print-text](#print-text)

- Print colored text on the screen.

      Usage: print-text <COLOR_CODE> <CONTENT>

![Shell Color Palette](https://github.com/abbotto/shell-api/raw/master/doc/asset/shell-color-palette.png "Shell Color Palette")

Reference: [Wikipedia](https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit)

[source code](../shell/print-text)

---

## [read-file](#read-file)

- Read the contents of a file.

      Usage: read-file <TARGET_FILE>

[source code](../shell/read-file)

---

## [require](#require)

- Require commands and/or scripts.
- Return an error if a command or file doesn't exist.

      Usage: require <SCRIPT_OR_COMMAND> <OPTIONAL_MESSAGE>

[source code](../shell/require)

---

## [start-daemon](#start-daemon)

- Run a script as a background process.

      Usage: start-daemon <TAG> <TARGET_SCRIPT>

[source code](../shell/start-daemon)

---

## [stop-daemon](#stop-daemon)

- Stop a daemonized script.

      Usage: stop-daemon <TAG> <TARGET_SCRIPT>

[source code](../shell/stop-daemon)

---

## [strict-mode](#strict-mode)

- Force POSIX-compliant behaviour.
- Disable brace expansion.
- Exit if a command has a non-zero exit status.
- Throws an error if an undefined variable is referenced.

      Usage: . <SHELL_API_PATH>/strict-mode

[source code](../shell/strict-mode)

---

## [terminate](#terminate)

- Print a pass or fail message and exit a script.

      Usage: terminate <EXIT_CODE> <PASS-MSG> <FAIL-MSG>

[source code](../shell/terminate)

---

## [watch-daemon](#watch-daemon)

- Show the output of a daemonized script in real-time.
- Pass the `no-follow` flag to get a quick look at the script output.

      Usage: watch-daemon <OPTIONAL[-n, --no-follow]> <TAG> <TARGET_SCRIPT>

[source code](../shell/watch-daemon)

---

## [write-file](#write-file)

- Write content to a file.
- Pass the `auth` flag for `sudo` privileges.

      Usage: write-file <OPTIONAL[-a, --auth]> <TARGET_FILE> <CONTENT>

[source code](../shell/write-file)
