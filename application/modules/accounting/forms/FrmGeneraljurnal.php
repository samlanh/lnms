<?php 
Class Accounting_Form_FrmGeneraljurnal extends Zend_Dojo_Form {
	protected $tr;
	public function init()
	{
		$this->tr = Application_Form_FrmLanguages::getCurrentlanguage();
	}
	public function FrmGeneraljurnal($data=null){
		
		$Brance = new Zend_Dojo_Form_Element_FilteringSelect('branch_id');
		$Brance->setAttribs(array(
				'dojoType'=>'dijit.form.FilteringSelect',
				'class'=>'fullside',
				'required'=>true,
				'onchange'=>'getJurnalcode();'
		));
		$db = new Application_Model_DbTable_DbGlobal();
		$rows = $db->getAllBranchName();
		$options='';
		if(!empty($rows))foreach($rows AS $row){
			$options[$row['br_id']]=$row['branch_namekh'];
		}
		
		$rows = $db->getAllBranchName();
		$options=array(''=>'---Select Branch---');
		if(!empty($rows))foreach($rows AS $row){
			$options[$row['br_id']]=$row['branch_namekh'];
		}
		$Brance->setMultiOptions($options);
      	
		$parent = new Zend_Dojo_Form_Element_FilteringSelect('parent');
		$parent->setAttribs(array(
				'dojoType'=>'dijit.form.FilteringSelect',
				'class'=>'fullside',
				'required'=>true,
				'onchange'=>'getAllAccountNameByParents();'
		
		));
		
		$db = new Accounting_Model_DbTable_DbChartaccount();
		$option = $db->getAllchartaccount(3,1);
		$parent->setMultiOptions($option);
		
		$Add_Date = new Zend_Dojo_Form_Element_DateTextBox('add_date');
		$Add_Date->setAttribs(array(
				'dojoType'=>'dijit.form.DateTextBox',
				'class'=>'fullside',
				'required'=>true
		));
		$Add_Date->setValue(date('Y-m-d'));
		
		
		$Account_Number=new Zend_Dojo_Form_Element_TextBox('journal_code');
		$Account_Number->setAttribs(array(
				'dojoType'=>'dijit.form.TextBox',
				'class'=>'fullside',
				'readOnly'=>'readOnly',
				'required'=>'true'
		));
		$db= new Application_Model_DbTable_DbGlobal();
// 		$sql="SELECT id,account_name_en,account_code FROM ln_account_name WHERE status=1";
// 		$rows = $db->getGlobalDb($sql);
// 		$opt = '';
// 		if(!empty($rows)){
// 			foreach($rows as $row){
// 				$opt[$row['id']]=$row['account_code'];
// 			}
// 		}
// 		$Account_Number->setMultiOptions($opt);
		
// 		$Account_name = new Zend_Dojo_Form_Element_FilteringSelect('account_name');
// 		$Account_name->setAttribs(array(
// 				'dojoType'=>'dijit.form.FilteringSelect',
// 				'class'=>'fullside'
// 		));
		
// 		$opt = '';
// 		if(!empty($rows)){
// 			foreach($rows as $row){
// 				$opt[$row['id']]=$row['account_name_en'];
// 			}
// 		}
// 		$Account_name->setMultiOptions($opt);
		
		
		$Note = new Zend_Dojo_Form_Element_TextBox('note');
		$Note->setAttribs(array(
				'dojoType'=>'dijit.form.TextBox',
				'class'=>'fullside'
		));
		
		$Debit = new Zend_Dojo_Form_Element_TextBox('debit');
		$Debit->setAttribs(array(
				'dojoType'=>'dijit.form.TextBox',
				'class'=>'fullside',
				'readonly'=>'readonly'
		));
		$Debit->setValue(0);
		
		$Credit = new Zend_Dojo_Form_Element_TextBox('credit');
		$Credit->setAttribs(array(
				'dojoType'=>'dijit.form.TextBox',
				'class'=>'fullside',
				'readonly'=>'readonly'
		));
		$Credit->setValue(0);
		
		$this->addElements(array($parent,$Add_Date,$Account_Number,$Note,$Debit,$Credit,$Brance));
		return $this;
		
	}	
}