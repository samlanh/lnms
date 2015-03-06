<?php

class Loan_Model_DbTable_DbTransferCo extends Zend_Db_Table_Abstract
{
	protected $_name = 'ln_tranfser_co';
    public function getcoinfo(){
    	$db = $this->getAdapter();
    	$sql = 'SELECT m.`member_id`,`group_id`,(SELECT (SELECT c.`co_code` FROM `ln_co` AS c WHERE c.co_id = g.co_id AND STATUS = 1 LIMIT 1) 
				FROM `ln_loan_group` AS g WHERE g.g_id = m.`group_id` AND STATUS = 1 LIMIT 1) AS co_code ,
				(SELECT (SELECT c.`co_khname` FROM `ln_co` AS c WHERE c.co_id = g.co_id AND STATUS = 1 LIMIT 1) 
				FROM `ln_loan_group` AS g WHERE g.g_id = m.`group_id` AND STATUS = 1 LIMIT 1) AS co_khname
				FROM `ln_loan_member` AS m ';
    	return $db->fetchAll($sql);
    }
    public function getAllinfoCo(){
    	
    }
    public function insertTransfer($data){
    	$db = $this->getAdapter();
    	$db->beginTransaction();
    	try {
	    	$_data_arr = array(
	    		'branch_id'=> $data['branch_name'],
	    		'code_from'=> $data['co_code'],
	    		'code_to'=> $data['to_co_code'],
	    		'from'=> $data['formc_co'],
	    		'to'=> $data['to_co'],
	    		'status'=> $data['status'],
	    		'date'=> $data['Date'],
	    	);
	    	$this->insert($_data_arr);	    	
	    	$this->_name ="ln_loanmember_funddetail";
	    	$_arr_fund = array(
	    			'member_id'=>$data['to_co_code'],
	    			'collect_by'=>$data['co_code'],
	    			'is_completed'=> 0,
	    			'status'=> $data['status'],
	    	);
	    	$where = "member_id = ".$data['co_code'];
	    	$this->update($_arr_fund, $where);
	    	$db->commit();
    	}catch (Exception $e){
    		Application_Form_FrmMessage::message("INSERT_FAIL");
    		$err =$e->getMessage();
    		Application_Model_DbTable_DbUserLog::writeMessageError($err);
    		$db->rollBack();
    	}
    }
  
}

