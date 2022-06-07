# Container 4 file checks

![Build status](https://github.com/deeagle/filecheck/workflows/CI/badge.svg)
![Release status](https://github.com/deeagle/filecheck/workflows/Release%20version/badge.svg)
[![Linux](https://svgshare.com/i/Zhy.svg)](https://svgshare.com/i/Zhy.svg)
[![Alpine](https://img.shields.io/badge/Alpine_Linux-0D597F?style=flat-square&logo=alpine-linux&logoColor=white)](https://img.shields.io/badge/Alpine_Linux-0D597F?style=flat-square&logo=alpine-linux&logoColor=white)

I need a container for CI/CD testing of incoming changes from
non linux environments. Installed tools are:

- `find`, `file`, `git`, `isutf8`

## Examples

You can check your files for:

- LineFeed
  - find files with non unix style linefeed (`\n`)

    ```bash
    (! find . -maxdepth 1 -name "*.*" -not -type d -exec file "{}" ";" | grep "CRLF\|CR")
    (! find src tests -name "*.*" -not -type d -exec file "{}" ";" | grep "CRLF\|CR")
    ```

- UTF8
  - Find files that are not utf8
    <!-- markdownlint-disable MD013 -->
    ```bash
    (find . -maxdepth 1 -name "*.*" -not -type d -exec isutf8 "{}" "+")
    (find app bin scripts src tests web -name "*.*" -not -type d -not -name "*.png" -not -name "*.gif" -not -name "favicon.ico"  -exec isutf8 "{}" "+")
    ```
    <!-- markdownlint-enable MD013 -->

## Weblinks

- [CHANGELOG](CHANGELOG.md)
- [filecheck on github.com](https://github.com/deeagle/filecheck)
- [filecheck on hub.docker.com](https://hub.docker.com/r/docdee/filecheck)
- [docker-alpine](https://github.com/alpinelinux/docker-alpine)
- [Dockerfile lint](https://github.com/hadolint/hadolint)
