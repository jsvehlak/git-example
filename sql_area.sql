SET LINESIZE 500
SET PAGESIZE 1000
SET FEEDBACK OFF

SELECT s.sid,
       s.status "Status",
       p.spid "Process",
       s.schemaname "Schema Name",
       s.osuser "OS User",
       Substr(a.sql_text,1,120) "SQL Text",
       s.program "Program"
FROM   v$session s 
       left outer join v$sqlarea a ON s.sql_hash_value = a.hash_value and s.sql_address    = a.address
       LEFT JOIN v$process p on s.paddr= p.addr;
       
SET PAGESIZE 14
SET FEEDBACK ON