# [client]
default['percona']['client']['port']   = '3306'
default['percona']['client']['socket'] = '/var/run/mysqld/mysqld.sock'
default['percona']['client']['loose-default-character-set'] = 'utf8'

# [mysql]
default['percona']['mysql']['max_allowed_packet'] = '16M'
default['percona']['mysql']['user']               = 'root'
default['percona']['mysql']['password']           = 'pass'
default['percona']['mysql']['old_password']       = 'old_pass'

# [mysqldump]
default['percona']['mysqldump']['max_allowed_packet'] = '16M'

# [mysqld]
default['percona']['mysqld']['port']                   = '3306'
default['percona']['mysqld']['user']                   = 'mysql'
default['percona']['mysqld']['basedir']                = '/usr'
default['percona']['mysqld']['datadir']                = '/var/lib/mysql'
default['percona']['mysqld']['plugin-dir']             = '/usr/lib/mysql/plugin'
default['percona']['mysqld']['pid-file']               = '/var/run/mysqld/mysqld.pid'
default['percona']['mysqld']['socket']                 = '/var/run/mysqld/mysqld.sock'
default['percona']['mysqld']['language']               = '/usr/share/mysql/english'

default['percona']['mysqld']['slow-query-log-file']    = '/var/log/mysql/mysql-slow.log'
default['percona']['mysqld']['character-set-server']   = 'utf8'
default['percona']['mysqld']['skip_name_resolve']      = '1'



default['percona']['mysqld']['key_buffer']             = '64M'
default['percona']['mysqld']['delay_key_write']        = '1'
default['percona']['mysqld']['max_allowed_packet']     = '16M'
default['percona']['mysqld']['thread_cache_size']      = '128'
default['percona']['mysqld']['table_open_cache']       = '2048'
default['percona']['mysqld']['table_definition_cache'] = '400'

default['percona']['mysqld']['wait_timeout']           = '28800'
default['percona']['mysqld']['interactive_timeout']    = '28800'
default['percona']['mysqld']['net_read_timeout']       = '30'
default['percona']['mysqld']['net_write_timeout']      = '60'
default['percona']['mysqld']['long_query_time']        = '10'

default['percona']['mysqld']['query_cache_type']       = '1'
default['percona']['mysqld']['query_cache_size']       = '512M'
default['percona']['mysqld']['query_cache_limit']      = '4M'

default['percona']['mysqld']['server-id']              = '41627'

default['percona']['mysqld']['log_bin']                = '/var/log/mysql/mysql-bin.log'

default['percona']['mysqld']['binlog-ignore-db']       = 'mysql'
default['percona']['mysqld']['binlog_format']          = 'mixed'
default['percona']['mysqld']['max_binlog_size']        = '100M'
default['percona']['mysqld']['expire_logs_days']       = '10'



default['percona']['mysqld']['replicate-ignore-db']    = 'mysql'

default['percona']['mysqld']['read_only']              = '0'

default['percona']['mysqld']['tmpdir']                 = '/var/tmp'
default['percona']['mysqld']['max_connections']        = '1024'
default['percona']['mysqld']['max_connect_errors']     = '10000000'
default['percona']['mysqld']['open_files_limit']       = '2048'

default['percona']['mysqld']['max_heap_table_size']    = '64M'
default['percona']['mysqld']['sort_buffer_size']       = '64M'
default['percona']['mysqld']['join_buffer_size']       = '64M'
default['percona']['mysqld']['tmp_table_size']         = '64M'

default['percona']['mysqld']['innodb_buffer_pool_size']            = '64M'
default['percona']['mysqld']['innodb_data_file_path']              = 'ibdata1:10M:autoextend'
default['percona']['mysqld']['innodb_buffer_pool_instances']       = '1'
default['percona']['mysqld']['innodb_thread_concurrency']          = '16'
default['percona']['mysqld']['innodb_flush_log_at_trx_commit']     = '0'
default['percona']['mysqld']['innodb_additional_mem_pool_size']    = '32M'
default['percona']['mysqld']['innodb_log_buffer_size']             = '128M'
default['percona']['mysqld']['innodb_log_file_size']               = '100M'
default['percona']['mysqld']['innodb_log_files_in_group']          = '2'
default['percona']['mysqld']['innodb_lock_wait_timeout']           = '120'
default['percona']['mysqld']['innodb_file_format']                 = 'barracuda'
default['percona']['mysqld']['innodb_file_per_table']              = '1'
default['percona']['mysqld']['innodb_read_io_threads']             = '4'
default['percona']['mysqld']['innodb_write_io_threads']            = '4'
default['percona']['mysqld']['loose-innodb-kill-idle-transaction'] = '600'


default['percona']['mysqld']['transaction-isolation']              = 'REPEATABLE-READ'
default['percona']['mysqld']['auto_increment_increment']           = '1'
default['percona']['mysqld']['auto_increment_offset']              = '1'
default['percona']['mysqld']['log_warnings']                       = '1'

