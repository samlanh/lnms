<?php

class Loan_Model_DbTable_DbLoanILPayment extends Zend_Db_Table_Abstract
{

    protected $_name = 'ln_client_receipt_money';
    public function getUserId(){
    	$session_user=new Zend_Session_Namespace('auth');
    	return $session_user->user_id;
    	 
    }
    public function getAllIndividuleLoan($search){
		$start_date = $search['start_date'];
    	$end_date = $search['end_date'];
    	
    	$db = $this->getAdapter();
    	$sql = "SELECT lcrm.`id`,
					lcrm.`receipt_no`,
    				(SELECT c.`loan_number` FROM `ln_client_receipt_money_detail` AS c WHERE c.`crm_id` = lcrm.`id` LIMIT 1) AS loan_number,
					
					(SELECT c.`name_kh` FROM `ln_client` AS c WHERE c.`client_id`=lcrm.`group_id`) AS team_group ,
					lcrm.`total_principal_permonth`,
					lcrm.`total_payment`,
					lcrm.`recieve_amount`,
					lcrm.`total_interest`,
					lcrm.`penalize_amount`,
					lcrm.`date_pay`,
					lcrm.`date_input`,
				    (SELECT co.`co_khname` FROM `ln_co` AS co WHERE co.`co_id`=lcrm.`co_id`) AS co_name,
    				(SELECT b.`branch_namekh` FROM `ln_branch` AS b WHERE b.`br_id`=lcrm.`branch_id`) AS branch
				FROM `ln_client_receipt_money` AS lcrm WHERE lcrm.is_group=0";
    	$where ='';
    	if(!empty($search['advance_search'])){
    		//print_r($search);
    		$s_where = array();
    		$s_search = $search['advance_search'];
    		$s_where[] = "lcrm.`loan_number` LIKE '%{$s_search}%'";
    		$s_where[] = " lcrm.`receipt_no` LIKE '%{$s_search}%'";
    		
    		$where .=' AND ('.implode(' OR ',$s_where).')';
    	}
    	if($search['status']!=""){
    		$where.= " AND status = ".$search['status'];
    	}
    	
    	if(!empty($search['start_date']) or !empty($search['end_date'])){
    		$where.=" AND lcrm.`date_input` BETWEEN '$start_date' AND '$end_date'";
    	}
    	if($search['client_name']>0){
    		$where.=" AND lcrm.`group_id`= ".$search['client_name'];
    	}
    	if($search['branch_id']>0){
    		$where.=" AND lcrm.`branch_id`= ".$search['branch_id'];
    	}
    	if($search['co_id']>0){
    		$where.=" AND lcrm.`co_id`= ".$search['co_id'];
    	}
    	if($search['paymnet_type']>0){
    		$where.=" AND lcrm.`payment_option`= ".$search['paymnet_type'];
    	}
    	
    	//$where='';
    	$order = " ORDER BY receipt_no DESC";
    	//echo $sql.$where.$order;
    	return $db->fetchAll($sql.$where.$order);
    }
    public function getAllQuickIndividuleLoan($search){
    	$start_date = $search['start_date'];
    	$end_date = $search['end_date'];
    	 
    	$db = $this->getAdapter();
    	$sql = "SELECT lcrm.`id`,
    				(SELECT b.`branch_namekh` FROM `ln_branch` AS b WHERE b.`br_id`=lcrm.`branch_id`) AS branch,
    				(SELECT co.`co_khname` FROM `ln_co` AS co WHERE co.`co_id`=lcrm.`co_id`) AS co_name,
					lcrm.`receipt_no`,
					lcrm.`total_principal_permonth`,
					lcrm.`total_payment`,
					lcrm.`recieve_amount`,
					lcrm.`total_interest`,
					lcrm.`penalize_amount`,
					lcrm.`date_input`
				FROM `ln_client_receipt_money` AS lcrm WHERE lcrm.is_group=2";
    	$where ='';
    	if(!empty($search['advance_search'])){
    		//print_r($search);
    		$s_where = array();
    		$s_search = $search['advance_search'];
    		$s_where[] = "lcrm.`loan_number` LIKE '%{$s_search}%'";
    		$s_where[] = " lcrm.`receipt_no` LIKE '%{$s_search}%'";
    
    		$where .=' AND ('.implode(' OR ',$s_where).')';
    	}
    	if($search['status']!=""){
    		$where.= " AND status = ".$search['status'];
    	}
    	 
    	if(!empty($search['start_date']) or !empty($search['end_date'])){
    		$where.=" AND lcrm.`date_input` BETWEEN '$start_date' AND '$end_date'";
    	}
    	if($search['client_name']>0){
    		$where.=" AND lcrm.`group_id`= ".$search['client_name'];
    	}
    	if($search['branch_id']>0){
    		$where.=" AND lcrm.`branch_id`= ".$search['branch_id'];
    	}
    	if($search['co_id']>0){
    		$where.=" AND lcrm.`co_id`= ".$search['co_id'];
    	}
    	if($search['paymnet_type']>0){
    		$where.=" AND lcrm.`payment_option`= ".$search['paymnet_type'];
    	}
    	 
    	//$where='';
    	$order = " ORDER BY receipt_no DESC";
    	//echo $sql.$where.$order;
    	return $db->fetchAll($sql.$where.$order);
    }
	function getIlPaymentByID($id){
		$db = $this->getAdapter();
		$sql="SELECT 
				(SELECT lcrm.`date_input` FROM `ln_client_receipt_money` AS lcrm,`ln_client_receipt_money_detail` AS lcrmd WHERE lcrm.`id`!=$id AND lcrmd.`crm_id`=lcrm.`id` AND lcrm.`loan_number`=(SELECT `loan_number` FROM `ln_client_receipt_money_detail` WHERE `crm_id`=$id LIMIT 1) ORDER BY lcrm.`date_input` DESC LIMIT 1) AS last_paydate ,
				  (SELECT crmd.`loan_number` FROM `ln_client_receipt_money_detail` AS crmd WHERE crm.`id`=crmd.`crm_id` LIMIT 1) AS loan_numbers,
				  crm.*,
				  (SELECT lm.amount_collect_principal FROM `ln_loan_member` AS lm WHERE lm.`loan_number`=(SELECT `loan_number` FROM `ln_client_receipt_money_detail` WHERE `crm_id`=$id LIMIT 1) LIMIT 1) AS amount_term,
				  (SELECT lm.`collect_typeterm` FROM `ln_loan_member` AS lm WHERE lm.`loan_number`=(SELECT `loan_number` FROM `ln_client_receipt_money_detail` WHERE `crm_id`=$id LIMIT 1) LIMIT 1) AS collect_typeterm,
				  (SELECT lm.`interest_rate` FROM `ln_loan_member` AS lm WHERE lm.`loan_number`=(SELECT `loan_number` FROM `ln_client_receipt_money_detail` WHERE `crm_id`=$id LIMIT 1) LIMIT 1) AS `interest_rate`,
				  (SELECT lm.`total_capital` FROM `ln_loan_member` AS lm WHERE lm.`loan_number`=(SELECT `loan_number` FROM `ln_client_receipt_money_detail` WHERE `crm_id`=$id LIMIT 1) LIMIT 1) AS `total_capital`,
				  (SELECT g.`date_release` FROM `ln_loan_group` AS g,`ln_loan_member` AS lm WHERE g.`g_id`=lm.`group_id` AND lm.`loan_number` = (SELECT `loan_number` FROM `ln_client_receipt_money_detail` WHERE `crm_id`=$id LIMIT 1) LIMIT 1) AS date_release,
				  (SELECT g.`level` FROM `ln_loan_group` AS g,`ln_loan_member` AS lm WHERE g.`g_id`=lm.`group_id` AND lm.`loan_number` = (SELECT `loan_number` FROM `ln_client_receipt_money_detail` WHERE `crm_id`=$id LIMIT 1) LIMIT 1) AS level,
				  (SELECT g.`total_duration` FROM `ln_loan_group` AS g,`ln_loan_member` AS lm WHERE g.`g_id`=lm.`group_id` AND lm.`loan_number` = (SELECT `loan_number` FROM `ln_client_receipt_money_detail` WHERE `crm_id`=$id LIMIT 1) LIMIT 1) AS total_duration,
				  (SELECT g.`payment_method` FROM `ln_loan_group` AS g,`ln_loan_member` AS lm WHERE g.`g_id`=lm.`group_id` AND lm.`loan_number` = (SELECT `loan_number` FROM `ln_client_receipt_money_detail` WHERE `crm_id`=$id LIMIT 1) LIMIT 1) AS payment_method
				FROM
				  `ln_client_receipt_money` AS crm
				  
				WHERE crm.id =$id";
		return $db->fetchRow($sql);
	}
	public function getIlDetail($id){
		$db = $this->getAdapter();
		$sql="SELECT 
					(SELECT crm.`date_input` FROM `ln_client_receipt_money` AS crm,`ln_client_receipt_money_detail` AS crmd WHERE crm.`id`!=$id AND crm.`id`=(SELECT crl.`crm_id` FROM `ln_client_receipt_money_detail` AS crl WHERE crl.`crm_id`=crm.`id` AND crl.`loan_number`=(SELECT c.loan_number FROM `ln_client_receipt_money_detail` AS c WHERE c.`crm_id`=crmd.id AND c.`crm_id`=$id LIMIT 1) LIMIT 1)  ORDER BY crm.`date_input` DESC LIMIT 1) AS last_pay_date,
					(SELECT `currency_id` FROM `ln_client_receipt_money_detail` WHERE crm_id = $id LIMIT 1) AS `currency_type`,
					(SELECT crm.`recieve_amount` FROM `ln_client_receipt_money` AS crm WHERE crm.`id`=$id ) AS recieve_amount,
					(SELECT crm.`receiver_id` FROM `ln_client_receipt_money` AS crm WHERE crm.`id`=$id ) AS receiver_id,
					(SELECT c.`client_number` FROM `ln_client` AS c WHERE crmd.`client_id`=c.`client_id` LIMIT 1) AS client_number,
					(SELECT c.`name_kh` FROM `ln_client` AS c WHERE crmd.`client_id`=c.`client_id` LIMIT 1) AS name_kh,
					crmd.* 
				FROM
					`ln_client_receipt_money_detail` AS crmd 
				WHERE crmd.`crm_id` =$id";
		return $db->fetchAll($sql);
	}
	
	public function getAllIlDetail($id){
		$db = $this->getAdapter();
		$sql="SELECT
	
			(SELECT `currency_id` FROM `ln_client_receipt_money_detail` WHERE crm_id = crmd.`crm_id` LIMIT 1) AS `currency_type`,
			(SELECT c.`client_number` FROM `ln_client` AS c WHERE crmd.`client_id`=c.`client_id`) AS client_number,
			(SELECT c.`name_kh` FROM `ln_client` AS c WHERE crmd.`client_id`=c.`client_id`) AS name_kh,
			crmd.*
		FROM
			`ln_client_receipt_money_detail` AS crmd WHERE crmd.`crm_id` = $id";
		//return $sql;
		return $db->fetchAll($sql);
	}
    function getTranLoanByIdWithBranch($id){
//     	$sql = "SELECT lg.g_id,lg.level,lg.co_id,lg.zone_id,lg.pay_term,lm.payment_method,
//     		lm.interest_rate,lm.amount_collect_principal,
//     		lm.client_id,lm.admin_fee,
// 	    	(SELECT name_kh FROM `ln_client` WHERE client_id = lm.client_id LIMIT 1) AS client_name_kh,
// 	  		(SELECT name_en FROM `ln_client` WHERE client_id = lm.client_id LIMIT 1) AS client_name_en,
// 	  		lm.total_capital,lm.interest_rate,lm.payment_method,
// 	    	lg.time_collect,
// 	    	lg.zone_id,
// 	    	(SELECT co_firstname FROM `ln_co` WHERE co_id =lg.co_id LIMIT 1) AS co_enname,
// 	    	lg.status AS str ,lg.status FROM `ln_loan_group` AS lg,`ln_loan_member` AS lm
// 			WHERE lg.g_id = lm.group_id AND lg.g_id = $id LIMIT 1 ";
//     	return $this->getAdapter()->fetchRow($sql);
    }
    public function getIlPaymentNumber(){
    	$this->_name='ln_client_receipt_money';
    	$db = $this->getAdapter();
    	$sql=" SELECT id  FROM $this->_name ORDER BY id DESC LIMIT 1 ";
    	$acc_no = $db->fetchOne($sql);
    	$new_acc_no= (int)$acc_no+1;
    	$acc_no= strlen((int)$acc_no+1);
    	$pre = "";
    	$pre_fix="PM-";
    	for($i = $acc_no;$i<5;$i++){
    		$pre.='0';
    	}
    	return $pre_fix.$pre.$new_acc_no;
    }
public function addILPayment($data){
    	$db = $this->getAdapter();
    	$db->beginTransaction();
    	$session_user=new Zend_Session_Namespace('auth');
    	$user_id = $session_user->user_id;
    	try{
    	$reciept_no = $data['reciept_no'];
    	$sql="SELECT id  FROM ln_client_receipt_money WHERE receipt_no='$reciept_no' ORDER BY id DESC LIMIT 1 ";
    	$acc_no = $db->fetchOne($sql);
    	
    	if($acc_no){
    		$reciept_no=$this->getIlPaymentNumber();
    	}else{
    		$reciept_no = $data['reciept_no'];
    	}
    	
    	$loan_number = $data['loan_number'];
    	$amount_receive = $data["amount_receive"];
    	$total_payment = $data["total_payment"];
    	$return = $data["amount_return"];
    	
    	$option_pay = $data["option_pay"];
    	
    	
    	if($amount_receive>$total_payment){
    		$amount_payment = $amount_receive - $return;
    		$is_compleated = 1;
    	}elseif($amount_receive<$total_payment){
    		$amount_payment = $amount_receive;
    		$is_compleated = 0;
    	}else{
    		$amount_payment = $total_payment;
    		$is_compleated = 1;
    	}
    	
    	$service_charge= $data["service_charge"];
    	$penalize = $data["penalize_amount"];
    	
    		$arr_client_pay = array(
    			'co_id'							=>		$data['co_id'],
    			'group_id'						=>		$data["client_id"],
    			'receiver_id'					=>		$data['reciever'],
    			'receipt_no'					=>		$reciept_no,
    			'branch_id'						=>		$data['branch_id'],
    			//'loan_number'					=>		$data['loan_number'],
    			'date_pay'						=>		$data['collect_date'],
    			'date_input'					=>		$data['collect_date'],
    			'principal_amount'				=>		$data["priciple_amount"],
    			'total_principal_permonth'		=>		$data["os_amount"],
    			'total_payment'					=>		$data["total_payment"],
    			'total_interest'				=>		$data["total_interest"],
    			'recieve_amount'				=>		$data["amount_receive"],
    			'penalize_amount'				=>		$penalize,
    			'return_amount'					=>		$return,
    			'service_charge'				=>		$data["service_charge"],
    			'note'							=>		$data['note'],
    			'user_id'						=>		$user_id,
    			'is_group'						=>		0,
    			'payment_option'				=>		$data["option_pay"],
    			'currency_type'					=>		$data["currency_type"],
    			'status'						=>		1,
    			'amount_payment'				=>		$amount_payment,
    			'is_completed'					=>		$is_compleated
    		);
			$this->_name = "ln_client_receipt_money";
    		$client_pay = $this->insert($arr_client_pay);
    		
    		$date_collect = $data["collect_date"];
    	$identify = explode(',',$data['identity']);
    		foreach($identify as $i){
    			if($option_pay==1){
    				$total_recieve = $data["amount_receive"];
    				if($total_recieve>=$data["total_payment"]){
    					$is_compleated = 1;
    				}else{
    					$is_compleated = 0;
    				}
    			}else{
    				$total_recieve=$data["payment_".$i];
    				$is_compleated = 1;
    			}
    			$client_detail = $data["mfdid_".$i];
    			$sub_recieve_amount = $data["amount_receive"];
    			$sub_service_charge = $data["service_".$i];
    			$sub_peneline_amount = $data["penelize_".$i];
    			$sub_interest_amount = $data["interest_".$i];
    			$sub_principle= $data["principal_permonth_".$i];
    			$sub_total_payment = $data["payment_".$i];
    			$loan_number = $data["loan_number"];
    			$date_payment = $data["date_payment_".$i];
    			if($client_detail!=""){
    				$arr_money_detail = array(
    						'crm_id'				=>		$client_pay,
    						'loan_number'			=>		$data['loan_number'],
    						'lfd_id'				=>		$data["mfdid_".$i],
    						'client_id'				=>		$data["client_id_".$i],
    						'date_payment'			=>		$data["date_payment_".$i],
    						'capital'				=>		$data["total_priciple_".$i],
    						'remain_capital'		=>		$data["total_priciple_".$i] - $data["principal_permonth_".$i],
    						'principal_permonth'	=>		$data["principal_permonth_".$i],
    						'total_interest'		=>		$data["interest_".$i],
    						'total_payment'			=>		$data["payment_".$i],
    						'total_recieve'			=>		$total_recieve,
    						'currency_id'			=>		$data["currency_type"],
    						'pay_after'				=>		$data['multiplier_'.$i],
    						'penelize_amount'		=>		$data['penelize_'.$i],
    						'service_charge'		=>		$data['service_'.$i],
    						'penelize_new'			=>		$data['penelize_'.$i]-$data['old_penelize_'.$i],
    						'service_charge_new'	=>		$data["service_charge"]-$data['service_'.$i],
    						'is_completed'			=>		$is_compleated,
    						'is_verify'				=>		0,
    						'verify_by'				=>		0,
    						'is_closingentry'		=>		0,
    						'status'				=>		1
    				);
    				
    				$db->getProfiler()->setEnabled(true);
    				
    				$db->insert("ln_client_receipt_money_detail", $arr_money_detail);
    				
    				Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
    				Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
    				$db->getProfiler()->setEnabled(false);
    				if($option_pay==1){
	    				if($sub_recieve_amount>=$total_payment){
		    				 
		    				$arr_update_fun_detail = array(
		    					'is_completed'		=> 	1,
		    				);
		    				$this->_name="ln_loanmember_funddetail";
		    				$where = $db->quoteInto("id=?", $data["mfdid_".$i]);
		    				
		    				$db->getProfiler()->setEnabled(true);
		    				
		    				$this->update($arr_update_fun_detail, $where);
		    				
		    				Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
		    				Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
		    				$db->getProfiler()->setEnabled(false);
	    				}else{
			   					$new_sub_interest_amount = $data["interest_".$i];
			   					$new_sub_penelize = $data["penalize_amount"];
			   					$new_sub_service_charge = $data["service_".$i]+$data["service_charge"];
			   					$principle_after = $data["principal_permonth_".$i];
			   					$pyament_after = $total_payment-$amount_receive;
				   				if($sub_recieve_amount>0){
				   					$new_amount_after_service = $sub_recieve_amount-$new_sub_service_charge;
				   					if($new_amount_after_service>=0){
				   						$new_sub_service_charge = 0;
				   						$new_amount_after_penelize = $new_amount_after_service - $new_sub_penelize;
				   						//echo $new_amount_after_penelize."=".$new_amount_after_service."-".$new_sub_penelize;
				   						if($new_amount_after_penelize>=0){
				   							$new_sub_penelize = 0;
				   							$new_amount_after_interest = $new_amount_after_penelize - $sub_interest_amount;
				   							if($new_amount_after_interest>=0){
				   								$new_sub_interest_amount = 0;
				   								$principle_after = $principle_after - $new_amount_after_interest;
				   							}else{
				   								$new_sub_interest_amount = abs($new_amount_after_interest);
				   							}
				   						}else{
				   							$new_sub_penelize = abs($new_amount_after_penelize);
				   						}
				   					}else{
				   						$new_sub_service_charge = abs($new_amount_after_service);
				   					}
				   				}
				   				
				   				$arr_update_fun_detail = array(
				   						'is_completed'			=> 	0,
				   						'total_interest_after'	=>  $new_sub_interest_amount,
				   						'total_payment_after'	=>	$pyament_after,
				   						'penelize'				=>	$new_sub_penelize,
				   						'principle_after'		=>	$principle_after,
				   						'service_charge'		=>	$new_sub_service_charge,
				   						'payment_option'		=>	1
				   				);
				   				$this->_name="ln_loanmember_funddetail";
				   				$where = $db->quoteInto("id=?", $data["mfdid_".$i]);
				   				$db->getProfiler()->setEnabled(true);
				   				
				   				$this->update($arr_update_fun_detail, $where);
				   				
				   				Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
				   				Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
				   				$db->getProfiler()->setEnabled(false);
			   				}
    					}else{
    						
    						$sql_loan_fun = "SELECT 
											  lf.`id` ,
											  lf.`total_principal`,
											  lf.`principle_after`,
											  lf.`total_interest_after`,
											  lf.`service_charge`,
											  lf.`penelize`
											FROM
											  `ln_loanmember_funddetail` AS lf,
											  `ln_loan_member` AS lm 
											WHERE lf.`member_id` = lm.`member_id`      
  												AND lm.`loan_number` = '$loan_number' 
    											AND lf.`date_payment` = '$date_payment'";
    						$row_fun = $db->fetchAll($sql_loan_fun);
    						$is_set=0;
    						foreach ($row_fun as $rs_fun){
    							if($is_set!=1){
    								$penelize=$data["penelize_".$i];
    								$is_set=1;
    							}else{
    								$penelize = $rs_fun['penelize'];
    							}
    							$total_pay=$rs_fun["principle_after"]+$rs_fun["total_interest_after"]+$penelize; 
    							
    							$arr_update_fun_detail = array(
    									'is_completed'			=> 	1,
    									'payment_option'		=>	$data["option_pay"]
    							);
    							$this->_name="ln_loanmember_funddetail";
    							$where = $db->quoteInto("id=?", $rs_fun['id']);
    							$db->getProfiler()->setEnabled(true);
    							 
    							$this->update($arr_update_fun_detail, $where);
    							 
    							Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
    							Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
    							$db->getProfiler()->setEnabled(false);
    						}
    					}
		   				
		   				$sql_payment ="SELECT
						   					l.*
						   				FROM
							   				`ln_loanmember_funddetail` AS l,
							   				`ln_loan_member` AS m
						   				WHERE l.`member_id` = m.`member_id`
							   				AND m.`loan_number` = '$loan_number'
							   				AND l.`is_completed` = 0 ";
		   				$rs_payment = $db->fetchRow($sql_payment);
		   				
		   				$group_id = $data["client_code"];
		   				if(empty($rs_payment)){
			   				$sql ="UPDATE
					   					`ln_loan_group` AS l
					   				SET l.`status` = 2
					   				WHERE l.`g_id`= (SELECT m.`group_id` FROM `ln_loan_member` AS m WHERE m.`loan_number`='$loan_number' LIMIT 1)
					   					AND l.`group_id`= $group_id AND l.`loan_type`=2";
			   				$db->getProfiler()->setEnabled(true);
			   				$db->query($sql);
			   				
			   				Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
			   				Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
			   				$db->getProfiler()->setEnabled(false);
			   				
			   				$sql_loan_memeber ="UPDATE `ln_loan_member` AS m SET m.`is_completed`=1 WHERE m.`loan_number`= '$loan_number'";
			   				$db->query($sql_loan_memeber);
		   				}
    			}
    		}
//      		exit();
    		$db->commit();
    	}catch (Exception $e){
    		$db->rollBack();
    		Application_Model_DbTable_DbUserLog::writeMessageError($e->getMessage());
    	}
    }
    function updateIlPayment($data){
    	$db = $this->getAdapter();
    	$session_user=new Zend_Session_Namespace('auth');
    	$user_id = $session_user->user_id;
    	$db_loan = new Loan_Model_DbTable_DbLoanILPayment();
    	$db_group = new Loan_Model_DbTable_DbGroupPayment();
    	$db->beginTransaction();
    	$is_set = 0;
    	try{
	    	$id= $data["id"];
	    	$loan_number = $data['loan_number'];
	    	$amount_receive = $data["amount_receive"];
	    	$total_payment = $data["total_payment"];
	    	$return = $data["amount_return"];
	    	$option_pay = $data["option_pay"];
	    	
	    	if($amount_receive>$total_payment){
	    		$amount_payment = $amount_receive - $return;
	    		$total_pay = $amount_receive - $data["total_payment"];
	    		$is_completed = 1;
	    	}elseif($amount_receive<$total_payment){
	    		$amount_payment = $amount_receive;
	    		$total_pay = $data["total_payment"]-$amount_receive;
	    		$is_completed = 0;
	    	}else{
	    		$amount_payment = $total_payment;
	    		$is_completed = 1;
	    	}
	    	
	    	$service_charge= $data["service_charge"];
	    	$penalize = $data["penalize_amount"];
	    	
    		$arr_client_pay = array(
    			'co_id'							=>		$data['co_id'],
    			'group_id'						=>		$data["client_id"],
    			'receiver_id'					=>		$data['reciever'],
    			'branch_id'						=>		$data['branch_id'],
    			'date_input'					=>		$data['collect_date'],
    			'principal_amount'				=>		$data["priciple_amount"],
    			'total_principal_permonth'		=>		$data["os_amount"],
    			'total_payment'					=>		$data["total_payment"],
    			'total_interest'				=>		$data["total_interest"],
    			'recieve_amount'				=>		$data["amount_receive"],
    			'penalize_amount'				=>		$data['penalize_amount'],
    			'return_amount'					=>		$return,
    			'service_charge'				=>		$data["service_charge"],
    			'note'							=>		$data['note'],
    			'user_id'						=>		$user_id,
    			'is_group'						=>		0,
    			'payment_option'				=>		$data["option_pay"],
    			'currency_type'					=>		$data["currency_type"],
    			'status'						=>		1,
    			'amount_payment'				=>		$amount_payment,
    			'is_completed'					=>		$is_completed
    		);
    		$this->_name = "ln_client_receipt_money";
    		$where = $db->quoteInto("id=?", $data["id"]);
    		$client_pay = $this->update($arr_client_pay, $where);
    		
    		
    		$recipt_money = $db_loan->getReceiptMoneyById($id);
			$recipt_money_detail = $db_loan->getReceiptMoneyDetailByID($id);
			foreach ($recipt_money_detail as $row_recipt_detail){
				$fun_id = $row_recipt_detail["lfd_id"];
				if($is_set!=1){
					$loan_number = $row_recipt_detail["loan_number"];
					$rs_fun = $db_group->getFunDetailByLoanNumber($loan_number);
					$rs_group = "SELECT m.group_id FROM ln_loan_member AS m WHERE m.loan_number = '$loan_number' GROUP BY m.loan_number";
					$group_id = $db->fetchOne($rs_group);
					if(empty($rs_fun) or $rs_fun=="" or $rs_fun==null){
						$arr_member = array(
							'is_completed'	=>	0,
						);
						$this->_name = "ln_loan_member";
						$where = $db->quoteInto("loan_number=?", $loan_number);
						$this->update($arr_member, $where);
						
						$arr_group = array(
							'status'	=>	1,
						);
						$this->_name = "ln_loan_group";
						$where = $db->quoteInto("g_id=?", $group_id);
						$this->update($arr_group, $where);
					}
					$is_set=1;
				}
				if($recipt_money["payment_option"]==1){
					$is_completed = $db_loan->getFunDetailById($fun_id);
					if($is_completed==1){
						$arr_update = array(
							'is_completed' =>	0,
						);
						$this->_name = "ln_loanmember_funddetail";
						$where = $db->quoteInto("id=?", $fun_id);
						$this->update($arr_update, $where);
					}else{
						$arr_update = array(
							'principle_after'		=> 	$row_recipt_detail["principal_permonth"],
							'total_interest_after'	=>	$row_recipt_detail["total_interest"],
							'penelize'				=>	$row_recipt_detail["penelize_amount"],
							'service_charge'		=>	$row_recipt_detail["service_charge"],
							'total_payment_after'	=>	$row_recipt_detail["total_payment"],	
							'is_completed' 			=>	0,
						);
						$this->_name = "ln_loanmember_funddetail";
						$where = $db->quoteInto("id=?", $fun_id);
						$this->update($arr_update, $where);
					}
				}else{
					$arr_update = array(
							'is_completed' =>	0,
					);
					$this->_name = "ln_loanmember_funddetail";
					$where = $db->quoteInto("id=?", $fun_id);
					$this->update($arr_update, $where);
				}
			}
			
			$sql_cmd = "DELETE FROM `ln_client_receipt_money_detail` WHERE `crm_id` = $id";
			$db->query($sql_cmd);
    	
    		$identify = explode(',',$data['identity']);
    	foreach($identify as $i){
    			if($option_pay==1){
    				$total_recieve = $data["amount_receive"];
    			}else{
    				$total_recieve=$data["payment_".$i];
    			}
    			$client_detail = $data["mfdid_".$i];
    			$sub_recieve_amount = $data["amount_receive"];
    			$sub_service_charge = $data["service_".$i];
    			$sub_peneline_amount = $data["penelize_".$i];
    			$sub_interest_amount = $data["interest_".$i];
    			$sub_principle= $data["principal_permonth_".$i];
    			$sub_total_payment = $data["payment_".$i];
    			$date_payment = $data["date_payment_".$i];
    			if($client_detail!=""){
    				$arr_money_detail = array(
    						'crm_id'				=>		$id,
    						'loan_number'			=>		$data['loan_number'],
    						'lfd_id'				=>		$data["mfdid_".$i],
    						'client_id'				=>		$data["client_id_".$i],
    						'date_payment'			=>		$data["date_payment_".$i],
    						'capital'				=>		$data["total_priciple_".$i],
    						'remain_capital'		=>		$data["total_priciple_".$i] - $data["principal_permonth_".$i],
    						'principal_permonth'	=>		$data["principal_permonth_".$i],
    						'total_interest'		=>		$data["interest_".$i],
    						'total_payment'			=>		$data["payment_".$i],
    						'total_recieve'			=>		$total_recieve,
    						'currency_id'			=>		$data["currency_type"],
    						'pay_after'				=>		$data['multiplier_'.$i],
    						'penelize_amount'		=>		$data['penelize_'.$i],
    						'service_charge'		=>		$data['service_'.$i],
    						'is_completed'			=>		1,
    						'is_verify'				=>		0,
    						'verify_by'				=>		0,
    						'is_closingentry'		=>		0,
    						'status'				=>		1
    				);
    				$db->insert("ln_client_receipt_money_detail", $arr_money_detail);
    				if($option_pay==1){
	    				if($sub_recieve_amount>=$total_payment){
		    				 
		    				$arr_update_fun_detail = array(
		    					'is_completed'		=> 	1,
		    				);
		    				$this->_name="ln_loanmember_funddetail";
		    				$where = $db->quoteInto("id=?", $data["mfdid_".$i]);
		    				$this->update($arr_update_fun_detail, $where);
	    				}else{
			   					$new_sub_interest_amount = $data["interest_".$i];
			   					$new_sub_penelize = $data["penelize_".$i]+$data["penalize_amount"];
			   					$new_sub_service_charge = $data["service_".$i]+$data["service_charge"];
			   					echo $new_sub_service_charge;
			   					$principle_after = $data["principal_permonth_".$i];
			   					$pyament_after = $total_payment-$amount_receive;
				   				if($sub_recieve_amount>0){
				   					$new_amount_after_service = $sub_recieve_amount-$new_sub_service_charge;
				   					if($new_amount_after_service>=0){
				   						$new_sub_service_charge = 0;
				   						$new_amount_after_penelize = $new_amount_after_service - $new_sub_penelize;
				   						if($new_amount_after_penelize>=0){
				   							$new_sub_penelize = 0;
				   							$new_amount_after_interest = $new_amount_after_penelize - $sub_interest_amount;
				   							if($new_amount_after_interest>=0){
				   								$new_sub_interest_amount = 0;
				   								$principle_after = $principle_after - $new_amount_after_interest;
				   							}else{
				   								$new_sub_interest_amount = abs($new_amount_after_interest);
				   							}
				   						}else{
				   							$new_sub_penelize = abs($new_amount_after_penelize);
				   						}
				   					}else{
				   						$new_sub_service_charge = abs($new_amount_after_service);
				   					}
				   				}
				   				
				   				$arr_update_fun_detail = array(
				   						'is_completed'			=> 	0,
				   						'total_interest_after'	=>  $new_sub_interest_amount,
				   						'total_payment_after'	=>	$pyament_after,
				   						'penelize'				=>	$new_sub_penelize,
				   						'principle_after'		=>	$principle_after,
				   						'service_charge'		=>	$new_sub_service_charge,
				   						'payment_option'		=>	1
				   				);
				   				$this->_name="ln_loanmember_funddetail";
				   				$where = $db->quoteInto("id=?", $data["mfdid_".$i]);
				   				$this->update($arr_update_fun_detail, $where);
			   				}
    					}else{
    						
    						$sql_loan_fun = "SELECT 
											  lf.`id` ,
											  lf.`total_principal`,
											  lf.`principle_after`,
											  lf.`total_interest_after`,
											  lf.`service_charge`,
											  lf.`penelize`
											FROM
											  `ln_loanmember_funddetail` AS lf,
											  `ln_loan_member` AS lm 
											WHERE lf.`member_id` = lm.`member_id`      
  												AND lm.`loan_number` = '$loan_number' 
    											AND lf.`date_payment` = '$date_payment'";
    						$row_fun = $db->fetchAll($sql_loan_fun);
    						$is_set=0;
    						foreach ($row_fun as $rs_fun){
    							if($is_set!=1){
    								$penelize=$data["penelize_".$i];
    								$is_set=1;
    							}else{
    								$penelize = $rs_fun['penelize'];
    							}
    							$total_pay=$rs_fun["principle_after"]+$rs_fun["total_interest_after"]+$penelize; 
    							
    							$arr_update_fun_detail = array(
    									'is_completed'			=> 	1,
    									'payment_option'		=>	$data["option_pay"]
    							);
    							$this->_name="ln_loanmember_funddetail";
    							$where = $db->quoteInto("id=?", $rs_fun['id']);
    							$this->update($arr_update_fun_detail, $where);
    						}
    					}
		   				
		   				$sql_payment ="SELECT
						   					l.*
						   				FROM
							   				`ln_loanmember_funddetail` AS l,
							   				`ln_loan_member` AS m
						   				WHERE l.`member_id` = m.`member_id`
							   				AND m.`loan_number` = '$loan_number'
							   				AND l.`is_completed` = 0 ";
		   				$rs_payment = $db->fetchRow($sql_payment);
		   				
		   				$group_id = $data["client_code"];
		   				if(empty($rs_payment)){
			   				$sql ="UPDATE
					   					`ln_loan_group` AS l
					   				SET l.`status` = 2
					   				WHERE l.`g_id`= (SELECT m.`group_id` FROM `ln_loan_member` AS m WHERE m.`loan_number`='$loan_number' LIMIT 1)
					   					AND l.`group_id`= $group_id AND l.`loan_type`=2";
			   				$db->query($sql);
			   				
			   				$sql_loan_memeber ="UPDATE `ln_loan_member` AS m SET m.`is_completed`=1 WHERE m.`loan_number`= '$loan_number'";
			   				$db->query($sql_loan_memeber);
		   				}
    			}
    		}
//     		exit();
    		$db->commit();
    	}catch (Exception $e){
    		$db->rollBack();
    		Application_Model_DbTable_DbUserLog::writeMessageError($e->getMessage());
    	}
    }
 
   function getAllPaymentListBySender($client_id){
   		$db = $this->getAdapter();
   		$sql = " CALL `stgetAllPaymentById`($client_id)";
   		return $db->fetchAll($sql);
   }

   function getLoanPaymentByLoanNumber($data){
    	$db = $this->getAdapter();
    	$loan_number= $data['loan_number'];
    	if($data['type']!=1){
    		$where =($data['type']==2 AND $data["type"]==3)?'lc.client_id = '.$loan_number:'lc.client_id='.$loan_number;
    		$sql ="SELECT 
					  lc.`client_id`,
					  lc.`client_number`,
					  lc.`name_kh`,
					  lm.`loan_number`,
					  lm.`currency_type`,
					  lm.`pay_before`,
					  lm.`pay_after`,
					  lm.`branch_id`,
					  lm.`interest_rate`,
			   		  lm.`collect_typeterm`,
			   		  lm.`amount_collect_principal`,
					  lg.`co_id`,
					  lg.`payment_method`,
					  lg.`date_release`,    
					  lg.`level`,
					  lf.*,
					FROM
					  `ln_client` AS lc,
					  `ln_loan_member` AS lm ,
					  `ln_loan_group` AS lg,
					  `ln_loanmember_funddetail` AS lf
					WHERE lg.`g_id`=lm.`group_id`
					  AND lf.`member_id`=lm.`member_id`
					  AND lm.`client_id`=lc.`client_id`
					  AND lg.`loan_type`=1
    				  AND lf.`is_completed`=0
    				  AND lf.`status`=1
    				  AND $where
    				";
    	}elseif($data['type']==1){
    		$where = 'lm.`loan_number`='."'".$loan_number."'";
    		$sql ="SELECT 
    				  (SELECT crm.`date_input` FROM `ln_client_receipt_money` AS crm , `ln_client_receipt_money_detail` AS crmd WHERE crm.`id`=crmd.`crm_id` AND crmd.`lfd_id`=lf.`id` AND crmd.`loan_number`=lm.`loan_number` ORDER BY `crm`.`date_input` DESC LIMIT 1) AS last_pay_date,
					  lc.`client_id`,
					  lc.`client_number`,
					  lc.`name_kh`,
					  lm.`total_capital`,
					  lm.`loan_number`,
					  lm.`currency_type`,
					  lm.`pay_before`,
					  lm.`pay_after`,
					  lm.`branch_id`,
					  lm.`interest_rate`,
			   		  lm.`collect_typeterm`,
			   		  lm.`amount_collect_principal`,
					  lg.`co_id`,
					  lg.`total_duration`,
					  lg.`payment_method`,
					  lg.`payment_method`,
					  DATE_FORMAT(lg.`date_release`, '%d-%m-%Y') AS `date_release`,
					  lg.`level`, 
					  lg.`date_release` AS release_date,
					  lf.*,
					  DATE_FORMAT(lf.date_payment, '%d-%m-%Y') AS `date_payments`
					FROM
					  `ln_client` AS lc,
					  `ln_loan_member` AS lm ,
					  `ln_loan_group` AS lg,
					  `ln_loanmember_funddetail` AS lf
					WHERE lg.`g_id`=lm.`group_id`
					  AND lf.`member_id`=lm.`member_id`
					  AND lm.`client_id`=lc.`client_id`
					  AND lg.`loan_type`=1
					  AND $where
    				AND lf.`is_completed`=0
    				 AND lf.`status`=1";
    				
 	}
 		//return $sql;
    	return $db->fetchAll($sql);
   }
   
   function getAllLoanPaymentByLoanNumber($data){
   	$db = $this->getAdapter();
   	$loan_number= $data['loan_numbers'];
   	if($data['types']!=1){
   		$where =($data['types']==2 AND $data["type"]==3)?'lc.client_id = '.$loan_number:'lc.client_id='.$loan_number;
   		$sql ="SELECT
			   		lc.`client_id`,
			   		lc.`client_number`,
			   		lc.`name_kh`,
			   		lm.`loan_number`,
			   		lm.`currency_type`,
			   		lm.`pay_before`,
			   		lm.`pay_after`,
			   		lm.`branch_id`,
			   		lm.`collect_typeterm`,
			   		lg.`co_id`,
			   		lg.`payment_method`,
			   		lf.*,
			   		DATE_FORMAT(lf.date_payment, '%d-%m-%Y') AS `date_payments`
			   		FROM
			   		`ln_client` AS lc,
			   		`ln_loan_member` AS lm ,
			   		`ln_loan_group` AS lg,
			   		`ln_loanmember_funddetail` AS lf
			   		WHERE lg.`g_id`=lm.`group_id`
			   		AND lf.`member_id`=lm.`member_id`
			   		AND lm.`client_id`=lc.`client_id`
			   		AND lg.`loan_type`=1
			   		 AND lf.`status`=1
			   		AND $where
			   		";
   	}elseif($data['types']==1){
   	$where = 'lm.`loan_number`='."'".$loan_number."'";
   	$sql ="SELECT
			   	lc.`client_id`,
			   	lc.`client_number`,
			   	lc.`name_kh`,
			   	lm.`loan_number`,
					  lm.`currency_type`,
   					  lm.`pay_before`,
   					  lm.`pay_after`,
   					  lm.`branch_id`,
   					  lm.`collect_typeterm`,
   					  lg.`co_id`,
   					  lg.`payment_method`,
   					  lf.*,
   					  DATE_FORMAT(lf.date_payment, '%d-%m-%Y') AS `date_payments`
   					  FROM
   					  `ln_client` AS lc,
   					  `ln_loan_member` AS lm ,
   					  `ln_loan_group` AS lg,
   					  `ln_loanmember_funddetail` AS lf
   					  WHERE lg.`g_id`=lm.`group_id`
   					  AND lf.`member_id`=lm.`member_id`
   					  AND lm.`client_id`=lc.`client_id`
   					  AND lg.`loan_type`=1
   					   AND lf.`status`=1
   					  AND $where";
   
   		}
   		//return $sql ;
   		return $db->fetchAll($sql);
   		}

   function getAllCo(){
   			$db = $this->getAdapter();
   			$sql="SELECT `co_id` AS id,CONCAT(`co_firstname`,' ',`co_lastname`,'- ',`co_khname`) AS `name`,`branch_id` FROM `ln_co` WHERE `position_id`=1 AND (`co_khname`!=''  OR `co_firstname`!='')" ;
   			return $db->fetchAll($sql);
   		
   }
   function getAllClient(){
   	$db = $this->getAdapter();
   	$sql = "SELECT c.`client_id` AS id ,c.`name_en` AS name ,c.`branch_id` FROM `ln_client` AS c WHERE c.`name_en`!='' " ;
   	return $db->fetchAll($sql);
   }
   
   function getAllClientCode(){
   	$db = $this->getAdapter();
   	$sql = "SELECT c.`client_id` AS id ,c.`client_number` AS name ,c.`branch_id` FROM `ln_client` AS c WHERE c.`name_en`!='' " ;
   	return $db->fetchAll($sql);
   }
   
   public function getLastPayDate($data){
   	$loanNumber = $data['loan_numbers'];
   	$db = $this->getAdapter();
   	//$sql = "SELECT c.`date_input` FROM `ln_client_receipt_money` AS c WHERE c.`loan_number`='$loanNumber' ORDER BY c.`date_input` DESC LIMIT 1";
   	$sql ="SELECT 
			  lf.`date_payment`
			FROM
			  `ln_loanmember_funddetail` AS lf,
			  `ln_client_receipt_money` AS c,
			  `ln_loan_member` AS lm
			WHERE c.`loan_number` = lm.`loan_number`
			  AND lm.`member_id` = lf.`member_id`
			  AND c.`loan_number` = '$loanNumber' 
			  AND lf.`is_completed`=1
			ORDER BY lf.`id` DESC LIMIT 1";
   	//return $sql;
   	return $db->fetchOne($sql);
   }
   
   public function getLastPaymentDate($data){
   	$loanNumber = $data['loan_numbers'];
   	$fn_id = $data["fn_id"];
   	$db = $this->getAdapter();
   	$sql = "SELECT 
			  c.`date_input` 
			FROM
			  `ln_client_receipt_money` AS c,
			  `ln_client_receipt_money_detail` AS cr 
			WHERE c.`loan_number` = '$loanNumber' 
			  AND c.`id` = cr.`crm_id` 
			  AND cr.`lfd_id` = $fn_id 
			ORDER BY c.`receipt_no` DESC 
			LIMIT 1";
   	//return $sql;
   	return $db->fetchOne($sql);
   }
   public function getLaonHasPayByLoanNumber($loan_number){
   	$db= $this->getAdapter();
   	$sql="SELECT 
			  (SELECT c.`name_kh` FROM `ln_client` AS c WHERE c.`client_id`=crmd.`client_id`) AS client_name,
			  (SELECT c.`client_number` FROM `ln_client` AS c WHERE c.`client_id`=crmd.`client_id`) AS client_code,
			  crm.`receipt_no`,
			  crm.`loan_number`,
			  DATE_FORMAT(crm.date_input, '%d-%m-%Y') AS `date_input`,
			  crm.`principal_amount`,
			  crm.`total_principal_permonth`,
			  crm.`total_payment`,
			  crm.`total_interest`,
			  crm.`amount_payment`,
			  crm.`recieve_amount`,
			  crm.`return_amount`,
			  crm.`service_charge`,
			  crm.`penalize_amount`,
			  crm.`group_id`,
			   crm.`is_completed`,
			  crm.`currency_type`,
			  crmd.`capital`,
			  crmd.`total_payment`,
			  DATE_FORMAT(crmd.date_payment, '%d-%m-%Y') AS `date_payment`
			FROM
			  `ln_client_receipt_money` AS crm,
			  `ln_client_receipt_money_detail` AS crmd 
			WHERE crm.`id` = crmd.`crm_id` 
			  AND crmd.`loan_number` = '$loan_number' ORDER BY crmd.`crm_id` DESC ";
   	return $db->fetchAll($sql);
   }
   
   function getAllLoanByCoId($data){ //quick Il Payment
   	$db = $this->getAdapter();
   	$co_id = $data["co_id"];
   	$cu_id = $data["currency"];
   	$date = $data["date_collect"];
   	$sql="SELECT 
			  (SELECT CONCAT(co.`co_firstname`,`co_lastname`,',',`co_khname`) FROM `ln_co` AS co WHERE co.`co_id`=lg.`co_id`) AS co_name,
			  (SELECT b.`branch_namekh` FROM `ln_branch` AS b WHERE b.`br_id`=lm.`branch_id`) AS branch,
			  (SELECT c.`name_kh` FROM `ln_client` AS c WHERE c.`client_id`=lm.`client_id` ) AS `client`,
  			  (SELECT c.`client_number` FROM `ln_client` AS c WHERE c.`client_id`=lm.`client_id` ) AS `client_number`,
			  (SELECT crm.`date_input` FROM `ln_client_receipt_money` AS crm , `ln_client_receipt_money_detail` AS crmd WHERE crm.`id`=crmd.`crm_id` AND crmd.`lfd_id`=lf.`id` AND crm.`loan_number`=lm.`loan_number` ORDER BY `crm`.`date_input` DESC
			   LIMIT 1) AS last_pay_date,
			  lm.`loan_number`,
			  lm.`client_id`,
			  lm.`branch_id`,
			  lm.`interest_rate`,
			  lm.`payment_method`,
			  lm.`pay_after`,
			  lm.`collect_typeterm`,
			  lm.`currency_type`,
			  SUM(lf.`total_principal`) AS total_principal,
			  SUM(lf.`principle_after`) AS principle_after,
			  SUM(lf.`total_interest_after`) AS total_interest_after,
			  SUM(lf.`penelize`) AS penelize,
			  SUM(lf.`service_charge`) AS service_charge,
			  SUM(lf.`total_payment_after`) AS total_payment_after,
			  lf.`date_payment`,
  			  lf.`id`,
  			  lg.`g_id`,
  			  lg.`loan_type`
			FROM
			  `ln_loanmember_funddetail` AS lf,
			  `ln_loan_member` AS lm,
			  `ln_loan_group` AS lg 
			WHERE lf.`is_completed` = 0 
			  AND lf.`member_id` = lm.`member_id` 
			  AND lm.`status` = 1 
			  AND lm.`is_completed` = 0
			  AND lm.`group_id`=lg.`g_id`
			  AND lg.`co_id`=$co_id
			  AND lm.`currency_type`=$cu_id
			  AND lf.`date_payment`<='$date'
			  ";

   		$order = " GROUP BY lm.`group_id`,lf.`date_payment`";
   	//return $sql.$order;
   	return $db->fetchAll($sql.$order);
   }
   function getFunByGroupId($id){
   		$db = $this->getAdapter();
   		$sql="SELECT lf.`id` FROM `ln_loanmember_funddetail` AS lf, `ln_loan_member` AS lm WHERE lm.`member_id` = lf.`member_id` AND lm.`group_id` = $id AND lf.`is_completed`=0";
   		return $db->fetchAll($sql);
   }
   public function quickPayment($data){
   		$db = $this->getAdapter();
   		$db->beginTransaction();
   		$session_user=new Zend_Session_Namespace('auth');
   		$user_id = $session_user->user_id;
   		$reciept_no=$this->getIlPaymentNumber();
   		$db_loan_fun = new Loan_Model_DbTable_DbLoanILPayment();
   		try {
   			$is_set =0;
   			$identify = explode(',',$data['identity']);
   			if(!empty($identify)){
   				$arr_reciept_money = array(
   						'co_id'							=>		$data['co_id'],
   						'receiver_id'					=>		$data['reciever'],
   						'receipt_no'					=>		$reciept_no,
   						'branch_id'						=>		$data['branch_id'],
   						'date_input'					=>		$data["collect_date"],
   						'principal_amount'				=>		$data["priciple_amount"],
   						'total_principal_permonth'		=>		$data["os_amount"],
   						'total_payment'					=>		$data["total_payment"],
   						'total_interest'				=>		$data["total_interest"],
   						'recieve_amount'				=>		$data["amount_receive"],
   						'penalize_amount'				=>		$data['penalize_amount'],
   						'return_amount'					=>		$data["amount_return"],
   						'service_charge'				=>		$data["service_charge"],
   						'note'							=>		$data['note'],
   						'user_id'						=>		$user_id,
   						'is_group'						=>		2,
   						'payment_option'				=>		1,
   						'currency_type'					=>		$data["currency_type"],
   						'status'						=>		1,
   						'amount_payment'				=>		$data["amount_receive"]-$data["amount_return"],
   						'is_completed'					=>		1
   				);
   				
   				$this->_name="ln_client_receipt_money";
   				$client_recipt_money = $this->insert($arr_reciept_money);
   				
	   			foreach ($identify as $i){
	   				$client_detail = $data["mfdid_".$i];
	   				$sub_recieve_amount = $data["sub_recive_amount_".$i];
	   				$sub_service_charge = $data["sub_service_charge_".$i];
	   				$sub_peneline_amount = $data["sub_penelize_".$i];
	   				$sub_interest_amount = $data["sub_interest_".$i];
	   				$sub_principle= $data["sub_principal_permonth_".$i];
	   				$sub_total_payment = $data["sub_payment_".$i];
	   				if($client_detail!=""){
	   					$loan_type = $data["loan_type_".$i];
	   					$group_id = $data["group_id_".$i];
	   					$pay_date = $data["date_payment_".$i];
	   					
	   					$loanFun = $db_loan_fun->getLoanFunByGroupId($group_id,$pay_date);
	   					
	   					if($loan_type==2){
	   						if(!empty($loanFun) or $loanFun!="" or $loanFun!=null){
	   							foreach ($loanFun as $rowFun){
	   								if($is_set!=1){
// 	   									$total_pene = $data["old_penelize_".$i];
	   									$total_pay = $rowFun["total_payment_after"]+$data["sub_penelize_".$i];
	   									$is_set=1;
	   								}else{
// 	   									$total_pene = $rowFun["penelize"];
	   									$total_pay = $rowFun["total_payment_after"];
	   								}
	   								
	   								$arr_money_detail = array(
	   										'crm_id'				=>		$client_recipt_money,
	   										'loan_number'			=>		$rowFun["loan_number"],
	   										'lfd_id'				=>		$rowFun["id"],
	   										'client_id'				=>		$rowFun["client_id"],
	   										'date_payment'			=>		$rowFun["date_payment"],
	   										'capital'				=>		$rowFun["total_capital"],
	   										'remain_capital'		=>		$rowFun["total_capital"] - $rowFun["principle_after"],
	   										'principal_permonth'	=>		$rowFun["principle_after"],
	   										'total_interest'		=>		$rowFun["total_interest_after"],
	   										'total_payment'			=>		$total_pay,
	   										'total_recieve'			=>		$total_pay,
	   										'currency_id'			=>		$data["cu_id_".$i],
	   										'pay_after'				=>		$data['multiplier_'.$i],
	   										'penelize_amount'		=>		$rowFun["penelize"],
	   										'service_charge'		=>		$rowFun["service_charge"],
	   										'is_completed'			=>		1,
	   										'is_verify'				=>		0,
	   										'verify_by'				=>		0,
	   										'is_closingentry'		=>		0,
	   										'status'				=>		1
	   								);
	   								$db->getProfiler()->setEnabled(true);
	   								$db->insert("ln_client_receipt_money_detail", $arr_money_detail);
	   								Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
	   								Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
	   								$db->getProfiler()->setEnabled(false);
	   								
	   								$arr_fu = array(
	   										'is_completed'	=> 1,
	   								);
	   								$this->_name="ln_loanmember_funddetail";
	   								$where = $db->quoteInto("id=?", $rowFun["id"]);
	   								$db->getProfiler()->setEnabled(true);
	   								$this->update($arr_fu, $where);
	   								Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
	   								Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
	   								$db->getProfiler()->setEnabled(false);
	   							}
	   						}
	   					
	   					}else{
			   				if($sub_recieve_amount>=$sub_total_payment){
			   					$arr_money_detail = array(
			   							'crm_id'				=>		$client_recipt_money,
			   							'loan_number'			=>		$data["loan_number_".$i],
			   							'lfd_id'				=>		$data["mfdid_".$i],
			   							'client_id'				=>		$data["client_id_".$i],
			   							'date_payment'			=>		$data["date_payment_".$i],
			   							'capital'				=>		$data["sub_total_priciple_".$i],
			   							'remain_capital'		=>		$data["sub_total_priciple_".$i] - $data["sub_principal_permonth_".$i],
			   							'principal_permonth'	=>		$data["sub_principal_permonth_".$i],
			   							'total_interest'		=>		$data["sub_interest_".$i],
			   							'total_payment'			=>		$data["sub_payment_".$i],
			   							'total_recieve'			=>		$data["sub_recive_amount_".$i],
			   							'currency_id'			=>		$data["cu_id_".$i],
			   							'pay_after'				=>		$data['multiplier_'.$i],
			   							'penelize_amount'		=>		$data["old_sub_penelize_".$i],
			   							'service_charge'		=>		$data["old_sub_service_charge_".$i],
			   							'is_completed'			=>		0,
			   							'is_verify'				=>		0,
			   							'verify_by'				=>		0,
			   							'is_closingentry'		=>		0,
			   							'status'				=>		1
			   					);
			   					
			   					$db->getProfiler()->setEnabled(true);
			   					
			   					$db->insert("ln_client_receipt_money_detail", $arr_money_detail);
			   					
			   					Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
			   					Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
			   					$db->getProfiler()->setEnabled(false);
			   						
			   					$arr_update_fun_detail = array(
			   							'is_completed'		=> 	1,
			   							'payment_option'	=>	1
			   					);
			   					$this->_name="ln_loanmember_funddetail";
			   					$where = $db->quoteInto("id=?", $data["mfdid_".$i]);
			   					
			   					$db->getProfiler()->setEnabled(true);
			   					
			   					$this->update($arr_update_fun_detail, $where);
			   					
			   					Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
			   					Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
			   					$db->getProfiler()->setEnabled(false);
			   					
			   				}else{
			   					print_r("ede");
			   					$new_sub_interest_amount = $data["sub_interest_".$i];
			   					$new_sub_penelize = $data["sub_penelize_".$i];
			   					$new_sub_service_charge = $data["sub_service_charge_".$i];
			   					$new_sub_principle = $data["sub_principal_permonth_".$i];
				   				if($sub_recieve_amount>0){
				   					$new_amount_after_service = $sub_recieve_amount-$sub_service_charge;
				   					if($new_amount_after_service>=0){
				   						$new_sub_service_charge = 0;
				   						$new_amount_after_penelize = $new_amount_after_service - $sub_peneline_amount;
				   						if($new_amount_after_penelize>=0){
				   							$new_sub_penelize = 0;
				   							$new_amount_after_interest = $new_amount_after_penelize - $sub_interest_amount;
				   							if($new_amount_after_interest>=0){
				   								$new_sub_interest_amount = 0;
				   								$new_sub_principle = $sub_principle - $new_amount_after_interest;
				   							}else{
				   								$new_sub_interest_amount = abs($new_amount_after_interest);
				   							}
				   						}else{
				   							$new_sub_penelize = abs($new_amount_after_penelize);
				   						}
				   					}else{
				   						$new_sub_service_charge = abs($new_amount_after_service);
				   					}
				   				}
				   				$arr_money_detail = array(
				   						'crm_id'				=>		$client_recipt_money,
			   							'loan_number'			=>		$data["loan_number_".$i],
			   							'lfd_id'				=>		$data["mfdid_".$i],
			   							'client_id'				=>		$data["client_id_".$i],
			   							'date_payment'			=>		$data["date_payment_".$i],
			   							'capital'				=>		$data["sub_total_priciple_".$i],
			   							'remain_capital'		=>		$data["sub_total_priciple_".$i] - $data["sub_principal_permonth_".$i],
			   							'principal_permonth'	=>		$data["sub_principal_permonth_".$i],
			   							'total_interest'		=>		$data["sub_interest_".$i],
			   							'total_payment'			=>		$data["sub_payment_".$i],
			   							'total_recieve'			=>		$data["sub_recive_amount_".$i],
			   							'currency_id'			=>		$data["cu_id_".$i],
			   							'pay_after'				=>		$data['multiplier_'.$i],
			   							'penelize_amount'		=>		$data["old_penelize_".$i],
			   							'service_charge'		=>		$data["old_service_charge_".$i],
			   							'is_completed'			=>		0,
			   							'is_verify'				=>		0,
			   							'verify_by'				=>		0,
			   							'is_closingentry'		=>		0,
			   							'status'				=>		1
				   				);
				   				
				   				$db->getProfiler()->setEnabled(true);
				   				
				   				$db->insert("ln_client_receipt_money_detail", $arr_money_detail);
				   				
				   				Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
				   				Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
				   				$db->getProfiler()->setEnabled(false);
				   				
				   				$arr_update_fun_detail = array(
				   						'is_completed'			=> 	0,
				   						'total_interest_after'	=>  $new_sub_interest_amount,
				   						'total_payment_after'	=>	$new_sub_principle,
				   						'penelize'				=>	$new_sub_penelize,
				   						'principle_after'		=>	$new_sub_principle,
				   						'service_charge'		=>	$new_sub_service_charge,
				   						'payment_option'		=>	1
				   				);
				   				$this->_name="ln_loanmember_funddetail";
				   				$where = $db->quoteInto("id=?", $data["mfdid_".$i]);
				   				
				   				$db->getProfiler()->setEnabled(true);
				   				
				   				$this->update($arr_update_fun_detail, $where);
				   				
				   				Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
				   				Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
				   				$db->getProfiler()->setEnabled(false);
			   				}
	   					}
	   					$loan_fun = $db_loan_fun->getFunByGroupId($group_id);
	   					if(empty($loan_fun) or $loan_fun="" or $loan_fun=null){
	   						$sql_mem = "SELECT lm.`member_id` FROM `ln_loan_member` AS lm WHERE lm.`group_id`=$group_id";
	   						$row_mem = $db->fetchAll($sql_mem);
	   						foreach ($row_mem as $rs_mem){
		   						$arr_member = array(
		   							'is_completed'	=> 1,
		   						);
		   						$this->_name ="ln_loan_member";
		   						$where = $db->quoteInto("member_id=?", $rs_mem["member_id"]);
		   						
		   						$db->getProfiler()->setEnabled(true);
		   						
		   						$this->update($arr_member, $where);
		   						
		   						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
		   						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
		   						$db->getProfiler()->setEnabled(false);
		   						
		   						$arr_group = array(
		   							'status'	=> 2,
		   						);
		   						$this->_name ="ln_loan_group";
		   						$where = $db->quoteInto("g_id=?", $group_id);
		   						
		   						$db->getProfiler()->setEnabled(true);
		   						
		   						$this->update($arr_group, $where);
		   						
		   						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
		   						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
		   						$db->getProfiler()->setEnabled(false);
	   						}
	   					}
	   				}
	   			}
   			}
//    			exit();
   			$db->commit();
   		}catch (Exception $e){
   			$db->rollBack();
   			Application_Model_DbTable_DbUserLog::writeMessageError($e->getMessage());
   		}
   }
   
   public function editQuickPayment($id,$data){
   	$db = $this->getAdapter();
   	$db->beginTransaction();
   	$session_user=new Zend_Session_Namespace('auth');
   	$user_id = $session_user->user_id;
   	$reciept_no=$this->getIlPaymentNumber();
   	$db_loanFun = new Loan_Model_DbTable_DbLoanILPayment();
   	$db_group = new Loan_Model_DbTable_DbGroupPayment();
   	
   	try {
   		$is_set=0;
   		$quick_fun = $this->getIlQuickPaymentDetailById($id);
   		$identify = explode(',',$data['identity']);
   		if(!empty($identify)){
   			$arr_reciept_money = array(
   					'co_id'							=>		$data['co_id'],
   					'receiver_id'					=>		$data['reciever'],
   					'branch_id'						=>		$data['branch_id'],
   					'date_input'					=>		$data["collect_date"],
   					'principal_amount'				=>		$data["priciple_amount"],
   					'total_principal_permonth'		=>		$data["os_amount"],
   					'total_payment'					=>		$data["total_payment"],
   					'total_interest'				=>		$data["total_interest"],
   					'recieve_amount'				=>		$data["amount_receive"],
   					'penalize_amount'				=>		$data['penalize_amount'],
   					'return_amount'					=>		$data["amount_return"],
   					'service_charge'				=>		$data["service_charge"],
   					'note'							=>		$data['note'],
   					'user_id'						=>		$user_id,
   					'is_group'						=>		2,
   					'payment_option'				=>		1,
   					'currency_type'					=>		$data["currency_type"],
   					'status'						=>		1,
   					'amount_payment'				=>		$data["amount_receive"]-$data["amount_return"],
   					'is_completed'					=>		1
   			);
   				
   			$this->_name="ln_client_receipt_money";
   			$where = $db->quoteInto("id=?", $id);
   			$this->update($arr_reciept_money, $where);
   			
   			$recipt_money = $db_loan->getReceiptMoneyById($id);
			$recipt_money_detail = $db_loan->getReceiptMoneyDetailByID($id);
			foreach ($recipt_money_detail as $row_recipt_detail){
				$fun_id = $row_recipt_detail["lfd_id"];
				if($is_set!=1){
					$loan_number = $row_recipt_detail["loan_number"];
					$rs_fun = $db_group->getFunDetailByLoanNumber($loan_number);
					$rs_group = "SELECT m.group_id FROM ln_loan_member AS m WHERE m.loan_number = '$loan_number' GROUP BY m.loan_number";
					$group_id = $db->fetchOne($rs_group);
					if(empty($rs_fun) or $rs_fun=="" or $rs_fun==null){
						$arr_member = array(
							'is_completed'	=>	0,
						);
						$this->_name = "ln_loan_member";
						$where = $db->quoteInto("loan_number=?", $loan_number);
						
						$db->getProfiler()->setEnabled(true);
						
						$this->update($arr_member, $where);
						
						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
						$db->getProfiler()->setEnabled(false);
						
						$arr_group = array(
							'status'	=>	1,
						);
						$this->_name = "ln_loan_group";
						$where = $db->quoteInto("g_id=?", $group_id);
						
						$db->getProfiler()->setEnabled(true);
						
						$this->update($arr_group, $where);
						
						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
						$db->getProfiler()->setEnabled(false);
					}
					$is_set=1;
				}
				if($recipt_money["payment_option"]==1){
					$is_completed = $db_loan->getFunDetailById($fun_id);
					if($is_completed==1){
						$arr_update = array(
							'is_completed' =>	0,
						);
						$this->_name = "ln_loanmember_funddetail";
						$where = $db->quoteInto("id=?", $fun_id);
						
						$db->getProfiler()->setEnabled(true);
						
						$this->update($arr_update, $where);
						
						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
						$db->getProfiler()->setEnabled(false);
					}else{
						$arr_update = array(
							'principle_after'		=> 	$row_recipt_detail["principal_permonth"],
							'total_interest_after'	=>	$row_recipt_detail["total_interest"],
							'penelize'				=>	$row_recipt_detail["penelize_amount"],
							'service_charge'		=>	$row_recipt_detail["service_charge"],
							'total_payment_after'	=>	$row_recipt_detail["total_payment"],	
							'is_completed' 			=>	0,
						);
						$this->_name = "ln_loanmember_funddetail";
						$where = $db->quoteInto("id=?", $fun_id);
						
						$db->getProfiler()->setEnabled(true);
						
						$this->update($arr_update, $where);
						
						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
						$db->getProfiler()->setEnabled(false);
					}
				}else{
					$arr_update = array(
							'is_completed' =>	0,
					);
					$this->_name = "ln_loanmember_funddetail";
					$where = $db->quoteInto("id=?", $fun_id);
					
					$db->getProfiler()->setEnabled(true);
					
					$this->update($arr_update, $where);
					
					Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
					Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
					$db->getProfiler()->setEnabled(false);
				}
			}
			
			$sql_cmd = "DELETE FROM `ln_client_receipt_money_detail` WHERE `crm_id` = $id";
			$db->query($sql_cmd);
   			
   			if(!empty($quick_fun)){
   				foreach ($quick_fun as $rs){
   					$principle = $rs["principal_permonth"];
   					$interest = $rs["total_interest"];
   					$recieve_amount = $rs["total_recieve"];
   					$total_pay = $rs["total_payment"];
   					$penelize = $rs["penelize_amount"];
   					$service_charge = $rs["service_charge"];
   					
   					$old_group_id = $rs["group_id"];
   					$old_datepayment = $rs["date_payment"];
   					
   					$fun = $db_loanFun->getLoanFunByGroupId($old_group_id, $old_datepayment);
   					foreach ($fun as $row_fun){
   						
   						if($row_fun["is_completed"]==1){
   							$arr_fun = array(
   								'is_completed'	=>	0,
   							);
   							$this->_name= "ln_loanmember_funddetail";
   							$where = $db->quoteInto("id=?", $row_fun["id"]);
   							
   							$db->getProfiler()->setEnabled(true);
   							$this->update($arr_fun, $where);
   							Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
   							Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
   							$db->getProfiler()->setEnabled(false);
   						}else{
	   						$arr_fun = array(
	   							'principle_after'	=>	$principle,
	   							'total_interest_after'	=> $interest,
	   							'total_payment_after'	=>	$total_pay,
	   							'penelize'				=>	$penelize,
	   							'service_charge'		=>	$service_charge,
	   						);
	   						$this->_name= "ln_loanmember_funddetail";
	   						$where = $db->quoteInto("id=?", $row_fun["id"]);
	   						
	   						$db->getProfiler()->setEnabled(true);
	   						$this->update($arr_fun, $where);
	   						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
	   						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
	   						$db->getProfiler()->setEnabled(false);
   						}
   					}
   				}
   			}
   			
   			foreach ($identify as $i){
   				$client_detail = $data["mfdid_".$i];
   				$sub_recieve_amount = $data["sub_recive_amount_".$i];
   				$sub_service_charge = $data["sub_service_charge_".$i];
   				$sub_peneline_amount = $data["sub_penelize_".$i];
   				$sub_interest_amount = $data["sub_interest_".$i];
   				$sub_principle= $data["sub_principal_permonth_".$i];
   				$sub_total_payment = $data["sub_payment_".$i];
   				if($client_detail!=""){
   					$loan_type = $data["loan_type_".$i];
   					$group_id = $data["group_id_".$i];
   					$pay_date = $data["date_payment_".$i];
   						
   					$loanFun = $db_loanFun->getLoanFunByGroupId($group_id,$pay_date);
   					if($loan_type==2){
   						if(!empty($loanFun) or $loanFun!="" or $loanFun!=null){
   							foreach ($loanFun as $rowFun){
   								if($is_set!=1){
   									$total_pene = $data["sub_penelize_".$i];
   									$total_pay = $rowFun["total_payment_after"]+$data["sub_penelize_".$i];
   									$is_set=1;
   								}else{
   									$total_pene = $rowFun["penelize"];
   									$total_pay = $rowFun["total_payment_after"];
   								}
   			
   								$arr_money_detail = array(
   										'crm_id'				=>		$id,
   										'loan_number'			=>		$rowFun["loan_number"],
   										'lfd_id'				=>		$rowFun["id"],
   										'client_id'				=>		$rowFun["client_id"],
   										'date_payment'			=>		$rowFun["date_payment"],
   										'capital'				=>		$rowFun["total_capital"],
   										'remain_capital'		=>		$rowFun["total_capital"] - $rowFun["principle_after"],
   										'principal_permonth'	=>		$rowFun["principle_after"],
   										'total_interest'		=>		$rowFun["total_interest_after"],
   										'total_payment'			=>		$total_pay,
   										'total_recieve'			=>		$total_pay,
   										'currency_id'			=>		$data["cu_id_".$i],
   										'pay_after'				=>		$data['multiplier_'.$i],
   										'penelize_amount'		=>		$total_pene,
   										'service_charge'		=>		$data["sub_service_charge_".$i],
   										'is_completed'			=>		1,
   										'is_verify'				=>		0,
   										'verify_by'				=>		0,
   										'is_closingentry'		=>		0,
   										'status'				=>		1
   								);
   								$db->getProfiler()->setEnabled(true);
   								$db->insert("ln_client_receipt_money_detail", $arr_money_detail);
   								Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
   								Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
   								$db->getProfiler()->setEnabled(false);
   			
   								$arr_fu = array(
   										'is_completed'	=> 1,
   								);
   								$this->_name="ln_loanmember_funddetail";
   								$where = $db->quoteInto("id=?", $rowFun["id"]);
   								$db->getProfiler()->setEnabled(true);
   								$this->update($arr_fu, $where);
   								Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
   								Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
   								$db->getProfiler()->setEnabled(false);
   							}
   						}
   							
   					}else{
   						if($sub_recieve_amount>=$sub_total_payment){
   							$arr_money_detail = array(
   									'crm_id'				=>		$id,
   									'loan_number'			=>		$data["loan_number_".$i],
   									'lfd_id'				=>		$data["mfdid_".$i],
   									'client_id'				=>		$data["client_id_".$i],
   									'date_payment'			=>		$data["date_payment_".$i],
   									'capital'				=>		$data["sub_total_priciple_".$i],
   									'remain_capital'		=>		$data["sub_total_priciple_".$i] - $data["sub_principal_permonth_".$i],
   									'principal_permonth'	=>		$data["sub_principal_permonth_".$i],
   									'total_interest'		=>		$data["sub_interest_".$i],
   									'total_payment'			=>		$data["sub_payment_".$i],
   									'total_recieve'			=>		$data["sub_recive_amount_".$i],
   									'currency_id'			=>		$data["cu_id_".$i],
   									'pay_after'				=>		$data['multiplier_'.$i],
   									'penelize_amount'		=>		$data["old_sub_penelize_".$i],
			   							'service_charge'		=>		$data["old_sub_service_charge_".$i],
   									'is_completed'			=>		0,
   									'is_verify'				=>		0,
   									'verify_by'				=>		0,
   									'is_closingentry'		=>		0,
   									'status'				=>		1
   							);
   							$db->insert("ln_client_receipt_money_detail", $arr_money_detail);
   			
   							$arr_update_fun_detail = array(
   									'is_completed'		=> 	1,
   									'payment_option'	=>	1
   							);
   							$this->_name="ln_loanmember_funddetail";
   							$where = $db->quoteInto("id=?", $data["mfdid_".$i]);
   							 
   							$this->update($arr_update_fun_detail, $where);
   							 
   						}else{
   							$new_sub_interest_amount = $data["sub_interest_".$i];
   							$new_sub_penelize = $data["sub_penelize_".$i];
   							$new_sub_service_charge = $data["sub_service_charge_".$i];
   							$new_sub_principle = $data["sub_principal_permonth_".$i];
   							if($sub_recieve_amount>0){
   								$new_amount_after_service = $sub_recieve_amount-$sub_service_charge;
   								if($new_amount_after_service>=0){
   									$new_sub_service_charge = 0;
   									$new_amount_after_penelize = $new_amount_after_service - $sub_peneline_amount;
   									if($new_amount_after_penelize>=0){
   										$new_sub_penelize = 0;
   										$new_amount_after_interest = $new_amount_after_penelize - $sub_interest_amount;
   										if($new_amount_after_interest>=0){
   											$new_sub_interest_amount = 0;
   											$new_sub_principle = $sub_principle - $new_amount_after_interest;
   										}else{
   											$new_sub_interest_amount = abs($new_amount_after_interest);
   										}
   									}else{
   										$new_sub_penelize = abs($new_amount_after_penelize);
   									}
   								}else{
   									$new_sub_service_charge = abs($new_amount_after_service);
   								}
   							}
   							$arr_money_detail = array(
   									'crm_id'				=>		$id,
   									'loan_number'			=>		$data["loan_number_".$i],
   									'lfd_id'				=>		$data["mfdid_".$i],
   									'client_id'				=>		$data["client_id_".$i],
   									'date_payment'			=>		$data["date_payment_".$i],
   									'capital'				=>		$data["sub_total_priciple_".$i],
   									'remain_capital'		=>		$data["sub_total_priciple_".$i] - $data["sub_principal_permonth_".$i],
   									'principal_permonth'	=>		$sub_principle,
   									'total_interest'		=>		$sub_interest_amount,
   									'total_payment'			=>		$sub_total_payment,
   									'total_recieve'			=>		$data["sub_recive_amount_".$i],
   									'currency_id'			=>		$data["cu_id_".$i],
   									'pay_after'				=>		$data['multiplier_'.$i],
   									'penelize_amount'		=>		$data["sub_penelize_".$i],
   									'service_charge'		=>		$data["sub_service_charge_".$i],
   									'is_completed'			=>		0,
   									'is_verify'				=>		0,
   									'verify_by'				=>		0,
   									'is_closingentry'		=>		0,
   									'status'				=>		1
   							);
   							$db->insert("ln_client_receipt_money_detail", $arr_money_detail);
   							 
   							$arr_update_fun_detail = array(
   									'is_completed'			=> 	0,
   									'total_interest_after'	=>  $new_sub_interest_amount,
   									'total_payment_after'	=>	$new_sub_principle,
   									'penelize'				=>	$new_sub_penelize,
   									'principle_after'		=>	$new_sub_principle,
   									'service_charge'		=>	$new_sub_service_charge,
   									'payment_option'		=>	1
   							);
   							$this->_name="ln_loanmember_funddetail";
   							$where = $db->quoteInto("id=?", $data["mfdid_".$i]);
   							$this->update($arr_update_fun_detail, $where);
   						}
   					}
   					$loan_fun = $db_loanFun->getFunByGroupId($group_id);
   					if(empty($loan_fun) or $loan_fun="" or $loan_fun=null){
   						$sql_mem = "SELECT lm.`member_id` FROM `ln_loan_member` AS lm WHERE lm.`group_id`=$group_id";
   						$row_mem = $db->fetchAll($sql_mem);
   						foreach ($row_mem as $rs_mem){
   							$arr_member = array(
   									'is_completed'	=> 1,
   							);
   							$this->_name ="ln_loan_member";
   							$where = $db->quoteInto("member_id=?", $rs_mem["member_id"]);
   							$this->update($arr_member, $where);
   								
   							$arr_group = array(
   									'status'	=> 2,
   							);
   							$this->_name ="ln_loan_group";
   							$where = $db->quoteInto("g_id=?", $group_id);
   							$this->update($arr_group, $where);
   						}
   					}
   				}
   			}
   		}
   		exit();
//    		$db->commit();
   	}catch (Exception $e){
   		$db->rollBack();
   		Application_Model_DbTable_DbUserLog::writeMessageError($e->getMessage());
   	}
   }
   
   function getIlQuickPaymentById($id){
   	$db = $this->getAdapter();
   	$sql = "SELECT lc.id,lc.`co_id`,lc.`receiver_id`,lc.`receipt_no`,lc.`branch_id`,lc.`date_input`,lc.`principal_amount`,lc.`total_principal_permonth`,
   			lc.`total_payment`,lc.`total_interest`,lc.`recieve_amount`,lc.`return_amount`,lc.`service_charge`,lc.`penalize_amount`,lc.`currency_type`, lc.`note` 
   			FROM `ln_client_receipt_money` AS lc WHERE lc.`id`=$id";
   	return $db->fetchRow($sql);
   }
   
   function getIlQuickPaymentDetailById($id){
   	$db = $this->getAdapter();
//    	$sql = "SELECT 
// 			  lcd.`lfd_id`,
// 			  lcd.`loan_number`,
// 			  lcd.`client_id`,
// 			  lcd.`date_payment`,
// 			  lcd.`capital`,
// 			  lcd.`principal_permonth`,
// 			  lcd.`total_interest`,
// 			  lcd.`total_payment`,
// 			  lcd.`total_recieve`,
// 			  lcd.`service_charge`,
// 			  lcd.`penelize_amount`,
// 			  lcd.`pay_after`,
// 			  (SELECT c.`name_kh` FROM `ln_client` AS c WHERE c.`client_id`=lcd.`client_id`) AS client_name,
// 			  (SELECT c.`client_number` FROM `ln_client` AS c WHERE c.`client_id`=lcd.`client_id`) AS client_code,
// 			  (SELECT lm.`collect_typeterm` FROM `ln_loan_member` AS lm WHERE lm.`loan_number`=lcd.`loan_number`) AS payTearm,
// 			  (SELECT lm.`interest_rate` FROM `ln_loan_member` AS lm WHERE lm.`loan_number`=lcd.`loan_number`) AS interest_rate,
// 			  (SELECT lm.`currency_type` FROM `ln_loan_member` AS lm WHERE lm.`loan_number`=lcd.`loan_number`) AS currency_type,
// 			  (SELECT lcrm.`date_input` FROM `ln_client_receipt_money` AS lcrm,`ln_client_receipt_money_detail` AS lcrmd WHERE lcrm.`id`!=$id AND lcrmd.`crm_id`=lcrm.`id` AND lcrm.`loan_number`=(SELECT `loan_number` FROM `ln_client_receipt_money_detail` WHERE `crm_id`=$id LIMIT 1) ORDER BY lcrm.`date_input` DESC LIMIT 1) AS last_paydate 
// 			FROM
// 			  `ln_client_receipt_money_detail` AS lcd 
// 			WHERE lcd.`crm_id` =$id";
		$sql ="SELECT 
				  lcd.`lfd_id`,
				  lcd.`loan_number`,
				  lcd.`client_id`,
				  lcd.`date_payment`,
				  lcd.`capital`,
				  SUM(lcd.`principal_permonth`) AS principal_permonth,
				  SUM(lcd.`total_interest`) AS total_interest,
				  SUM(lcd.`total_payment`) AS total_payment,
				  SUM(lcd.`total_recieve`) AS total_recieve,
				  SUM(lcd.`service_charge`) AS service_charge,
				  SUM(lcd.`penelize_amount`) AS penelize_amount,
				  lcd.`pay_after`,
				  (SELECT c.`name_kh` FROM `ln_client` AS c WHERE c.`client_id`=lcd.`client_id`) AS client_name,
				  (SELECT c.`client_number` FROM `ln_client` AS c WHERE c.`client_id`=lcd.`client_id`) AS client_code,
				  (SELECT lcrm.`date_input` FROM `ln_client_receipt_money` AS lcrm,`ln_client_receipt_money_detail` AS lcrmd WHERE lcrm.`id`!=$id AND lcrmd.`crm_id`=lcrm.`id` AND lcrm.`loan_number`=(SELECT `loan_number` FROM `ln_client_receipt_money_detail` WHERE `crm_id`=$id LIMIT 1) ORDER BY lcrm.`date_input` DESC LIMIT 1) AS last_paydate ,
				  m.`group_id` ,
				  m.`collect_typeterm` as payTearm,
				  m.`interest_rate`,
				  m.`currency_type`,
				  lg.`loan_type`
				FROM
				  `ln_client_receipt_money_detail` AS lcd,
				  `ln_loan_member` AS m,
				  `ln_loanmember_funddetail` AS lf,
				  `ln_loan_group` AS lg 
				WHERE lcd.`lfd_id` = lf.`id` 
				  AND lf.`member_id` = m.`member_id` 
				  AND m.`group_id`=lg.`g_id`
				  AND lcd.`crm_id`=$id
				  GROUP BY m.`group_id`,lcd.`date_payment`";
   //	return $sql;
   	return $db->fetchAll($sql);
   }
   
   public function getFunDetail($id){
   	$db = $this->getAdapter();
   	$sql="SELECT f.`id`,f.`penelize`,f.`principle_after`,f.`service_charge`,f.`total_interest_after`,f.`total_payment_after`,f.`is_completed` FROM `ln_loanmember_funddetail` AS f WHERE f.`id`=$id";
   	return $db->fetchAll($sql);
   }
   
   public function getLoanFunByGroupId($id,$payDate){
   	$db = $this->getAdapter();
   	$sql = "SELECT 
			  lf.`id`,
			  lf.`principle_after`,
			  lf.`total_interest_after`,
			  lf.`total_principal`,
			  lf.`penelize`,
			  lf.`service_charge`,
			  lf.`date_payment`,
			  lf.`total_payment_after`,
			  lm.`client_id`,
			  lm.`loan_number`,
			  lm.`total_capital`,
			  lm.`group_id`,
			  lf.`is_completed`
			FROM
			  `ln_loanmember_funddetail` AS lf,
			  `ln_loan_member` AS lm 
			WHERE lm.`member_id` = lf.`member_id` 
			   	AND lm.`group_id` = $id 
			   	AND lf.`date_payment` ='$payDate'";
   	$rs_fun = $db->fetchAll($sql);
   	return $rs_fun;
   }
   
   function cancelPaymnet($data){
   	$db = $this->getAdapter();
   	$db_il = new Loan_Model_DbTable_DbLoanILPayment();
   	$db_recipt= new Loan_Model_DbTable_DbGroupPayment();
   	$db->beginTransaction();
   	try{
   		$id = $data["id"];
   		$sql_option = "SELECT cr.`payment_option`,cr.`recieve_amount`,cr.`total_payment` FROM `ln_client_receipt_money` AS cr WHERE cr.`id`=$id";
   		$rs = $db->fetchRow($sql_option);
   		$reciept_detail = $db_il->getRecieptMoneyDetailById($id);
   		if(!empty($reciept_detail)){
   			foreach ($reciept_detail as $row_rd){
   				$old_loan_number = $row_rd["loan_number"];
   				$rs_fun = $db_recipt->getFunDetailByLoanNumber($old_loan_number);
   				$rs_recipt = $db_recipt->getReciptDetailById($id);
   				if($rs_fun=="" or $rs_fun==null){
   					$arr_member = array(
   							'is_completed'	=> 0,
   					);
   					$this->_name = "ln_loan_member";
   					$where = $db->quoteInto("loan_number=?", $loan_number);
   					 
   					$db->getProfiler()->setEnabled(true);
   					$this->update($arr_member, $where);
   					Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
   					Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
   					$db->getProfiler()->setEnabled(false);
   					 
   					$sql_group = "SELECT m.`group_id` FROM `ln_loan_member` AS m WHERE m.`loan_number`='$loan_number' LIMIT 1";
   					$rs_group = $db->fetchOne($sql);
   					 
   					$arr_group = array(
   							'status'	=> 1,
   					);
   					$this->_name = "ln_loan_group";
   					$where = $db->quoteInto("g_id=?", $rs_group["group_id"]);
   					 
   					$db->getProfiler()->setEnabled(true);
   					$this->update($arr_group, $where);
   					Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
   					Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
   					$db->getProfiler()->setEnabled(false);
   					 
   					foreach ($rs_recipt as $row_recipt){
   						$arr_fun = array(
   								'is_completed'	=>0,
   						);
   						$this->_name="`ln_loanmember_funddetail`";
   						$where = $db->quoteInto("id=?", $row_recipt["lfd_id"]);
   				
   						$db->getProfiler()->setEnabled(true);
   						$this->update($arr_fun, $where);
   						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
   						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
   						$db->getProfiler()->setEnabled(false);
   					}
   				}else{
   					if($rs["payment_option"]==1){
   						foreach ($rs_recipt as $row_recipt){
   							$fun_id = $row_recipt['lfd_id'];
   							$sql = "SELECT * FROM ln_loanmember_funddetail WHERE id= $fun_id";
   							$result_fun = $db->fetchAll($sql);
   							$fun = $db_recipt->getFunHasPayedByLoanNumber($row_recipt["lfd_id"]);
   							foreach ($result_fun as $result_row){
   								$fun_penelize = $result_row["penelize"];
   								$fun_service = $result_row["service_charge"];
   								if($fun["is_completed"]==0){
   									$total_pay = $row_recipt["total_payment"];
   									$total_recieve = $row_recipt["total_recieve"];
   									$principle = $row_recipt["principal_permonth"];
   									$interest = $row_recipt["total_interest"];
   									$penelize = $row_recipt["penelize_amount"];
   									$service =$row_recipt["service_charge"];
   				
   									$new_recieve = $total_recieve-$service;
   									if($new_recieve>0){
   										$old_service =0;
   										$new_recieve = $new_recieve-$penelize;
   										if($new_recieve>0){
   											$old_penelize =0;
   											//$new_recieve = $new_recieve - $interest;
   											//if($new_recieve>0){
   											// 	 $old_interest = 0;
   											// 	 $new_recieve = $new_recieve - $penelize;
   											// 	 if($new_recieve>0){
   											// 	    	$old_principle = 0;
   											// 	 }
   											//}else{
   											// 	 $old_interest = abs($new_recieve);
   											//}
   										}else{
   											$old_penelize = abs($new_recieve);
   										}
   									}else{
   										$old_service = abs($new_recieve);
   					    		
   									}
   									$arr_fun = array(
   											"principle_after" 		=> $principle,
   											'total_interest_after'	=>	$interest,
   											'penelize'				=> $fun_penelize-$old_penelize,
   											'service_charge'		=>	$fun_service-$old_service,
   											'total_payment_after'	=> $principle+$interest+($fun_penelize-$old_penelize)+($fun_service-$old_service),
   									);
   									$this->_name = "ln_loanmember_funddetail";
   									$where = $db->quoteInto("id=?", $row_recipt["lfd_id"]);
   				
   									$db->getProfiler()->setEnabled(true);
   				
   									$this->update($arr_fun, $where);
   				
   									Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
   									Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
   									$db->getProfiler()->setEnabled(false);
   								}else{
   									foreach ($rs_recipt as $row_recipt){
   										$arr_fun = array(
   												'is_completed'			=>	0,
   										);
   										$this->_name = "ln_loanmember_funddetail";
   										$where = $db->quoteInto("id=?", $row_recipt["lfd_id"]);
   				
   										$db->getProfiler()->setEnabled(true);
   				
   										$this->update($arr_fun, $where);
   				
   										Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
   										Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
   										$db->getProfiler()->setEnabled(false);
   									}
   								}
   							}
   						}
   					}
   				}
   			}
   		}
   		$sql = "DELETE FROM `ln_client_receipt_money` WHERE `id`=$id";
   		
   		$db->getProfiler()->setEnabled(true);
   		
   		$db->query($sql);
   		
   		Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
   		Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
   		$db->getProfiler()->setEnabled(false);
   		
   		$sql_cmd = "DELETE FROM `ln_client_receipt_money_detail` WHERE `crm_id` = $id";
   		
   		$db->getProfiler()->setEnabled(true);
   		
   		$db->query($sql_cmd);
   		
   		Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
   		Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
   		$db->getProfiler()->setEnabled(false);
//    		exit();
   		$db->commit();
   	}catch (Exception $e){
   		$db->rollBack();
   		Application_Model_DbTable_DbUserLog::writeMessageError($e->getMessage());
   	}
   }
public function cancelIlPayment($data){
	$db = $this->getAdapter();
	$db_loan = new Loan_Model_DbTable_DbLoanILPayment();
	$db_group = new Loan_Model_DbTable_DbGroupPayment();
	$db->beginTransaction();
	$is_set = 0;
	try{
		$id = $data["id"];
		$recipt_money = $db_loan->getReceiptMoneyById($id);
		$recipt_money_detail = $db_loan->getReceiptMoneyDetailByID($id);
			foreach ($recipt_money_detail as $row_recipt_detail){
				$fun_id = $row_recipt_detail["lfd_id"];
				if($is_set!=1){
					$loan_number = $row_recipt_detail["loan_number"];
					$rs_fun = $db_group->getFunDetailByLoanNumber($loan_number);
					$rs_group = "SELECT m.group_id FROM ln_loan_member AS m WHERE m.loan_number = '$loan_number' GROUP BY m.loan_number";
					$group_id = $db->fetchOne($rs_group);
					if(empty($rs_fun) or $rs_fun=="" or $rs_fun==null){
						$arr_member = array(
							'is_completed'	=>	0,
						);
						$this->_name = "ln_loan_member";
						$where = $db->quoteInto("loan_number=?", $loan_number);
						
						$db->getProfiler()->setEnabled(true);
						
						$this->update($arr_member, $where);
						
						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
						$db->getProfiler()->setEnabled(false);
						
						$arr_group = array(
							'status'	=>	1,
						);
						$this->_name = "ln_loan_group";
						$where = $db->quoteInto("g_id=?", $group_id);
						
						$db->getProfiler()->setEnabled(true);
						
						$this->update($arr_group, $where);
						
						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
						$db->getProfiler()->setEnabled(false);
					}
					$is_set=1;
				}
				if($recipt_money["payment_option"]==1){
					echo 1111;
					
					$is_completed = $db_loan->getFunDetailById($fun_id);
					if($is_completed==1){
						$arr_update = array(
							'is_completed' =>	0,
						);
						$this->_name = "ln_loanmember_funddetail";
						$where = $db->quoteInto("id=?", $fun_id);
						
						$db->getProfiler()->setEnabled(true);
						
						$this->update($arr_update, $where);
						
						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
						$db->getProfiler()->setEnabled(false);
					}else{
						$arr_update = array(
							'principle_after'		=> 	$row_recipt_detail["principal_permonth"],
							'total_interest_after'	=>	$row_recipt_detail["total_interest"],
							'penelize'				=>	$row_recipt_detail["penelize_amount"],
							'service_charge'		=>	$row_recipt_detail["service_charge"],
							'total_payment_after'	=>	$row_recipt_detail["total_payment"],	
							'is_completed' 			=>	0,
						);
						$this->_name = "ln_loanmember_funddetail";
						$where = $db->quoteInto("id=?", $fun_id);
						
						$db->getProfiler()->setEnabled(true);
						
						$this->update($arr_update, $where);
						
						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
						Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
						$db->getProfiler()->setEnabled(false);
					}
				}else{
					$arr_update = array(
							'is_completed' =>	0,
					);
					$this->_name = "ln_loanmember_funddetail";
					$where = $db->quoteInto("id=?", $fun_id);
					
					$db->getProfiler()->setEnabled(true);
					
					$this->update($arr_update, $where);
					
					Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
					Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
					$db->getProfiler()->setEnabled(false);
				}
			}
			
			$sql = "DELETE FROM `ln_client_receipt_money` WHERE `id`=$id";
			
			$db->getProfiler()->setEnabled(true);
			
			$db->query($sql);
			
			Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
			Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
			$db->getProfiler()->setEnabled(false);
			
			$sql_cmd = "DELETE FROM `ln_client_receipt_money_detail` WHERE `crm_id` = $id";
			
			$db->getProfiler()->setEnabled(true);
			
			$db->query($sql_cmd);
			
			Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQuery());
			Zend_Debug::dump($db->getProfiler()->getLastQueryProfile()->getQueryParams());
			$db->getProfiler()->setEnabled(false);
		exit();
// 		$db->commit();
	}catch (Exception $e){
		$db->rollBack();
		echo $e->getMessage();
		
	}
}   
   public function getReceiptMoneyById($id){
   	$db = $this->getAdapter();
   	$sql = "SELECT lc.id,lc.`service_charge`,lc.`penalize_amount`,lc.`payment_option`,lc.`recieve_amount`,lc.`total_interest`,lc.`total_payment` FROM `ln_client_receipt_money` AS lc WHERE lc.`id`=$id";
   	return $db->fetchRow($sql);
   }
    
   public function getReceiptMoneyDetailByID($id){
   	$db = $this->getAdapter();
   	$sql = "SELECT lc.`crm_id`,lc.`lfd_id`,lc.`loan_number`,lc.`service_charge`,lc.`penelize_amount`,lc.`total_interest`,lc.`total_payment`,lc.`total_recieve`,lc.`principal_permonth` FROM `ln_client_receipt_money_detail` AS lc WHERE lc.`crm_id`=$id";
   	return $db->fetchAll($sql);
   }
   public function getFunDetailById($id){
   	$db = $this->getAdapter();
   	$sql = "SELECT lf.`is_completed` FROM `ln_loanmember_funddetail` AS lf WHERE lf.id =$id";
   	return $db->fetchOne($sql);
   }
}

