# Container 4 file checks

I need a container for CI/CD testing of incoming changes from non linux environments.   
Installed tools are:
- `find`, `file`, `git`, `isutf8`

## Examples

You can check your files for:
- LineFeed
  - find files with non unix style linefeed (`\n`)   
    ```bash
    (! find . -maxdepth 1 -name "*.*" -not -type d -exec file "{}" ";" | grep "CRLF\|CR")
    (! find src tests -name "*.*" -not -type d -exec file "{}" ";" | grep "CRLF\|CR")
    ```

`
- UTF8
  - Find files that are not utf8
    ```bash
    (find . -maxdepth 1 -name "*.*" -not -type d -exec isutf8 "{}" "+")
    (find app bin scripts src tests web -name "*.*" -not -type d -not -name "*.png" -not -name "*.gif" -not -name "favicon.ico"  -exec isutf8 "{}" "+")
    ```   
