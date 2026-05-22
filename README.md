# 🤖 AI Agent Performance Analysis

A complete end-to-end data analysis project built to evaluate and monitor the performance of AI agents across multiple dimensions — including response accuracy, user satisfaction, session behavior, error patterns, and prompt template usage.

This project combines PostgreSQL for data modeling and querying, and Power BI for interactive dashboard visualization.

---

# 📌 Project Overview

As AI agents become more widely deployed in real-world applications, tracking their performance is critical.

This project simulates a production-like environment where multiple AI agents (powered by models like GPT-4o, Claude 3, LLaMA-3, Mistral, and more) handle user queries across various roles and use cases.

## Key Business Questions

- Which agents perform best in terms of accuracy and response time?
- Which users are most active and most satisfied?
- Where are errors and failures happening most frequently?
- Which prompt templates are used by which agents?

---

# 📁 Project Structure

```bash
AI-Agent-Performance-Analysis/
│
├── CSV Files/
│   ├── Agent.csv
│   ├── Users.csv
│   ├── Sessions.csv
│   ├── Interactions.csv
│   ├── Performance_Logs.csv
│   └── Prompt_Templates.csv
│
├── SQL/
│   └── Ai_Agent_Performance.sql
│
├── Dashboard/
│   └── Ai_Agent_Analysis_Dashboard.pbix
│
└── README.md
```

---

# 🗄️ Database Schema

This project uses 6 relational tables built in PostgreSQL.

## 1. Agent

Stores AI agent information.

| Column | Type | Description |
|---|---|---|
| Agent_ID | VARCHAR | Unique agent ID |
| Agent_Name | VARCHAR | AI agent name |
| Model_Used | VARCHAR | Underlying model |
| Current_Version | VARCHAR | Current deployed version |
| Created_At | DATE | Creation date |
| Status | VARCHAR | Active / Testing / Disabled |

---

## 2. Users

Stores user profile details.

| Column | Type | Description |
|---|---|---|
| User_ID | VARCHAR | Unique user ID |
| Name | VARCHAR | User full name |
| Email | VARCHAR | User email |
| Role | VARCHAR | User role |
| Created_At | DATE | Account creation date |
| User_Satisfaction | VARCHAR | Satisfaction level |

---

## 3. Sessions

Tracks session-level activity.

| Column | Type |
|---|---|
| Session_ID | VARCHAR |
| User_ID | VARCHAR |
| Agent_ID | VARCHAR |
| Start_Time | TIME |
| End_Time | TIME |
| Response_Time | VARCHAR |
| Total_Queries | INT |

---

## 4. Interactions

Stores individual interactions.

| Column | Type |
|---|---|
| Interaction_ID | VARCHAR |
| Session_ID | VARCHAR |
| Agent_ID | VARCHAR |
| User_Query | TEXT |
| Agent_Response | TEXT |
| Tokens_In | INT |
| Tokens_Out | INT |
| Occurred_At | DATE |

---

## 5. Performance_Logs

Stores technical metrics.

| Column | Type |
|---|---|
| Log_ID | VARCHAR |
| Interaction_ID | VARCHAR |
| Latency_MS | INT |
| Accuracy_Score | FLOAT |
| Sentiment | VARCHAR |
| Error_Type | VARCHAR |
| Severity_Level | VARCHAR |
| Flagged | VARCHAR |

---

## 6. Prompt_Templates

Stores reusable prompts.

| Column | Type |
|---|---|
| Template_ID | VARCHAR |
| Agent_ID | VARCHAR |
| User_ID | VARCHAR |
| Template_Name | VARCHAR |
| Content | VARCHAR |
| Applicable_Agent | VARCHAR |
| Updated_At | DATE |

---

# 📊 Dataset Summary

| Table | Rows |
|---|---|
| Agent | 10,000 |
| Users | 10,000 |
| Sessions | 10,000 |
| Interactions | 10,000 |
| Performance_Logs | 10,000 |
| Prompt_Templates | 10,000 |

### Total Records: 60,000+

---

# 🔍 Key SQL Analysis

The `Ai_Agent_Performance.sql` file includes:

| # | Query |
|---|---|
| 1 | Average response time per agent |
| 2 | Top 10 highest accuracy scores |
| 3 | Monthly performance summary |
| 4 | Top response rating analysis |
| 5 | Excellent feedback records |
| 6 | Most active users |
| 7 | High-query NanoEngine users |
| 8 | Equal token interactions |
| 9 | Positive sentiment with high severity |
| 10 | Disabled agents analysis |

---

# 🤖 AI Models Covered

- GPT-4o
- GPT-4
- GPT-3.5 Turbo
- Claude 2
- Claude 3
- LLaMA-3 7B
- LLaMA-3 13B
- LLaMA-3 70B
- Mistral-7B
- Mixtral-8B
- QuantumAI
- FinanceGPT
- CodeGen-v2
- HyperNova

---

# 👥 User Roles Included

- Data Analyst
- ML Engineer
- Developer
- DevOps Engineer
- Business Analyst
- Product Owner
- QA Tester
- AI Trainer
- DBA
- Cloud Architect

and many more.

---

# ⚠️ Error Types Tracked

| Error Type | Description |
|---|---|
| Rate Limit | API rate limit exceeded |
| Token Limit Exceeded | Response too large |
| Timeout | Request timeout |
| Connection Error | Network issue |
| Server Error | Internal server issue |
| API Error | General API failure |
| Validation Error | Input validation issue |
| None | No error |

---

# 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| PostgreSQL | Database & SQL |
| Power BI | Dashboard & Visualization |
| Git & GitHub | Version Control |
| CSV | Raw data storage |

---

# 📈 Power BI Dashboard

Dashboard includes:

- Agent performance overview
- Accuracy trends
- Latency analysis
- User satisfaction analysis
- Error severity breakdown
- Session & interaction insights
- Prompt template usage

---

# 🚀 How to Run This Project

## 1. Setup PostgreSQL

- Install PostgreSQL
- Open pgAdmin
- Run `Ai_Agent_Performance.sql`

---

## 2. Load CSV Data

Update the `COPY` file paths in SQL queries.

Then run all COPY commands.

---

## 3. Execute SQL Queries

Run the analysis queries from the SQL file.

---

## 4. Open Power BI Dashboard

Open:

```text
Ai_Agent_Analysis_Dashboard.pbix
```

Refresh the database connection.

---

# 📂 Clone Repository

```bash
git clone https://github.com/YourUsername/AI-Agent-Performance-Analysis.git
cd AI-Agent-Performance-Analysis
```

---

# 🙋 About the Author

## Anand Bakode  
**Data Analyst**

Passionate about data analysis, SQL, Power BI, PostgreSQL, AI analytics, and building real-world data-driven projects.

### Skills
- PostgreSQL
- SQL
- Power BI
- Python
- Data Visualization
- Dashboard Development
- AI Performance Analytics

GitHub:[ (https://github.com/AnandBakode008)](https://github.com/AnandBakode008)
LinkedIn:https://www.linkedin.com/in/anand-bakode/
