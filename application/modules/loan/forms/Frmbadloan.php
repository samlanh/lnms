<?php 
Class Loan_Form_Frmbadloan extends Zend_Dojo_Form {
	protected $tr;
	public function init()
	{
		$this->tr = Application_Form_FrmLanguages::getCurrentlanguage();
	}
	public function FrmBadLoan($data=null){
		
		$branch = new Zend_Dojo_Form_Element_FilteringSelect('branch');
		$branch->setAttribs(array(
				'dojoType'=>'dijit.form.FilteringSelect',
				'class'=>'fullside',
				'required'=>true
		));
		$options= array(1=>"សាខា កណ្តាល",2=>"សាខា ទី១");
		$branch->setMultiOptions($options);
		
		$db = new Loan_Model_DbTable_DbBadloan();
		$client_code = new Zend_Dojo_Form_Element_FilteringSelect('client_code');
		$client_code->setAttribs(array(
				'dojoType'=>'dijit.form.FilteringSelect',
				'class'=>'fullside',
				'onchange'=>'getClientInfo();'
		));
// 		$rows = $db->getClientByType();
// 		$options=array(''=>"------Select------",-1=>"Add New");
// 		if(!empty($rows))foreach($rows AS $row) $options[$row['client_id']]=$row['name_en'];
// 		$customer_name->setMultiOptions($options);
		

		$opt= $db->getClientByTypes(1);
		$client_code->setMultiOptions($opt);
		
		$client_name = new Zend_Dojo_Form_Element_FilteringSelect('client_name');
		$client_name->setAttribs(array(
				'dojoType'=>'dijit.form.FilteringSelect',
				'class'=>'fullside',
			    'onchange'=>"getClientInfo(1);"
				));
		$options = $db->getClientByTypes(2);
		$client_name->setMultiOptions($options);
		
		$number_code = new Zend_Dojo_Form_Element_FilteringSelect('number_code');
		$number_code->setAttribs(array(
				'dojoType'=>'dijit.form.FilteringSelect',
				'class'=>'fullside',
				'onchange'=>"getClientInfo(2);"
		));
		
		$options = $db->getClientByTypes(3);
		$number_code->setMultiOptions($options);
		
		$_date= new Zend_Dojo_Form_Element_DateTextBox('Date');
		$_date->setAttribs(array(
				'dojoType'=>'dijit.form.DateTextBox',
				'class'=>'fullside',
		));
		$_date->setValue(date('Y-m-d'));
		
		
		$date_loss= new Zend_Dojo_Form_Element_DateTextBox('date_loss');
		$date_loss->setAttribs(array(
				'dojoType'=>'dijit.form.DateTextBox',
				'class'=>'fullside',
		));
		$date_loss->setValue(date('Y-m-d'));
		
		$db = new Loan_Model_DbTable_DbBadloan();
		$total_amount = new Zend_Dojo_Form_Element_NumberTextBox('Total_amount');
		$total_amount->setAttribs(array(
				'dojoType'=>'dijit.form.NumberTextBox',
				'class'=>'fullside',
				'required'=>true
							
		));
		
		$interest_amount = new Zend_Dojo_Form_Element_NumberTextBox('Interest_amount');
		$interest_amount->setAttribs(array(
				'dojoType'=>'dijit.form.NumberTextBox',
				'class'=>'fullside',
				'required'=>true
				
		));
	
		
		$_term = new Zend_Dojo_Form_Element_FilteringSelect('Term');
		$_term->setAttribs(array(
				'dojoType'=>'dijit.form.FilteringSelect',
				'class'=>'fullside',
		));
		
		$_note = new Zend_Dojo_Form_Element_Textarea('Note');
		$_note ->setAttribs(array(
				'dojoType'=>'dijit.form.SimpleTextarea',
				'class'=>'fullside',
				'style'=>'width:98%'
		));
		
		$cash_type_opt = array(
				1=>$this->tr->translate("15"),
				2=>$this->tr->translate("30"),
				3=>$this->tr->translate("45"));
		 
		$_term->setMultiOptions($cash_type_opt);
		
		
		$cash_type = new Zend_Dojo_Form_Element_FilteringSelect('cash_type');
		$cash_type ->setAttribs(array(
				'dojoType'=>'dijit.form.FilteringSelect',
				'class'=>'fullside',
				'required'=>true
		));
		$cash_type_opt = array(
				1=>$this->tr->translate("DOLLA"),
				2=>$this->tr->translate("RIEAL"),
		        3=>$this->tr->translate("BATH"));
		       
		$cash_type->setMultiOptions($cash_type_opt);
		
		
		$id = new Zend_Form_Element_Hidden("id");
// 		print_r($data);exit();
		if($data!=null){
				
			$branch->setValue($data['branch']);
			$client_code->setValue($data['client_code']);
			$client_name->setValue($data['client_name']);
			$number_code->setValue($data['number_code']);
			$_date->setValue($data['date']);
			$date_loss->setValue($data['loss_date']);
			$total_amount->setValue($data['total_amount']);
			$interest_amount->setValue($data['intrest_amount']);
			$_term->setValue($data['tem']);
			$_note->setValue($data['note']);
			$id->setValue($data['id']);
		}
		
		
		$this->addElements(array($cash_type,$id,$branch,$client_code,$client_name,$number_code,$date_loss,$total_amount,$interest_amount,$_date,$_term,$_note));
		return $this;
		
	}	
}