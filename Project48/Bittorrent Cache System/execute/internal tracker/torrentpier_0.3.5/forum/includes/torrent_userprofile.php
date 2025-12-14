<?php

if (!defined('IN_PHPBB') || !defined('IN_VIEWPROFILE'))
{
	die('Hacking attempt');
	exit;
}

if (!$profiledata['user_id'] || $profiledata['user_id'] == ANONYMOUS)
{
	message_die(GENERAL_ERROR, 'Invalid user_id');
}

$seeding = $leeching = array();

$profile_user_id = intval($profiledata['user_id']);
$current_time = (isset($_GET['time']) && $_GET['time'] == 'all') ? 0 : time();

// Get username
if (!$username = $profiledata['username'])
{
	message_die(GENERAL_ERROR, 'Tried obtaining data for a non-existent user');
}

if ($profile_user_id == $userdata['user_id'])
{
	$template->assign_vars(array(
		'EDIT_PROF'      => TRUE,
		'L_EDIT_PROF'    => $lang['Edit_profile'],
		'EDIT_PROF_HREF' => append_sid("profile.$phpEx?mode=editprofile")
	));
}
else
{
	$template->assign_vars(array('EDIT_PROF' => FALSE));
}

// Get up/down stat & auth_key
$sql = 'SELECT *
	FROM '. BT_USERS_TABLE ."
	WHERE user_id = $profile_user_id";

if (!$result = $db->sql_query($sql))
{
	message_die(GENERAL_ERROR, 'Could not query users torrent profile information', '', __LINE__, __FILE__, $sql);
}

$user_tor_info = $db->sql_fetchrow($result);

$total_uploaded   = (@$user_tor_info['u_up_total']) ? $user_tor_info['u_up_total'] : 0;
$total_downloaded = (@$user_tor_info['u_down_total']) ? $user_tor_info['u_down_total'] : 0;
$up_down_ratio    = ($total_downloaded) ? round(($total_uploaded / $total_downloaded), 2) : '';
$auth_key         = (@$user_tor_info['auth_key']) ? $user_tor_info['auth_key'] : '';

if ($userdata['user_level'] == ADMIN)
{
	$template->assign_block_vars('switch_auth_key', array());
	$template->assign_vars(array('AUTH_KEY' => $auth_key));
}

$template->assign_vars(array(
	'TOTAL_UPLOADED'   => humn_size($total_uploaded),
	'TOTAL_DOWNLOADED' => humn_size($total_downloaded),
	'UP_DOWN_RATIO'    => $up_down_ratio
));

// Auth
$ignore_forum_sql = ($f = user_not_auth_forums(AUTH_VIEW)) ? "AND f.forum_id NOT IN($f)" : '';

// Get users active torrents
$sql = 'SELECT f.forum_id, f.forum_name, t.topic_id, t.topic_title, tr.ip, tr.port,
		MAX(tr.seeder) as seeder, MAX(tr.complete_percent) as complete_percent, MAX(tr.speed_up) as speed_up, MAX(tr.speed_down) as speed_down
	FROM '. FORUMS_TABLE .' f, '. TOPICS_TABLE .' t, '. BT_TRACKER_TABLE .' tr, '. BT_TORRENTS_TABLE ." tor
	WHERE tr.user_id = $profile_user_id
		AND tr.expire_time > $current_time
		AND tr.torrent_id = tor.torrent_id
		AND tor.topic_id = t.topic_id
		AND t.forum_id = f.forum_id
				$ignore_forum_sql
	GROUP BY tr.torrent_id
	ORDER BY f.forum_name, t.topic_title";

if (!$result = $db->sql_query($sql))
{
	message_die(GENERAL_ERROR, 'Could not query users torrent profile information', '', __LINE__, __FILE__, $sql);
}

if ($rowset = @$db->sql_fetchrowset($result))
{
	$db->sql_freeresult($result);
	$rowset_count = count($rowset);

	for ($i=0; $i<$rowset_count; $i++)
	{
		if ($rowset[$i]['seeder'])
		{
			$seeding[] = $rowset[$i];
		}
		else
		{
			$leeching[] = $rowset[$i];
		}
	}
	unset($rowset);
}

if ($seeding_count = count($seeding))
{
	$template->assign_block_vars('seed', array());

	for ($i=0; $i<$seeding_count; $i++)
	{
		$template->assign_block_vars('seed.seedrow', array(
			'FORUM_NAME'   => $seeding[$i]['forum_name'],
			'TOPIC_TITLE'  => $seeding[$i]['topic_title'],
			'U_VIEW_FORUM' => "viewforum.$phpEx?". POST_FORUM_URL .'='. $seeding[$i]['forum_id'],
			'U_VIEW_TOPIC' => "viewtopic.$phpEx?". POST_TOPIC_URL .'='. $seeding[$i]['topic_id'] .'&amp;spmode=full#seeders'
		));
	}
}
else
{
	$template->assign_block_vars('switch_seeding_none', array());
}

if ($leeching_count = count($leeching))
{
	$template->assign_block_vars('leech', array());

	for ($i=0; $i<$leeching_count; $i++)
	{
		$template->assign_block_vars('leech.leechrow', array(
			'FORUM_NAME'       => $leeching[$i]['forum_name'],
			'TOPIC_TITLE'      => $leeching[$i]['topic_title'],
			'U_VIEW_FORUM'     => "viewforum.$phpEx?". POST_FORUM_URL .'='. $leeching[$i]['forum_id'],
			'U_VIEW_TOPIC'     => "viewtopic.$phpEx?". POST_TOPIC_URL .'='. $leeching[$i]['topic_id'] .'&amp;spmode=full#leechers',
			'COMPLETE_PERCENT' => $leeching[$i]['complete_percent']
		));
	}
}
else
{
	$template->assign_block_vars('switch_leeching_none', array());
}

$template->assign_vars(array(
	'USERNAME'   => $username,
	'L_NONE'     => $lang['None'],
	'L_FORUM'    => $lang['Forum'],
	'L_TOPICS'   => $lang['Topics'],
	'L_SEEDING'  => '<b>'. $lang['Seeding'] .'</b>'. (($seeding_count) ? "<br />[ <b>$seeding_count</b> ]" : ''),
	'L_LEECHING' => '<b>'. $lang['Leeching'] .'</b>'. (($leeching_count) ? "<br />[ <b>$leeching_count</b> ]" : ''),

	'L_VIEW_TOR_PROF'  => sprintf($lang['Viewing_user_bt_profile'], $username),
	'L_CUR_ACTIVE_DLS' => $lang['Cur_active_dls'],
	'SEED_ROWSPAN'     => ($seeding_count) ? 'rowspan="'. ($seeding_count + 1) .'"' : '',
	'LEECH_ROWSPAN'    => ($leeching_count) ? 'rowspan="'. ($leeching_count + 1) .'"' : ''
));

$s_link_start = "search.$phpEx?search_id=dl&amp;dl_status=";
$s_link_end   = "&amp;dl_uid=$profile_user_id";

$template->assign_vars(array(
	'L_SEARCH_DL'          => $lang['Search_DL'],
	'L_SEARCH_DL_WILL'     => $lang['Search_DL_Will'],
	'L_SEARCH_DL_DOWN'     => $lang['Search_DL_Down'],
	'L_SEARCH_DL_COMPLETE' => $lang['Search_DL_Complete'],
	'L_SEARCH_DL_CANCEL'   => $lang['Search_DL_Cancel'],

	'U_SEARCH_DL_WILL'     => $s_link_start . DL_STATUS_WILL     . $s_link_end,
	'U_SEARCH_DL_DOWN'     => $s_link_start . DL_STATUS_DOWN     . $s_link_end,
	'U_SEARCH_DL_COMPLETE' => $s_link_start . DL_STATUS_COMPLETE . $s_link_end,
	'U_SEARCH_DL_CANCEL'   => $s_link_start . DL_STATUS_CANCEL   . $s_link_end
));

$template->assign_vars(array(
	'U_TORRENT_PROFILE' => append_sid("profile.$phpEx?mode=viewprofile&amp;u=". $profiledata['user_id']) . '#torrent',
	'L_TORRENT_PROFILE' => $lang['View_torrent_profile']
));

?>