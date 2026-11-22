# Builds a Word Lanterns reading game from a word list and the template.
# Works with PowerShell 7 (pwsh) on Windows, macOS and Linux.
#
#   pwsh tools/make-word-lanterns.ps1
#       -> grade-1/english/word-lanterns.html from grade-1/english/word-lanterns-words.txt
#   pwsh tools/make-word-lanterns.ps1 -WordsFile grade-2/english/word-lanterns-words.txt -Out grade-2/english/word-lanterns.html
#
# Word list format (lines starting with // are notes):
#   # List name
#   word, word, word
param(
  [string]$WordsFile   = '',
  [string]$Out         = '',
  [string]$Template    = '',
  [string]$ArtifactOut = ''   # optional: also write a copy without the <html>/<head>/<body> wrapper
)
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
if (-not $WordsFile) { $WordsFile = Join-Path $root 'grade-1/english/word-lanterns-words.txt' }
if (-not $Out)       { $Out       = Join-Path $root 'grade-1/english/word-lanterns.html' }
if (-not $Template)  { $Template  = Join-Path $root 'templates/word-lanterns-template.html' }

$lists = New-Object System.Collections.Generic.List[object]
$cur = $null
foreach ($line in Get-Content -LiteralPath $WordsFile -Encoding UTF8) {
  $t = $line.Trim()
  if (-not $t -or $t.StartsWith('//')) { continue }
  if ($t.StartsWith('#')) {
    $cur = [ordered]@{ name = $t.TrimStart('#').Trim(); words = New-Object System.Collections.Generic.List[string] }
    $lists.Add($cur); continue
  }
  if (-not $cur) { $cur = [ordered]@{ name = 'Words'; words = New-Object System.Collections.Generic.List[string] }; $lists.Add($cur) }
  foreach ($w in ($t -split '[,;]')) {
    $w = $w.Trim()
    if ($w -and -not ($cur.words -contains $w)) { $cur.words.Add($w) }
  }
}
$lists = @($lists | Where-Object { $_.words.Count -gt 0 })
if (-not $lists.Count) { throw "No words found in $WordsFile" }

$json  = ConvertTo-Json -InputObject $lists -Depth 4 -Compress
$block = "/*WORDS-START*/`nconst WORD_LISTS = $json;`n/*WORDS-END*/"
$html  = [IO.File]::ReadAllText($Template)
$html  = [regex]::Replace($html, '(?s)/\*WORDS-START\*/.*?/\*WORDS-END\*/', [System.Text.RegularExpressions.MatchEvaluator]{ param($m) $block })
$html  = [regex]::Replace($html, '(?s)<!--\s*WORD LANTERNS . TEMPLATE.*?-->', '<!-- Made by tools/make-word-lanterns.ps1 from templates/word-lanterns-template.html and a word list. Change the template, not this file. -->')
$utf8  = New-Object System.Text.UTF8Encoding($false)
[IO.File]::WriteAllText($Out, $html, $utf8)
if ($ArtifactOut) {
  $a = [regex]::Replace($html, '(?im)^\s*(<!doctype html>|</?html[^>]*>|</?head>|</?body>|<meta charset[^>]*>|<meta name="viewport"[^>]*>)\s*\r?\n', '')
  [IO.File]::WriteAllText($ArtifactOut, $a, $utf8)
}
$total = ($lists | ForEach-Object { $_.words.Count } | Measure-Object -Sum).Sum
"Wrote $Out : $($lists.Count) lists, $total words"
$lists | ForEach-Object { "  $($_.name): $($_.words.Count)" }
