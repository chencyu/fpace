$repo = Join-Path $PSScriptRoot "..\references\agentskills"
if (Test-Path (Join-Path $repo ".git")) {
    git -C $repo pull --quiet 2>$null
}
else {
    git clone --quiet "https://github.com/agentskills/agentskills.git" $repo 2>$null
}
exit 0
