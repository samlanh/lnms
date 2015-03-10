<?php

class Other_Model_DbTable_DbHoliday extends Zend_Db_Table_Abstract
{

    protected $_name = 'ln_holiday';
    public function getUserId(){
    	$session_user=new Zend_Session_Namespace('auth');
    	return $session_user->user_id;
    	 
    }
	public function addHoliday($_data){
		try {
		$_arr=array(
				'holiday_name'=> $_data['holiday_name'],
				'amount_day'  => $_data['amount_day'],
				'start_date'  => $_data['start_date'],
				'end_date'	  => $_data['end_date'],
				'status'	  => $_data['status'],
				'modify_date' => date('Y-m-d'),
				'note' 		  => $_data['note'],
				'user_id'	  => $this->getUserId()
		);
		if(!empty($_data['id'])){
			$where = 'id = '.$_data['id'];
			return  $this->update($_arr, $where);
		}else{
			return  $this->insert($_arr);
		}
		}catch(Exception $e){
			echo $e->getMessage();
		}
	}
	public function getHolidayById($id){
		$db = $this->getAdapter();
		$sql=" SELECT * FROM $this->_name WHERE id = ".$db->quote($id);
		$sql.=" LIMIT 1 ";
		$row=$db->fetchRow($sql);
		return $row;
	}
	function getAllHoliday($search=null){
		$db = $this->getAdapter();
		$sql = "SELECT id,holiday_name,amount_day,start_date,end_date,note,status,
				(SELECT first_name FROM rms_users WHERE id=user_id LIMIT 1) AS user_name
				FROM $this->_name ";
		$where = ' WHERE 1 ';
		if($search['search_status']>-1){
			$where.= " AND status = ".$search['search_status'];
		}
		if(!empty($search['adv_search'])){
			$s_where=array();
			$s_search=$search['adv_search'];
			$s_where[]= " amount_day LIKE '%{$s_search}%'";
			$s_where[]=" holiday_name LIKE '%{$s_search}%'";
			$s_where[]= " note LIKE '%{$s_search}%'";
			$where.=' AND ('.implode(' OR ', $s_where).')';
			//$where.=' AND ('.implode(' OR ',$s_where).')';
		}
		return $db->fetchAll($sql.$where);	
	}	
}

