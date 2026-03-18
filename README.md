# 判斷題

# 單選題

# 多選題

```
^A：
```\nA：

\s+您的答案.*$
\n```
```


# 使用方法：
1. 清空 `temp.md`
2. copy 內容到 `temp.md`
3. 執行指令: 修改 `OutputFilePath`
   * 修改 OutputFilePath，指定檔名 (最新版做法不需要建立空的)

```powershell
## Step 1
Set-Content -Path "F:\CESBG+DCaS\Git\fox-course-test\temp.md" `
    -Value "# 判斷題`n`n`n# 單選題`n`n`n# 多選題`n" `
    -Encoding utf8

Set-Content -Path "D:\Git\fox-course-test\temp.md" ` "# 判斷題`n`n`n# 單選題`n`n`n# 多選題`n"  -Encoding utf8

## Step 3
.\ReorderLines.ps1 -FilePath "F:\CESBG+DCaS\Git\fox-course-test\temp.md" -OutputFilePath "F:\CESBG+DCaS\Git\fox-course-test\" -SearchRegex "^\d+\." -ReplaceRegex "."

.\ReorderLines.ps1 -FilePath "D:\Git\fox-course-test\temp.md" -OutputFilePath "D:\Git\fox-course-test\工業富聯大咖講堂\" -SearchRegex "^\d+\." -ReplaceRegex "."
```
