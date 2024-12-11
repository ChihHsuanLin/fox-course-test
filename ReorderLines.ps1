# -*- coding: utf-8 -*-
param(
    [string]$FilePath,
    [string]$OutputFilePath,
    [string]$SearchRegex,
    [string]$ReplaceRegex,
    [int]$SingleChoiceStartLine = 0,   # 單選題的起始行
    [int]$SingleChoiceEndLine = 0,     # 單選題的結束行
    [int]$MultiChoiceStartLine = 0,    # 多選題的起始行
    [int]$MultiChoiceEndLine = 0      # 多選題的結束行
)

# 初始化計數器
$singleCounter = 0
$multiCounter = 0

# 判斷行範圍
$content = Get-Content $FilePath

if ($SingleChoiceStartLine -eq 0 -or $SingleChoiceEndLine -eq 0) {
    $singleChoiceStartIndex = ($content | Select-String -Pattern "^# 單選題" -List).LineNumber + 1
    $singleChoiceEndIndex = ($content | Select-String -Pattern "^# 多選題" -List).LineNumber - 1
    $SingleChoiceStartLine = $singleChoiceStartIndex
    $SingleChoiceEndLine = $singleChoiceEndIndex
}

if ($MultiChoiceStartLine -eq 0 -or $MultiChoiceEndLine -eq 0) {
    $multiChoiceStartIndex = ($content | Select-String -Pattern "^# 多選題" -List).LineNumber + 1
    $multiChoiceEndIndex = $content.Count
    $MultiChoiceStartLine = $multiChoiceStartIndex
    $MultiChoiceEndLine = $multiChoiceEndIndex
}

# 讀取文件並處理每行
$content | ForEach-Object -Begin {
    $currentLine = 0
} -Process {
    $currentLine++

    # 單選題範圍處理
    if ($currentLine -ge $SingleChoiceStartLine -and $currentLine -le $SingleChoiceEndLine) {
        # 進行自定義的替換操作
        $modifiedLine = $_ -replace '^A：', "```````nA：" -replace '\s+您的答案.*$', "`n``````"

        # 檢查是否符合用戶提供的正則表達式，如果符合則進行替換
        if ($modifiedLine -match $SearchRegex) {
            # 單選題計數器遞增並構建新的行號
            $singleCounter++
            $modifiedLine -replace $SearchRegex, ("{0}$ReplaceRegex" -f $singleCounter)
        } else {
            $modifiedLine
        }
    }
    # 多選題範圍處理
    elseif ($currentLine -ge $MultiChoiceStartLine -and $currentLine -le $MultiChoiceEndLine) {
        # 進行自定義的替換操作
        $modifiedLine = $_ -replace '^A：', "```````nA：" -replace '\s+您的答案.*$', "`n``````"

        # 檢查是否符合用戶提供的正則表達式，如果符合則進行替換
        if ($modifiedLine -match $SearchRegex) {
            # 多選題計數器遞增並構建新的行號
            $multiCounter++
            $modifiedLine -replace $SearchRegex, ("{0}$ReplaceRegex" -f $multiCounter)
        } else {
            $modifiedLine
        }
    } else {
        # 如果當前行不在指定範圍內，直接返回原行
        $_
    }
} | Set-Content $OutputFilePath
