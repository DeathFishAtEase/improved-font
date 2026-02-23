$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$root = (Resolve-Path (Join-Path $scriptDir "..")).Path

$arch = $env:PROCESSOR_ARCHITECTURE
if ($env:PROCESSOR_ARCHITEW6432) {
  $arch = $env:PROCESSOR_ARCHITEW6432
}

$binName = "ra2fnt-windows-amd64.exe"
if ($arch.ToUpperInvariant() -eq "ARM64") {
  $binName = "ra2fnt-windows-arm64.exe"
}

$bin = Join-Path $root ("ra2fnt\" + $binName)
if (-not (Test-Path -LiteralPath $bin)) {
  throw "ra2fnt binary not found: $bin"
}

& $bin create -in (Join-Path $root "src") -out (Join-Path $root "game.fnt")
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}
