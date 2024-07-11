# -*- coding: utf-8 -*-
param(
    [string]$FilePath,
    [string]$OutputFilePath,
    [string]$SearchRegex,
    [string]$ReplaceRegex,
    [int]$StartLine = 0,   # 默认值为 0，代表从文件开始处处理
    [int]$EndLine = [int]::MaxValue  # 默认值为 int 最大值，代表处理到文件结束
)

# 初始化一个计数器
$counter = 0

# 读取文件并处理每行
Get-Content $FilePath | ForEach-Object -Begin {
    $currentLine = 0
} -Process {
    $currentLine++
    if ($currentLine -ge $StartLine -and $currentLine -le $EndLine) {
        # 进行自定义的替换操作
        $modifiedLine = $_ -replace '^A：', "```````nA：" -replace '\s+您的答案.*$', "`n``````"

        # 检查是否符合用户提供的正则表达式，如果符合则进行替换
        if ($modifiedLine -match $SearchRegex) {
            # 递增计数器并构建新的行号
            $counter++
            $modifiedLine -replace $SearchRegex, ("{0}$ReplaceRegex" -f $counter)
        } else {
            # 如果行不符合格式，返回修改后的行
            $modifiedLine
        }
    } else {
        # 如果当前行不在指定范围内，直接返回原行
        $_
    }
} | Set-Content $OutputFilePath