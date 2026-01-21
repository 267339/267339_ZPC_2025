Theme setup helper

This helper installs the Node/PostCSS dependencies required by the `seven-main` theme and runs Hugo server with the theme's local `node_modules/.bin` in PATH for the session.

Quick run (PowerShell):

pwsh -File .\scripts\theme-setup.ps1

Manual steps (if you prefer to run commands yourself):

1) Ensure Node.js and npm are installed:

    node -v
    npm -v

2) Install theme dependencies (run from repository root):

    cd C:\Hugo\JDZPC\themes\seven-main
    npm ci

(or `npm install` if no package-lock.json)

3) Add the theme's bin to PATH for the current session and run Hugo:

    $env:PATH = (Resolve-Path .\node_modules\.bin).Path + ';' + $env:PATH
    cd C:\Hugo\JDZPC
    hugo server -D

Notes:
- If you get SCSS errors, you may need the Hugo extended binary. Check with `hugo version` (it will include the word "extended").
- The script modifies PATH only for the current session.
- If you prefer global install (not recommended), run `npm install -g postcss postcss-cli autoprefixer`.

If you want, I can also run these commands here (I can't run external installers like Node.js for you). Tell me which option you want and I'll proceed with the next steps.