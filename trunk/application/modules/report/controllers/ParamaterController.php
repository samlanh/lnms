<?php
class Report_ParamaterController extends Zend_Controller_Action {
    public function init()
    {    	
     /* Initialize action controller here */
    	header('content-type: text/html; charset=utf8');
    	defined('BASE_URL')	|| define('BASE_URL', Zend_Controller_Front::getInstance()->getBaseUrl());
	}
  function indexAction(){
  	
  }
  
  function  rptStaffAction(){
  	$db  = new Report_Model_DbTable_DbParamater();
  	$this->view->staff_list = $db->getAllstaff();
  	//print_r($db->getAllstaff());
  	 
  }
  function rptZoneAction(){
  	$db  = new Report_Model_DbTable_DbParamater();
  	$this->view->zone_list = $db->getAllZone();
  
  }
  function rptHolidayAction(){
  	$db  = new Report_Model_DbTable_DbParamater();
  	$this->view->holiday_list = $db->getAllHoliday();
  }
}
