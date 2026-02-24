# ImprovedFont for Command & Conquer: Red Alert 2

This repository contains the **ImprovedFont** font for `Command & Conquer: Red Alert 2` from the [Phobos](https://github.com/Phobos-developers/Phobos) project.

> Draft status: this project is currently a draft and is under discussion.

## Structure

The font is built from PNG images located in the `src` directory.

`ra2fnt` binaries for different platforms are located in the `ra2fnt` directory.

## Build

Use the scripts in the `scripts` directory:

```bash
./scripts/build.sh
```

```bat
scripts\build.bat
```

```powershell
.\scripts\build.ps1
```

The build output is `game.fnt` in the repository root.

## CI/CD

GitHub Actions are configured for:
- CI: Build validation on every `push` and `pull_request`.
- CD: Automatic GitHub Release publishing when a tag matching `v*` is pushed.

To publish a new release:

```bash
git tag v1.0.0
git push origin v1.0.0
```

Release assets:
- `game.fnt`
- `game.fnt.sha256`
- `ImprovedFont-<tag>.zip`

## Where to get `ra2fnt`

You can download `ra2fnt` from the releases of this repository:
https://github.com/Belonit/ra2fnt

## Credits

- Kerbiter#3128 (Metadorius)
- wiktorderelf#6546
- Uranusian#0653 (Thrifinesma)
