--Table 1 Agent 
create table Agent(Agent_ID varchar,
Agent_Name varchar,
Model_Used varchar,
Current_Version varchar,
Created_At date,
Status varchar);

copy Agent from 'D:\Projects\Group Projects\Ai Agent\CSV Files\Agent.csv' delimiter ',' csv header;

--Table 2 Users 
create table Users(user_id varchar,
name varchar,
email varchar,
role varchar,
created_at decimal,
user_satisfaction varchar);

copy Users from 'D:\Projects\Group Projects\Ai Agent\CSV Files\Users.csv' delimiter ',' csv header;


--Table 3  Performance_Logs

create table Performance_Logs(
log_id varchar,
interaction_id varchar,
latency_ms int,
accuracy_score float,
sentiment varchar,
error_type varchar,
severity_level varchar,
flagged varchar);

copy Performance_Logs from 'D:\Projects\Group Projects\Ai Agent\CSV Files\Performance_Logs.csv' delimiter ',' csv header;


--Table 4  Interactions
create table Interactions(interaction_id varchar,session_id varchar,agent_id varchar,user_query text,agent_response text,
tokens_in int,tokens_out int,occurred_at date);

COPY Interactions
FROM 'D:\Projects\Group Projects\Ai Agent\CSV Files\Interactions.csv'
DELIMITER ','
CSV
HEADER
ENCODING 'WIN1252';

--Table 5 Prompt_Templates


create table Prompt_Templates(
template_id varchar,
Agent_Id varchar,	user_id varchar,
template_name varchar,
content varchar,
applicable_agent varchar,
updated_at DATE
);
SET datestyle = 'MDY';
COPY Prompt_Templates FROM 'D:\Projects\Group Projects\Ai Agent\CSV Files\Prompt_Templates.csv' DELIMITER ',' csv header;

-- Table 6 Sessions
CREATE TABLE Sessions (
    session_id varchar PRIMARY KEY,
    user_id varchar,
    agent_id varchar,
    start_time TIME,
    end_time TIME,
    response_time varchar,
    total_queries INT
);
copy Sessions 
FROM 'D:\Projects\Group Projects\Ai Agent\CSV Files\Sessions01.csv'
DELIMITER ','
CSV HEADER;


-- =============================================================================================================================
-- ==============================================================================================================================

-- SQL Questions and  KPIS

-- ==============================================================================================================================
-- ==============================================================================================================================


-- Join All Tables 
Select name from users as u 
join sessions as s on u.user_id=s.user_id
join prompt_templates as pt on s.user_id=pt.user_id
join agent as a on pt.agent_id=a.agent_id
join interactions as i on a.agent_id=i.agent_id
join performance_logs as pl on i.interaction_id= pl.interaction_id;

--1. Find the Average Response time of each AI Agent
select a.agent_name, avg(response_time) as avg_response_time from agent a join sessions s on a.agent_id=s.agent_id
group by a.agent_name;


--2. Find the top 10 Agents with the Highest accuracy score
select a.agent_name,a.model_used,pl.accuracy_score from agent a join interactions i on a.agent_id=i.agent_id
join performance_logs as pl on i.interaction_id=pl.interaction_id
order by accuracy_score desc
limit 10;


--3. Show the Monthly Performance Summary of each AI Agent in 2025
select agent_name,model_used,status,created_at from agent where created_at between '2025-01-01' and '2025-12-31'

--4. Find the top 15 ratings of each AI Project,
select a.agent_name, a.current_version, a.model_used,s.response_time from agent as a
join sessions as s 
on a.agent_id=s.agent_id order by response_time desc limit 15;


--5. Find an Agent with excellent feedback records
select a.agent_name, a.model_used,s.response_time,u.user_satisfaction from agent as a
join sessions as s on a.agent_id=s.agent_id
join users as u on s.user_id = u.user_id
where u.user_satisfaction = 'Excellent';


--6. Find Users who have interacted the most
select 
    u.user_id,u.name,
    count(i.interaction_id) as interaction_count
from interactions i
join sessions s on i.session_id = s.session_id
join users u on s.user_id = u.user_id
group by u.user_id,u.name
order by interaction_count desc
limit 1;

--7. s.total_queries > 1000 and a.agent_name = 'NanoEngine'
select u.user_id,u.name,u.role,a.agent_name,pt.template_name,pt.applicable_agent,pt.content,s.total_queries from agent a 
join prompt_templates pt on a.agent_id = pt.agent_id 
join users u on pt.user_id = u.user_id
join sessions s on u.user_id = s.user_id 
where s.total_queries > 1000 and a.agent_name = 'NanoEngine'
group by u.user_id,u.name,u.role,a.agent_name,pt.template_name,pt.applicable_agent,pt.content,s.total_queries 
order by user_id asc;

--8. Find the agent response and user query where tokens in and tokens out are the same
select a.agent_id , a.agent_name, i.user_query, i.agent_response ,i.tokens_in,i.tokens_out from agent a 
join interactions i on i.agent_id = a.agent_id
where tokens_in = tokens_out;

--9. Find the agent whose performance is positive and severity level = high
select a.agent_name,pl.sentiment,pl.error_type,pl.severity_level from agent a
join interactions i on a.agent_id = i.agent_id 
join performance_logs pl on i.interaction_id = pl.interaction_id
where severity_level ='High' and sentiment ='Positive';

--10. Find the agent and model used whose status is disabled
select agent_name, model_used,current_version,status from agent where status = 'Disabled';


