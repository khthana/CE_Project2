UPDATE `phpbb_groups` SET `group_description` = '' WHERE `group_description` = 'Personal User';
DELETE FROM `phpbb_bt_config` WHERE `config_name` = 'calc_ann_intv';
DELETE FROM `phpbb_bt_config` WHERE `config_name` = 'max_ann_rate';
ALTER TABLE `phpbb_bt_users_dl_status` ADD `compl_count` TINYINT(1) UNSIGNED DEFAULT '0' NOT NULL AFTER `user_status`;
UPDATE `phpbb_bt_users_dl_status` SET `compl_count` = 1 WHERE `user_status` = 2;
UPDATE `phpbb_config` SET `config_value` = '.0.17' WHERE `config_name` = 'version' LIMIT 1;
UPDATE `phpbb_attachments_config` SET `config_value` = '2.3.14' WHERE `config_name` = 'attach_version' LIMIT 1;
