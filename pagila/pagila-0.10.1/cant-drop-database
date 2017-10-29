-- you need to replace target_database with the database you're trying to drop

--First, find the activities that are taken place against the target database, you can query the pg_stat_activityview as the following query:
	SELECT pid          
	FROM pg_stat_activity       
	WHERE datname = 'target_database';

--Second, terminate the active connections by issuing the following query:

	SELECT pg_terminate_backend (pg_stat_activity.pid)
	FROM pg_stat_activity
	WHERE pg_stat_activity.datname = 'target_database';

--then drop the database
	DROP DATABASE target_database;
