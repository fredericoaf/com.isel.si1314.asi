use [ASI]
exec sp_replicationdboption @dbname = N'ASI', @optname = N'publish', @value = N'true'
GO
use [ASI]
exec [ASI].sys.sp_addlogreader_agent @job_login = N'MIRANDA-LAPTOP\Rui Miranda', @job_password = null, @publisher_security_mode = 1, @job_name = null
GO
-- Adding the transactional publication
use [ASI]
exec sp_addpublication @publication = N'PublicacaoOcorrencias', @description = N'Peer-to-Peer publication of database ''ASI'' from Publisher ''MIRANDA-LAPTOP\SQL2012DEINST1''.', @sync_method = N'native', @retention = 0, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @repl_freq = N'continuous', @status = N'active', @independent_agent = N'true', @immediate_sync = N'true', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @allow_queued_tran = N'false', @allow_dts = N'false', @replicate_ddl = 1, @allow_initialize_from_backup = N'true', @enabled_for_p2p = N'true', @enabled_for_het_sub = N'false', @p2p_conflictdetection = N'true', @p2p_originator_id = 100
GO


use [ASI]
exec sp_addarticle @publication = N'PublicacaoOcorrencias', @article = N'ocorrencias', @source_owner = N'dbo', @source_object = N'ocorrencias', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000008035DDB, @identityrangemanagementoption = N'manual', @destination_table = N'ocorrencias', @destination_owner = N'dbo', @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_dboocorrencias', @del_cmd = N'CALL sp_MSdel_dboocorrencias', @upd_cmd = N'SCALL sp_MSupd_dboocorrencias'
GO




