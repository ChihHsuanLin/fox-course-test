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
1. 建立一個空的 `.md`
2. copy 內容到 `temp.md`
3. 執行指令: 修改 `OutputFilePath`
```powershell
.\ReorderLines.ps1 -FilePath "F:\CESBG+DCaS\Git\fox-course-test\temp.md" -OutputFilePath "F:\CESBG+DCaS\Git\fox-course-test\" -SearchRegex "^\d+\." -ReplaceRegex "."
```
