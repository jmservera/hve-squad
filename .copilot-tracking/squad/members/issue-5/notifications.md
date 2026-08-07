---
description: "Notification routing for sub-squad issue-5"
---

# Squad Notifications (issue-5)

* **Approval channel:** inherited from the federation default (`in-chat`, disabled). This is an unattended Watch Mode run; no human is attached, so no gate notification is dispatched. Any Risk Gate finding is instead recorded in `decisions.md` under "Blocking findings" for the downstream PR body.
