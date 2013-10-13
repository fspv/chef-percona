#[client]
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

default['percona']['mysqld']['binlog-ignore-db']       = ['test123']
default['percona']['mysqld']['binlog_format']          = 'mixed'
default['percona']['mysqld']['max_binlog_size']        = '100M'
default['percona']['mysqld']['expire_logs_days']       = '10'



default['percona']['mysqld']['replicate-ignore-db']    = ['test123']

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

# [other]
default['percona']['database_default_character_set']               = 'utf8'
default['percona']['allowed_character_sets'] = ["big5","dec8","cp850","hp8","koi8r","latin1","latin2","swe7","ascii","ujis","sjis","hebrew","tis620","euckr","koi8u","gb2312","greek","cp1250","gbk","latin5","armscii8","utf8","ucs2","cp866","keybcs2","macce","macroman","cp852","latin7","utf8mb4","cp1251","utf16","cp1256","cp1257","utf32","binary","geostd8","cp932","eucjpms"]
default['percona']['database_default_collate']                     = 'utf8_general_ci'
default['percona']['allowed_collations']=["big5_chinese_ci","big5_bin","dec8_swedish_ci","dec8_bin","cp850_general_ci","cp850_bin","hp8_english_ci","hp8_bin","koi8r_general_ci","koi8r_bin","latin1_german1_ci","latin1_swedish_ci","latin1_danish_ci","latin1_german2_ci","latin1_bin","latin1_general_ci","latin1_general_cs","latin1_spanish_ci","latin2_czech_cs","latin2_general_ci","latin2_hungarian_ci","latin2_croatian_ci","latin2_bin","swe7_swedish_ci","swe7_bin","ascii_general_ci","ascii_bin","ujis_japanese_ci","ujis_bin","sjis_japanese_ci","sjis_bin","hebrew_general_ci","hebrew_bin","tis620_thai_ci","tis620_bin","euckr_korean_ci","euckr_bin","koi8u_general_ci","koi8u_bin","gb2312_chinese_ci","gb2312_bin","greek_general_ci","greek_bin","cp1250_general_ci","cp1250_czech_cs","cp1250_croatian_ci","cp1250_bin","cp1250_polish_ci","gbk_chinese_ci","gbk_bin","latin5_turkish_ci","latin5_bin","armscii8_general_ci","armscii8_bin","utf8_general_ci","utf8_bin","utf8_unicode_ci","utf8_icelandic_ci","utf8_latvian_ci","utf8_romanian_ci","utf8_slovenian_ci","utf8_polish_ci","utf8_estonian_ci","utf8_spanish_ci","utf8_swedish_ci","utf8_turkish_ci","utf8_czech_ci","utf8_danish_ci","utf8_lithuanian_ci","utf8_slovak_ci","utf8_spanish2_ci","utf8_roman_ci","utf8_persian_ci","utf8_esperanto_ci","utf8_hungarian_ci","utf8_sinhala_ci","utf8_general_mysql500_ci","utf8_general50_ci","ucs2_general_ci","ucs2_bin","ucs2_unicode_ci","ucs2_icelandic_ci","ucs2_latvian_ci","ucs2_romanian_ci","ucs2_slovenian_ci","ucs2_polish_ci","ucs2_estonian_ci","ucs2_spanish_ci","ucs2_swedish_ci","ucs2_turkish_ci","ucs2_czech_ci","ucs2_danish_ci","ucs2_lithuanian_ci","ucs2_slovak_ci","ucs2_spanish2_ci","ucs2_roman_ci","ucs2_persian_ci","ucs2_esperanto_ci","ucs2_hungarian_ci","ucs2_sinhala_ci","ucs2_general50_ci","cp866_general_ci","cp866_bin","keybcs2_general_ci","keybcs2_bin","macce_general_ci","macce_bin","macroman_general_ci","macroman_bin","cp852_general_ci","cp852_bin","latin7_estonian_cs","latin7_general_ci","latin7_general_cs","latin7_bin","utf8mb4_general_ci","utf8mb4_bin","utf8mb4_unicode_ci","utf8mb4_icelandic_ci","utf8mb4_latvian_ci","utf8mb4_romanian_ci","utf8mb4_slovenian_ci","utf8mb4_polish_ci","utf8mb4_estonian_ci","utf8mb4_spanish_ci","utf8mb4_swedish_ci","utf8mb4_turkish_ci","utf8mb4_czech_ci","utf8mb4_danish_ci","utf8mb4_lithuanian_ci","utf8mb4_slovak_ci","utf8mb4_spanish2_ci","utf8mb4_roman_ci","utf8mb4_persian_ci","utf8mb4_esperanto_ci","utf8mb4_hungarian_ci","utf8mb4_sinhala_ci","cp1251_bulgarian_ci","cp1251_ukrainian_ci","cp1251_bin","cp1251_general_ci","cp1251_general_cs","utf16_general_ci","utf16_bin","utf16_unicode_ci","utf16_icelandic_ci","utf16_latvian_ci","utf16_romanian_ci","utf16_slovenian_ci","utf16_polish_ci","utf16_estonian_ci","utf16_spanish_ci","utf16_swedish_ci","utf16_turkish_ci","utf16_czech_ci","utf16_danish_ci","utf16_lithuanian_ci","utf16_slovak_ci","utf16_spanish2_ci","utf16_roman_ci","utf16_persian_ci","utf16_esperanto_ci","utf16_hungarian_ci","utf16_sinhala_ci","cp1256_general_ci","cp1256_bin","cp1257_lithuanian_ci","cp1257_bin","cp1257_general_ci","utf32_general_ci","utf32_bin","utf32_unicode_ci","utf32_icelandic_ci","utf32_latvian_ci","utf32_romanian_ci","utf32_slovenian_ci","utf32_polish_ci","utf32_estonian_ci","utf32_spanish_ci","utf32_swedish_ci","utf32_turkish_ci","utf32_czech_ci","utf32_danish_ci","utf32_lithuanian_ci","utf32_slovak_ci","utf32_spanish2_ci","utf32_roman_ci","utf32_persian_ci","utf32_esperanto_ci","utf32_hungarian_ci","utf32_sinhala_ci","binary","geostd8_general_ci","geostd8_bin","cp932_japanese_ci","cp932_bin","eucjpms_japanese_ci","eucjpms_bin"]
