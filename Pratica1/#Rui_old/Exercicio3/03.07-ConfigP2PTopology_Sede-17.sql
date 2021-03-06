-- Enabling the replication database
use master
exec sp_replicationdboption @dbname = N'ASI', @optname = N'publish', @value = N'true'
GO

exec [ASI].sys.sp_addlogreader_agent @job_login = N'MIRANDA-LAPTOP\Rui Miranda', @job_password = null, @publisher_security_mode = 1
GO
-- Adding the transactional publication
use [ASI]
exec sp_addpublication @publication = N'PublicacaoOcorrencias', @description = N'Peer-to-Peer publication of database ''ASI'' from Publisher ''MIRANDA-LAPTOP\SQL2012DEINST1''.', @sync_method = N'native', @retention = 0, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @repl_freq = N'continuous', @status = N'active', @independent_agent = N'true', @immediate_sync = N'true', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @allow_queued_tran = N'false', @allow_dts = N'false', @replicate_ddl = 1, @allow_initialize_from_backup = N'true', @enabled_for_p2p = N'true', @enabled_for_het_sub = N'false', @p2p_conflictdetection = N'true', @p2p_originator_id = 100
GO
exec sp_grant_publication_access @publication = N'PublicacaoOcorrencias', @login = N'sa'
GO
exec sp_grant_publication_access @publication = N'PublicacaoOcorrencias', @login = N'MIRANDA-LAPTOP\Rui Miranda'
GO
exec sp_grant_publication_access @publication = N'PublicacaoOcorrencias', @login = N'NT SERVICE\SQLAgent$SQL2012DEINST1'
GO
exec sp_grant_publication_access @publication = N'PublicacaoOcorrencias', @login = N'NT SERVICE\Winmgmt'
GO
exec sp_grant_publication_access @publication = N'PublicacaoOcorrencias', @login = N'NT Service\MSSQL$SQL2012DEINST1'
GO
exec sp_grant_publication_access @publication = N'PublicacaoOcorrencias', @login = N'NT SERVICE\SQLWriter'
GO
exec sp_grant_publication_access @publication = N'PublicacaoOcorrencias', @login = N'distributor_admin'
GO

-- Adding the transactional articles
use [ASI]
exec sp_addarticle @publication = N'PublicacaoOcorrencias', @article = N'ocorrencias', @source_owner = N'dbo', @source_object = N'ocorrencias', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008035DDF, @identityrangemanagementoption = N'manual', @destination_table = N'ocorrencias', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboocorrencias822694938]', @del_cmd = N'CALL [sp_MSdel_dboocorrencias822694938]', @upd_cmd = N'SCALL [sp_MSupd_dboocorrencias822694938]'
GO

-- Adding the transactional subscriptions
use [ASI]
exec sp_addsubscription @publication = N'PublicacaoOcorrencias', @subscriber = N'MIRANDA-LAPTOP\SQL2012DEINST2', @destination_db = N'ASI', @subscription_type = N'Push', @sync_type = N'replication support only', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'PublicacaoOcorrencias', @subscriber = N'MIRANDA-LAPTOP\SQL2012DEINST2', @subscriber_db = N'ASI', @job_login = N'MIRANDA-LAPTOP\Rui Miranda', @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO
use [ASI]
exec sp_addsubscription @publication = N'PublicacaoOcorrencias', @subscriber = N'MIRANDA-LAPTOP\SQL2012DEINST3', @destination_db = N'ASI', @subscription_type = N'Push', @sync_type = N'replication support only', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'PublicacaoOcorrencias', @subscriber = N'MIRANDA-LAPTOP\SQL2012DEINST3', @subscriber_db = N'ASI', @job_login = N'MIRANDA-LAPTOP\Rui Miranda', @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO

