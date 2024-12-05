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
3. 修改 `OutputFilePath`(空的 `.md` 檔名)
4. 輸入**單選題**的 `StartLine`, `EndLine` 開始結束行數
5. 執行指令
6. 將新的 md 檔案內容複製到 `temp.md`
7. 輸入**多選題**的 `StartLine`, `EndLine` 開始結束行數
8. 執行指令
   1. `OutputFilePath`: 空的 `.md` 檔名
   2. `StartLine`、`EndLine`: 單選題**或**多選題的開始/結束行數
10. 單選題修改後，將新的 md 檔案複製到 `temp.md`，再重複一次，修改

```powershell
.\ReorderLines.ps1 -FilePath "F:\CESBG+DCaS\Git\fox-course-test\temp.md" -OutputFilePath "F:\CESBG+DCaS\Git\fox-course-test\.md" -SearchRegex "^\d+\." -ReplaceRegex "." -StartLine 0 -EndLine 0
```
