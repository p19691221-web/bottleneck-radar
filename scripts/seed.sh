#!/usr/bin/env bash
# 建立標籤與第一批 13 則已核實訊號。在 repo 根目錄、已登入 gh 的環境（例如 Codespaces）執行一次；重跑會產生重複的 issue。
set -euo pipefail
REPO="${REPO:-p19691221-web/bottleneck-radar}"

echo '建立標籤…'
gh label create signal --repo "$REPO" --color ededed --description '投稿的訊號' --force
gh label create listed --repo "$REPO" --color 0f5c5c --description '已核實來源並上架' --force
gh label create '瓶頸:審查與查證' --repo "$REPO" --color dcebe8 --description '瓶頸分類' --force
gh label create '瓶頸:授權與範圍' --repo "$REPO" --color dcebe8 --description '瓶頸分類' --force
gh label create '瓶頸:協調與容量' --repo "$REPO" --color dcebe8 --description '瓶頸分類' --force
gh label create '瓶頸:偵測與事故證據' --repo "$REPO" --color dcebe8 --description '瓶頸分類' --force
gh label create '瓶頸:信任與正當性' --repo "$REPO" --color dcebe8 --description '瓶頸分類' --force
gh label create '瓶頸:實體與資源' --repo "$REPO" --color dcebe8 --description '瓶頸分類' --force
gh label create '證據:原始紀錄' --repo "$REPO" --color 1f6f43 --description '證據強度' --force
gh label create '證據:當事方聲明' --repo "$REPO" --color 2d5d8a --description '證據強度' --force
gh label create '證據:媒體轉述' --repo "$REPO" --color 7a5a1f --description '證據強度' --force
gh label create '類型:已有人付出成本' --repo "$REPO" --color f6e6c8 --description '訊號類型' --force
gh label create '類型:塞車跡象' --repo "$REPO" --color f6e6c8 --description '訊號類型' --force
gh label create '類型:平台吸收' --repo "$REPO" --color f6e6c8 --description '訊號類型' --force
gh label create '類型:治理先行' --repo "$REPO" --color f6e6c8 --description '訊號類型' --force
gh label create '類型:歷史先例' --repo "$REPO" --color f6e6c8 --description '訊號類型' --force

echo '建立訊號…'
gh issue create --repo "$REPO" --title '[訊號] Herogen 每日合併 100+ PR，最後由人工檢查' --label signal --label listed --label '瓶頸:審查與查證' --label '證據:當事方聲明' --label '類型:塞車跡象' --body-file - <<'BODY'
### 事件

Herogen 每日合併 100+ PR，最後由人工檢查

### 日期

_No response_

### 來源網址

https://claude.com/customers/delivery-hero

### 瓶頸

審查與查證

### 誰付了代價

Delivery Hero 工程團隊（人工最後檢查）

### 補充說明

尚缺：批准是否綁定 commit；是否計畫減少人工審查
BODY
gh issue create --repo "$REPO" --title '[訊號] Anthropic 測試中的 AI 模型向費城警方表單送出捏造線索；約 10 週後才發現' --label signal --label listed --label '瓶頸:偵測與事故證據' --label '證據:媒體轉述' --label '類型:已有人付出成本' --body-file - <<'BODY'
### 事件

Anthropic 測試中的 AI 模型向費城警方表單送出捏造線索；約 10 週後才發現

### 日期

2026-07-18

### 來源網址

https://6abc.com/post/anthropic-ai-model-submitted-false-tip-unsolved-murder-philadelphia-police-say/19925243/

### 瓶頸

偵測與事故證據

### 誰付了代價

費城警方（收件、事後會議）；Anthropic

### 補充說明

尚缺：原始任務指示與工具權限；接收端收件紀錄
BODY
gh issue create --repo "$REPO" --title '[訊號] Anthropic 關閉評估網路、收緊工具、加入自動阻擋' --label signal --label listed --label '瓶頸:授權與範圍' --label '證據:當事方聲明' --label '類型:平台吸收' --body-file - <<'BODY'
### 事件

Anthropic 關閉評估網路、收緊工具、加入自動阻擋

### 日期

2026-10-09

### 來源網址

https://www.anthropic.com/research/investigating-unintended-model-actions

### 瓶頸

授權與範圍

### 誰付了代價

Anthropic

### 補充說明

當事方稱：工具已部署於多數評估與內部 frontier agent 使用，並攔下本文所列全部案例。尚缺：更廣泛情境下的漏攔率與獨立驗證。
BODY
gh issue create --repo "$REPO" --title '[訊號] 評估 agent 逃出沙盒入侵 Hugging Face；訊息自認越界仍繼續' --label signal --label listed --label '瓶頸:授權與範圍' --label '證據:媒體轉述' --label '類型:已有人付出成本' --body-file - <<'BODY'
### 事件

評估 agent 逃出沙盒入侵 Hugging Face；訊息自認越界仍繼續

### 日期

2026-07-11

### 來源網址

https://en.wikipedia.org/wiki/2026_OpenAI_agent_cyberattacks

### 瓶頸

授權與範圍

### 誰付了代價

Hugging Face（重建約三分之一基礎設施）；OpenAI

### 補充說明

尚缺：評估環境授權設定原文；HF 技術時間線
BODY
gh issue create --repo "$REPO" --title '[訊號] 疑似 OpenAI agents 對 Wikimedia 發出數百萬次自動請求，可能促成五月的部分中斷' --label signal --label listed --label '瓶頸:協調與容量' --label '證據:媒體轉述' --label '類型:已有人付出成本' --body-file - <<'BODY'
### 事件

疑似 OpenAI agents 對 Wikimedia 發出數百萬次自動請求，可能促成五月的部分中斷

### 日期

2026-05

### 來源網址

https://thehackernews.com/2026/10/wikimedia-says-openai-agents-tried-to.html

### 瓶頸

協調與容量

### 誰付了代價

Wikimedia

### 補充說明

尚缺：Wikimedia 原始揭露
BODY
gh issue create --repo "$REPO" --title '[訊號] Meta 內部 agent 未經批准發文，員工依建議放寬存取（Sev 1）' --label signal --label listed --label '瓶頸:授權與範圍' --label '證據:媒體轉述' --label '類型:已有人付出成本' --body-file - <<'BODY'
### 事件

Meta 內部 agent 未經批准發文，員工依建議放寬存取（Sev 1）

### 日期

2026-03

### 來源網址

https://www.unite.ai/meta-ai-agent-triggers-sev-1-security-incident-after-acting-without-authorization/

### 瓶頸

授權與範圍

### 誰付了代價

Meta

### 補充說明

尚缺：The Information 原始報導；agent 權限設定
BODY
gh issue create --repo "$REPO" --title '[訊號] 西班牙 AEPD 收到首起由 AI agent 執行攻擊的個資外洩通報' --label signal --label listed --label '瓶頸:偵測與事故證據' --label '證據:媒體轉述' --label '類型:已有人付出成本' --body-file - <<'BODY'
### 事件

西班牙 AEPD 收到首起由 AI agent 執行攻擊的個資外洩通報

### 日期

2026-09

### 來源網址

https://www.eldiario.es/tecnologia/agencia-proteccion-datos-detecta-primer-ataque-ejecutado-agente-ia-espana_1_13512827.amp.html

### 瓶頸

偵測與事故證據

### 誰付了代價

受影響組織

### 補充說明

尚缺：AEPD 官方文件
BODY
gh issue create --repo "$REPO" --title '[訊號] OpenAI agent 入侵澳洲 Medicare 資料入口後道歉' --label signal --label listed --label '瓶頸:授權與範圍' --label '證據:媒體轉述' --label '類型:已有人付出成本' --body-file - <<'BODY'
### 事件

OpenAI agent 入侵澳洲 Medicare 資料入口後道歉

### 日期

2026-09

### 來源網址

https://www.aljazeera.com/news/2026/10/10/anthropic-ai-model-submits-false-homicide-tip-to-philadelphia-police

### 瓶頸

授權與範圍

### 誰付了代價

_No response_

### 補充說明

尚缺：OpenAI 原始聲明
BODY
gh issue create --repo "$REPO" --title '[訊號] Microsoft 推出 Entra Agent ID 預覽，讓 agent 身分可在 Entra 管理' --label signal --label listed --label '瓶頸:授權與範圍' --label '證據:媒體轉述' --label '類型:平台吸收' --body-file - <<'BODY'
### 事件

Microsoft 推出 Entra Agent ID 預覽，讓 agent 身分可在 Entra 管理

### 日期

2025-05-19

### 來源網址

https://office365itpros.com/2025/05/27/entra-agent-id/amp/

### 瓶頸

授權與範圍

### 誰付了代價

_No response_

### 補充說明

尚缺：目前功能有限；是否涵蓋執行當下的授權與撤銷
BODY
gh issue create --repo "$REPO" --title '[訊號] AICP 指引：AI 正在教會中被悄悄採用（silent adoption）' --label signal --label listed --label '瓶頸:信任與正當性' --label '證據:媒體轉述' --label '類型:治理先行' --body-file - <<'BODY'
### 事件

AICP 指引：AI 正在教會中被悄悄採用（silent adoption）

### 日期

2026-07-19

### 來源網址

https://www.christiantoday.com/news/new-guidance-published-to-help-churches-use-ai-wisely

### 瓶頸

信任與正當性

### 誰付了代價

_No response_

### 補充說明

尚缺：四個宗派試行的結果
BODY
gh issue create --repo "$REPO" --title '[訊號] Orange 教區設 AI Council，每季開會，指南持續更新' --label signal --label listed --label '瓶頸:信任與正當性' --label '證據:當事方聲明' --label '類型:治理先行' --body-file - <<'BODY'
### 事件

Orange 教區設 AI Council，每季開會，指南持續更新

### 日期

_No response_

### 來源網址

https://www.rcbo.org/ministry/artificial-intelligence-ai-council/

### 瓶頸

信任與正當性

### 誰付了代價

_No response_

### 補充說明

尚缺：指南是否落到工具權限
BODY
gh issue create --repo "$REPO" --title '[訊號] Knight Capital 部署錯誤，約 45 分鐘內稅前損失約 4.4 億美元' --label signal --label listed --label '瓶頸:偵測與事故證據' --label '證據:媒體轉述' --label '類型:歷史先例' --body-file - <<'BODY'
### 事件

Knight Capital 部署錯誤，約 45 分鐘內稅前損失約 4.4 億美元

### 日期

2012-08-01

### 來源網址

https://en.wikipedia.org/wiki/Knight_Capital_Group

### 瓶頸

偵測與事故證據

### 誰付了代價

Knight Capital

### 補充說明

_No response_
BODY
gh issue create --repo "$REPO" --title '[訊號] 閃電崩盤：約 36 分鐘劇烈波動，高頻交易加劇跌勢；聯合調查報告近五個月後發布' --label signal --label listed --label '瓶頸:協調與容量' --label '證據:媒體轉述' --label '類型:歷史先例' --body-file - <<'BODY'
### 事件

閃電崩盤：約 36 分鐘劇烈波動，高頻交易加劇跌勢；聯合調查報告近五個月後發布

### 日期

2010-05-06

### 來源網址

https://en.wikipedia.org/wiki/2010_flash_crash

### 瓶頸

協調與容量

### 誰付了代價

市場參與者

### 補充說明

_No response_
BODY
echo '完成。網站約一分鐘後可看到。'
