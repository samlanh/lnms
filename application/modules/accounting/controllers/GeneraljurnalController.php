<?php
class accounting_GeneraljurnalController extends Zend_Controller_Action {
	public function init()
	{
		/* Initialize action controller here */
		header('content-type: text/html; charset=utf8');
		defined('BASE_URL')	|| define('BASE_URL', Zend_Controller_Front::getInstance()->getBaseUrl());
	}
	public function addAction(){
		$fm = new Accounting_Form_FrmGeneraljurnal();
		$frm = $fm->FrmGeneraljurnal();
		Application_Model_Decorator::removeAllDecorator($frm);
		$this->view->frm_fixedasset = $frm;
		$db = new Accounting_Model_DbTable_DbJournal();
		$this->view->row_parents = $db->getAllParrentAccount(1);
		$this->view->row_accountname = $db->getAllParrentAccount(1,1);
		
	}
	public function indexAction(){
		if($this->getRequest()->isPost()){
			$db = new Group_Model_DbTable_DbClient();
			$data = $this->getRequest()->getPost();
			$_data['status']=1;
			$id = $db->addClient($data);
			print_r(Zend_Json::encode($id));
			exit();
		}
		
	}
	function getJcodeAction(){
		if($this->getRequest()->isPost()){
			$data = $this->getRequest()->getPost();
			$db = new Accounting_Model_DbTable_DbJournal();
			$acc_names = $db->getJEntryCode($data['branch_id']);
			print_r(Zend_Json::encode($acc_names));
			exit();
		}
	}
	function getParentptionAction(){
		if($this->getRequest()->isPost()){
			$data = $this->getRequest()->getPost();
			$db = new Accounting_Model_DbTable_DbJournal();
			$option = $db->getAllAccountByParrents($data['parent'],1);
			print_r(Zend_Json::encode($option));
			exit();
		}
	}
	function getParentaccountAction(){//2 request
		if($this->getRequest()->isPost()){
			$data = $this->getRequest()->getPost();
			$db = new Accounting_Model_DbTable_DbJournal();
			$acc_names = $db->getAllAccountByParrents($data['parent']);
			print_r(Zend_Json::encode($acc_names));
			exit();
		}
	}
}
