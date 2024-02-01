SELECT  worker.name, worker.salary
FROM worker
WHERE SALARY =  (SELECT MAX(SALARY) FROM worker);