DROP TABLE ln_account_branch;

CREATE TABLE `ln_account_branch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `balance` float(16,2) DEFAULT NULL,
  `currency_type` tinyint(4) NOT NULL COMMENT '1=kh,2=dollar,3 bath',
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `date` date DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`,`account_id`,`branch_id`,`currency_type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO ln_account_branch VALUES("1","1","1","100366.00","2","1","1","2015-05-03","");
INSERT INTO ln_account_branch VALUES("2","2","1","-99362.34","2","1","1","2015-05-03","");
INSERT INTO ln_account_branch VALUES("3","3","1","1003.66","2","1","1","2015-05-03","");
INSERT INTO ln_account_branch VALUES("7","1","1","2000.00","1","1","1","2015-05-29","");
INSERT INTO ln_account_branch VALUES("8","2","1","-1980.00","1","1","1","2015-05-29","");
INSERT INTO ln_account_branch VALUES("9","3","1","20.00","1","1","1","2015-05-29","");
INSERT INTO ln_account_branch VALUES("10","1","7","1000.00","2","1","1","2015-06-02","");
INSERT INTO ln_account_branch VALUES("11","2","7","-990.00","2","1","1","2015-06-02","");
INSERT INTO ln_account_branch VALUES("12","3","7","10.00","2","1","1","2015-06-02","");



DROP TABLE ln_account_category;

CREATE TABLE `ln_account_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_namekh` varchar(100) DEFAULT NULL,
  `cate_nameen` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `account_type` tinyint(4) DEFAULT NULL,
  `deplay` int(4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO ln_account_category VALUES("1","Dell","Dell","1","2","1","2014-12-17","1","");
INSERT INTO ln_account_category VALUES("2","Apple","Apple","1","3","1","2014-12-10","2","");
INSERT INTO ln_account_category VALUES("3","Acer","Acer","1","2","1","2014-12-02","1","");
INSERT INTO ln_account_category VALUES("4","???","kok","6","1","1","2014-12-25","1","");
INSERT INTO ln_account_category VALUES("12","rrr","rrrr","1","1","2","2015-01-26","1","");



DROP TABLE ln_account_name;

CREATE TABLE `ln_account_name` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_code` varchar(100) DEFAULT NULL,
  `account_name_kh` varchar(100) DEFAULT NULL,
  `account_name_en` varbinary(100) DEFAULT NULL,
  `displayby` tinyint(4) DEFAULT NULL,
  `disc` text,
  `option_acc` tinyint(1) DEFAULT '1' COMMENT '1=operation acc,2=non operation acc',
  `account_type` tinyint(4) DEFAULT NULL COMMENT '1=asset,2=liabilities,3=equities,4=incomes,5=expense,6=cost of goods sold',
  `parent_id` tinyint(11) DEFAULT NULL,
  `category_id` tinyint(11) DEFAULT NULL,
  `balance` float(15,3) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `option_type` tinyint(4) DEFAULT '1' COMMENT '1=acc,2cate,3 parent',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

INSERT INTO ln_account_name VALUES("17","10000008","loan","loan","","","1","1","20","21","0.000","2015-01-21","1","1","1");
INSERT INTO ln_account_name VALUES("18","","","","","","1","","","","","","1","","1");
INSERT INTO ln_account_name VALUES("19","10000007","Petty Cash","Petty Cash","","","2","1","9","2","0.000","2015-01-21","1","","3");
INSERT INTO ln_account_name VALUES("20","11","Current Assets","Current Assets","","","2","1","0","0","0.000","2015-01-21","1","","3");
INSERT INTO ln_account_name VALUES("21","3","Cash/Bank","Cash/Bank","","","2","1","20","0","0.000","2015-01-21","1","","2");
INSERT INTO ln_account_name VALUES("22","9","Petty Cash","Petty Cash","","","1","1","20","21","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("23","8","Cash on Hand","Cash on Hand","","","1","1","20","21","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("28","10000009","Regular Checking Account","Regular Checking Account","","","1","1","20","21","0.000","2015-01-21","1","","0");
INSERT INTO ln_account_name VALUES("29","10000009","Regular Checking Account","Regular Checking Account","","","1","1","20","21","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("30","10000010","Savings Account","Savings Account","","","1","1","20","21","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("31","01","Accounts Receivable","Accounts Receivable","","","2","1","20","0","0.000","2015-01-21","1","","2");
INSERT INTO ln_account_name VALUES("32","10000011","Allowance for Doubtful Account","Allowance for Doubtful Account","","","1","1","20","31","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("33","10000012","Accounts Receivable","Accounts Receivable","","","1","1","20","31","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("34","10000013","Other Receivables","Other Receivables","","","1","1","20","31","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("35","10000034","Pending Account Receivables","Pending Account Receivables","","","1","1","20","31","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("38","02","Inventory","Inventory","","","2","1","20","0","0.000","2015-01-21","1","","2");
INSERT INTO ln_account_name VALUES("39","10000014","Inventory","Inventory","","","1","1","20","38","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("40","10000036","Stock","Stock","","","1","1","20","38","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("41","03","Other Current Assets","Other Current Assets","","","2","1","20","0","0.000","2015-01-21","1","","2");
INSERT INTO ln_account_name VALUES("42","10000015","Prepaid Expenses","Prepaid Expenses","","","1","1","20","41","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("43","10000017","Purchase Tax","Purchase Tax","","","1","1","20","41","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("44","10000018","Employee Advances","Employee Advances","","","1","1","20","41","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("45","10000019","Notes Receivable-Current (Business Advance)","Notes Receivable-Current (Business Advance)","","","1","1","20","41","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("46","10000020","Other Current Assets","Other Current Assets","","","1","1","20","41","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("47","10000033","Supplier Deposit","Supplier Deposit","","","1","1","20","41","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("48","10000035","Inventory Markup","Inventory Markup","","","1","1","20","41","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("49","04","Fixed Assets","Fixed Assets","","","2","1","0","0","0.000","2015-01-21","1","","3");
INSERT INTO ln_account_name VALUES("50","10000021","Equipment","Equipment","","","1","1","49","0","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("51","10000022","Depreciation - Equipment","Depreciation - Equipment","","","1","1","49","0","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("52","10000023","Vehicles","Vehicles","","","1","1","49","0","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("53","10000024","Depreciation - Vehicles","Depreciation - Vehicles","","","1","1","49","0","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("54","10000025","Leasehold Improvements","Leasehold Improvements","","","1","1","49","0","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("55","10000026","Depreciation - Leasehold","Depreciation - Leasehold","","","1","1","49","0","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("56","10000027","Buildings","Buildings","","","1","1","49","0","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("57","10000028","Depreciation - Buildings","Depreciation - Buildings","","","1","1","49","0","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("58","10000029","Land","Land","","","1","1","49","0","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("59","10000030","Depreciation - Land","Depreciation - Land","","","1","1","49","0","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("60","05","Other Assets","Other Assets","","","2","1","0","0","0.000","2015-01-21","1","","3");
INSERT INTO ln_account_name VALUES("61","10000031","Notes Receivable- Noncurrent","Notes Receivable- Noncurrent","","","1","1","60","0","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("62","10000032","Other Noncurrent Assets","Other Noncurrent Assets","","","1","1","60","0","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("63","06","Current Liabilities","Current Liabilities","","","2","2","0","0","0.000","2015-01-21","1","","3");
INSERT INTO ln_account_name VALUES("64","07","Other Current Liabilities","Other Current Liabilities","","","2","2","63","0","0.000","2015-01-21","1","","2");
INSERT INTO ln_account_name VALUES("65","20000006","Accrued Expenses","Accrued Expenses","","","1","2","63","64","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("66","20000007","Sales Tax Payable","Sales Tax Payable","","","1","2","63","64","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("67","20000008","Wages Payable","Wages Payable","","","1","2","63","64","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("68","20000009","Insurance Payable","Insurance Payable","","","1","2","63","64","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("69","20000010","Income Taxes Payable 1%","Income Taxes Payable 1%","","","1","2","63","64","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("70","20000011","Other Taxes Payable","Other Taxes Payable","","","1","2","63","64","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("71","20000012","Current Portion Long-Term Debt","Current Portion Long-Term Debt","","","1","2","63","64","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("72","20000013","Other Current Liabilities","Other Current Liabilities","","","1","2","63","64","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("73","20000014","Suspense - Clearing Account","Suspense - Clearing Account","","","1","2","63","64","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("75","08","Accounts Payable","Accounts Payable","","","2","2","0","0","0.000","2015-01-21","1","","2");
INSERT INTO ln_account_name VALUES("76","20000021","Pending  Purchase Order Receipt","Pending  Purchase Order Receipt","","","1","2","63","75","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("77","20000022","Customer Gift Voucher","Customer Gift Voucher","","","1","2","63","75","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("78","20000020","Pending Sale Commissions","Pending Sale Commissions","","","1","2","63","75","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("79","20000018","Customer Deposit","Customer Deposit","","","1","2","63","75","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("80","20000019","Customer Return","Customer Return","","","1","2","63","75","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("81","20000015","Accounts Payable","Accounts Payable","","","1","2","63","75","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("82","09","Non-Current Liabilities","Non-Current Liabilities","","","2","2","0","0","0.000","2015-01-21","1","","3");
INSERT INTO ln_account_name VALUES("83","010","Long Term Liabilities","Long Term Liabilities","","","2","2","0","0","0.000","2015-01-21","1","","3");
INSERT INTO ln_account_name VALUES("84","20001300","Customer Commission","Customer Commission","","","1","2","83","0","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("85","20000016","Notes Payable-Noncurrent","Notes Payable-Noncurrent","","","1","2","83","0","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("86","20000017","Other Long-Term Liabilities","Other Long-Term Liabilities","","","1","2","83","0","0.000","2015-01-21","1","","1");
INSERT INTO ln_account_name VALUES("88","010","Equity","Equity","","","2","3","0","0","0.000","2015-01-22","1","","3");
INSERT INTO ln_account_name VALUES("89","30000004","Beginning Balance Equity","Beginning Balance Equity","","","1","3","88","0","0.000","2015-01-22","1","","1");
INSERT INTO ln_account_name VALUES("90","30000005","Common Stock","Common Stock","","","1","3","88","0","0.000","2015-01-22","1","","1");
INSERT INTO ln_account_name VALUES("91","30000006","Paid-in Capital","Paid-in Capital","","","1","3","88","0","0.000","2015-01-22","1","","1");
INSERT INTO ln_account_name VALUES("92","011","Equity-Retained Earnings","Equity-Retained Earnings","","","2","3","0","0","0.000","2015-01-22","1","","3");
INSERT INTO ln_account_name VALUES("93","30000007","Retained Earnings","Retained Earnings","","","1","3","92","0","0.000","2015-01-22","1","","1");
INSERT INTO ln_account_name VALUES("95","013","Equity-gets closed","Equity-gets closed","","","2","3","0","0","0.000","2015-01-22","1","","3");
INSERT INTO ln_account_name VALUES("96","30000008","Dividends Paid","Dividends Paid","","","1","3","95","0","0.000","2015-01-22","1","","1");
INSERT INTO ln_account_name VALUES("97","014","Income","Income","","","2","4","0","0","0.000","2015-01-22","1","","3");
INSERT INTO ln_account_name VALUES("98","40000003","Other Income","Other Income","","","2","5","0","0","0.000","2015-01-22","1","","3");
INSERT INTO ln_account_name VALUES("99","40000013","Freight Income","Freight Income","","","2","4","0","0","0.000","2015-01-22","1","","3");
INSERT INTO ln_account_name VALUES("100","40000015","Income Summary","Income Summary","","","2","4","0","0","0.000","2015-01-22","1","","3");
INSERT INTO ln_account_name VALUES("101","40000016","Service Charge","Service Charge","","","2","4","0","0","0.000","2015-01-22","1","","3");
INSERT INTO ln_account_name VALUES("102","014","Expenses","Expenses","","","2","5","0","0","0.000","2015-01-22","1","","3");
INSERT INTO ln_account_name VALUES("103","015","Administrtive Expesne","Administrtive Expesne","","","2","5","0","0","0.000","2015-01-22","1","","3");
INSERT INTO ln_account_name VALUES("104","60000004","Sale Incentive","Sale Incentive","","","2","5","0","0","0.000","2015-01-22","1","","2");
INSERT INTO ln_account_name VALUES("106","60000011","Penalties and Fines Exp","Penalties and Fines Exp","","","2","5","103","0","0.000","2015-01-22","1","","2");
INSERT INTO ln_account_name VALUES("107","60000011","Penalties and Fines Exp","Penalties and Fines Exp","","","2","5","103","0","0.000","2015-01-22","1","","2");
INSERT INTO ln_account_name VALUES("108","60000010","Maintenance Expense","Maintenance Expense","","","2","5","103","0","0.000","2015-01-22","1","","2");
INSERT INTO ln_account_name VALUES("109","016","Operation Expense","Operation Expense","","","2","5","0","0","0.000","2015-01-22","1","","3");
INSERT INTO ln_account_name VALUES("110","60000019","Commissions and Fees Exp","Commissions and Fees Exp","","","2","5","0","0","0.000","2015-01-22","1","","2");
INSERT INTO ln_account_name VALUES("112","60000021","Dues and Subscriptions Exp","Dues and Subscriptions Exp","","","2","5","109","0","0.000","2015-01-22","1","","2");
INSERT INTO ln_account_name VALUES("113","60000036","Utilities Expense","Utilities Expense","","","2","5","109","0","0.000","2015-01-22","1","","2");
INSERT INTO ln_account_name VALUES("114","60000034","Supplies Expense","Supplies Expense","","","2","5","109","0","0.000","2015-01-22","1","","2");
INSERT INTO ln_account_name VALUES("115","016","Payroll Expense","Payroll Expense","","","2","5","0","0","0.000","2015-01-22","1","","3");
INSERT INTO ln_account_name VALUES("116","60000043","Over Time Expense","Over Time Expense","","","2","5","115","0","0.000","2015-01-22","1","","2");
INSERT INTO ln_account_name VALUES("117","60000044","Bonus Expense","Bonus Expense","","","2","5","115","0","0.000","2015-01-22","1","","2");



DROP TABLE ln_backupschedule;

CREATE TABLE `ln_backupschedule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `note` text,
  `file_name` varchar(40) DEFAULT NULL,
  `action_type` tinyint(4) DEFAULT NULL COMMENT '1=backup,2restore',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE ln_badloan;

CREATE TABLE `ln_badloan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch` varchar(100) DEFAULT NULL,
  `client_code` varchar(100) DEFAULT NULL,
  `client_name` varchar(100) DEFAULT NULL,
  `loan_number` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `loss_date` date DEFAULT NULL,
  `cash_type` int(10) DEFAULT NULL,
  `total_amount` varchar(100) DEFAULT NULL,
  `intrest_amount` varchar(100) DEFAULT NULL,
  `tem` varchar(100) DEFAULT NULL COMMENT '1= writeoff',
  `note` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `is_writoff` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO ln_badloan VALUES("1","1","28","28","","2015-07-03","2015-05-15","2","3600","84","30","PPL000021","1","1","0");



DROP TABLE ln_branch;

CREATE TABLE `ln_branch` (
  `br_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_namekh` varchar(200) DEFAULT NULL,
  `branch_nameen` varbinary(100) DEFAULT NULL,
  `br_address` varchar(100) DEFAULT NULL,
  `branch_code` varchar(100) DEFAULT NULL,
  `branch_tel` varchar(100) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `other` varchar(100) DEFAULT NULL,
  `prefix` varchar(10) DEFAULT NULL COMMENT '??????????? ??????????????',
  `status` tinyint(4) DEFAULT '1',
  `displayby` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`br_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO ln_branch VALUES("1","???????","Phnom Penh","Phnom Penh","C-001","","","","PP","1","2");
INSERT INTO ln_branch VALUES("2","???? ????????","Battambang","Battambang","C-001","","","","BB","1","2");
INSERT INTO ln_branch VALUES("3","","","","","","","","","1","0");
INSERT INTO ln_branch VALUES("4","??????","Takmao","Takmao , Kandal","124566","023 23 23 10","","","TK","1","1");
INSERT INTO ln_branch VALUES("5","?????","Chom Choa","#201, St Rusia ,Kakab, Dongkor  Phnom Penh","C-005","070 41 80022","Info@sokha.com","","CC","1","2");
INSERT INTO ln_branch VALUES("6","Kandal","Kandal","","C-006","","","","KD","1","1");
INSERT INTO ln_branch VALUES("7","??????","Kandal","","C-007","","","","KD","1","1");
INSERT INTO ln_branch VALUES("8","??????????","Purchintong","","C-008","","","","PT","1","1");



DROP TABLE ln_branch_capital;

CREATE TABLE `ln_branch_capital` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `amount_dollar` float(18,3) DEFAULT NULL,
  `amount_riel` float(18,3) DEFAULT NULL,
  `amount_bath` float(18,3) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE ln_callecteral_type;

CREATE TABLE `ln_callecteral_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(50) DEFAULT NULL,
  `title_kh` varbinary(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `displayby` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO ln_callecteral_type VALUES("1","Real Estate Certification Mark","វិញ្ញាបនប័ត្រសម្គាល់អចលនវត្ថុ","2015-04-09","1","1");
INSERT INTO ln_callecteral_type VALUES("2","Land Ownership Certificate","លិខិតផ្ទេរកម្មសិទ្ធិដីធ្លី","2015-04-09","1","1");
INSERT INTO ln_callecteral_type VALUES("3","National Identity Card","អត្តសញ្ញាណប័ណ្ណសញ្ជាតិខ្មែរ","2015-04-09","1","1");
INSERT INTO ln_callecteral_type VALUES("4","Family Book","សៀវភៅគ្រួសារ","2015-04-09","1","1");
INSERT INTO ln_callecteral_type VALUES("5","Resident Letter","លិខិតស្នាក់នៅ","2015-04-09","1","1");
INSERT INTO ln_callecteral_type VALUES("6","Civil Status","សំបុត្របញ្ជាក់កំណើត","2015-04-09","1","1");
INSERT INTO ln_callecteral_type VALUES("7","Driver\'s License","ប័ណ្ណបើកបរ","2015-04-09","1","1");
INSERT INTO ln_callecteral_type VALUES("8","Vehicle Credentials","ប័ណ្ណសំគាល់យានយន្ត(កាតគ្រី)","2015-04-09","1","1");
INSERT INTO ln_callecteral_type VALUES("9","test","teqw","2015-02-17","1","1");



DROP TABLE ln_callecteralllist;

CREATE TABLE `ln_callecteralllist` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `branch` int(12) DEFAULT NULL,
  `receipt` varchar(30) DEFAULT NULL,
  `code_call` varchar(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `type_call` tinyint(4) DEFAULT NULL,
  `owner_call` varchar(50) DEFAULT NULL,
  `callnumber` varchar(20) DEFAULT NULL COMMENT 'numnote??????????',
  `create_date` date DEFAULT NULL,
  `date_debt` date DEFAULT NULL,
  `term` tinyint(4) DEFAULT NULL,
  `amount_term` int(11) DEFAULT NULL,
  `date_line` date DEFAULT NULL,
  `curr_type` tinyint(3) DEFAULT NULL,
  `amount_debt` double(18,2) DEFAULT NULL,
  `note` varchar(43) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `is_verify` tinyint(4) DEFAULT '0',
  `verify_by` int(11) DEFAULT NULL,
  `is_fund` tinyint(4) DEFAULT '0',
  `term_fun` tinyint(4) DEFAULT NULL,
  `charge_term` int(11) DEFAULT NULL,
  `amount_money` float(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE ln_changecollteral;

CREATE TABLE `ln_changecollteral` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `note` text,
  `status` tinyint(2) DEFAULT NULL COMMENT '1=??????????',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO ln_changecollteral VALUES("1","1","1","","2015-09-03","","1","1");
INSERT INTO ln_changecollteral VALUES("2","1","3","","2015-09-25","","1","1");



DROP TABLE ln_changecollteral_detail;

CREATE TABLE `ln_changecollteral_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `change_id` int(11) DEFAULT NULL,
  `client_coll_id` int(11) DEFAULT NULL COMMENT 'id from collateral detail',
  `from_id` int(11) DEFAULT NULL,
  `from_collateral_type` int(11) DEFAULT NULL,
  `from_owner_id` tinyint(4) DEFAULT NULL,
  `from_owner_name` varchar(60) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `from_number_collateral` varchar(60) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `from_note` text COLLATE utf8_hungarian_ci,
  `to_id` int(11) DEFAULT NULL,
  `collateral_type` int(11) DEFAULT NULL,
  `owner_id` tinyint(4) DEFAULT NULL,
  `toowner_name` varchar(60) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `number_collateral` varchar(60) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `note` text COLLATE utf8_hungarian_ci,
  `status` tinyint(4) DEFAULT '1',
  `is_changed` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

INSERT INTO ln_changecollteral_detail VALUES("1","1","19","","1","1","mok channy-???? ?????","100","","","1","1","mok channy-???? ?????","44444","2015-09-22","444444444","1","");
INSERT INTO ln_changecollteral_detail VALUES("2","2","24","","7","1","sok virak-??? ????","333","","","5","1","sok virak-??? ????","111","2015-09-10","note","1","");



DROP TABLE ln_client;

CREATE TABLE `ln_client` (
  `client_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agreement_id` int(11) DEFAULT NULL,
  `is_group` tinyint(4) DEFAULT NULL,
  `group_code` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT 'group id',
  `client_number` varchar(50) DEFAULT NULL COMMENT 'client_code ,first lenght for branch',
  `name_kh` varchar(150) DEFAULT NULL,
  `name_en` varchar(150) DEFAULT NULL,
  `join_with` varchar(150) DEFAULT NULL,
  `join_nation_id` varchar(30) DEFAULT NULL,
  `relate_with` varchar(50) DEFAULT NULL COMMENT 'join acc ?????????????? ???????',
  `join_tel` varchar(50) DEFAULT NULL,
  `guarantor_with` varchar(50) DEFAULT NULL COMMENT '??????????????????????? Client',
  `guarantor_tel` varchar(50) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `position_id` int(1) DEFAULT NULL,
  `sit_status` int(11) DEFAULT NULL,
  `pro_id` int(11) DEFAULT NULL,
  `dis_id` int(11) DEFAULT NULL,
  `com_id` int(11) DEFAULT NULL,
  `village_id` int(11) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `house` varchar(50) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `id_number` varchar(50) DEFAULT NULL,
  `acc_number` varchar(20) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `job` varchar(40) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `pob` varchar(100) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `spouse_name` varchar(50) DEFAULT NULL COMMENT '????????',
  `spouse_nationid` varchar(30) DEFAULT NULL COMMENT '??????????????? ????????',
  `remark` text,
  `create_date` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT '1',
  `photo_name` varchar(50) DEFAULT NULL,
  `reference` int(11) DEFAULT NULL,
  `displayby` tinyint(4) DEFAULT '1',
  `status_process` tinyint(4) DEFAULT '1' COMMENT '1 padding,2=closed',
  `type` tinyint(4) DEFAULT '1' COMMENT '1 loan, 2=callecterall',
  `is_blacklist` int(11) DEFAULT '0' COMMENT 'is bad client',
  `job_name` varchar(10) DEFAULT NULL,
  `nation_id` varchar(20) DEFAULT NULL,
  `is_verify` tinyint(4) DEFAULT NULL,
  `verify_by` int(11) DEFAULT NULL,
  `reasonblack_list` text,
  `date_blacklist` date DEFAULT NULL,
  `status_blacklist` tinyint(4) DEFAULT NULL,
  `guarantor_address` varchar(100) DEFAULT NULL,
  `guarantor_d_type` tinyint(4) DEFAULT NULL COMMENT 'guarantor document type',
  `join_d_type` tinyint(4) DEFAULT NULL COMMENT 'joint document type',
  `client_d_type` tinyint(4) DEFAULT NULL COMMENT 'client document type',
  `dob_guarantor` varchar(30) DEFAULT NULL,
  `dob_join_acc` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO ln_client VALUES("1","","0","PP000001","0","PP000001","???? ?????","mok channy","sok lin","1234","family","","famil1","","1","","1","1","1","0","0","","","","","","070 41 8002","","1990-03-30","","","","sok leang","12345","","2015-08-28","1","1","1","","","1","1","1","0","","123","","","","","","","4","3","2","","");
INSERT INTO ln_client VALUES("2","","1","GPP001","0","PP000002","????","Dara","","","","","","","1","","1","1","2","17","0","12","233","","","","","teacher","2015-09-09","","","","","","","2015-09-01","1","1","1","","","1","1","1","0","","2333","","","","","","","0","0","2","","");
INSERT INTO ln_client VALUES("3","","0","","2","PP000003","??? ????","sok virak","","","","","","","1","","1","5","0","0","0","","","","","","3030202002","222","2015-09-16","","","","","","","2015-09-01","1","1","1","","","1","1","1","0","","343","","","","","","","0","0","6","","");
INSERT INTO ln_client VALUES("4","","0","","0","PP000004","?? ??????","Lum Chenda","","","","","","","1","","2","1","5","0","-1","","","","","","010201021","teacher","0000-00-00","","","","","","","2015-09-28","1","1","1","","","1","1","1","0","","2122","","","","","","","0","0","1","","");



DROP TABLE ln_client_blacklist;

CREATE TABLE `ln_client_blacklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL COMMENT 'reason black list',
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE ln_client_callecteral;

CREATE TABLE `ln_client_callecteral` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `join_with` varchar(50) DEFAULT NULL,
  `relative` varchar(50) DEFAULT NULL COMMENT '?????????????????????????????????????',
  `guarantor` varchar(50) DEFAULT NULL,
  `guarantor_relative` varchar(50) DEFAULT NULL COMMENT '?????????????????????????????',
  `collecteral_code` varchar(50) DEFAULT NULL COMMENT '????????? ????????????????',
  `co_id` int(11) DEFAULT NULL,
  `note` varchar(60) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(3) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `is_return` int(11) DEFAULT '0' COMMENT 'if return all ready',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO ln_client_callecteral VALUES("1","1","4","","","","","CL000001","5","","2015-09-28","1","","0");



DROP TABLE ln_client_callecteral_detail;

CREATE TABLE `ln_client_callecteral_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_coll_id` int(11) DEFAULT NULL COMMENT 'from client collecteral',
  `collecteral_code` varchar(30) DEFAULT NULL,
  `collecteral_type` int(11) DEFAULT NULL,
  `owner_type` tinyint(4) DEFAULT NULL COMMENT '???????????????',
  `owner_name` varchar(150) DEFAULT NULL,
  `number_collecteral` varchar(50) DEFAULT NULL COMMENT '???????????????????',
  `issue_date` varchar(30) DEFAULT NULL,
  `note` text,
  `status` tinyint(4) DEFAULT '1',
  `is_changed` tinyint(4) DEFAULT '0',
  `changecollteral_id` int(11) DEFAULT '0' COMMENT 'id from change collecteral detail  id',
  `is_return` tinyint(4) DEFAULT '0' COMMENT '?????????????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO ln_client_callecteral_detail VALUES("3","1","CL000001","4","1","Lum Chenda-?? ??????","22","1970-01-01","","1","0","0","0");
INSERT INTO ln_client_callecteral_detail VALUES("4","1","CL000002","8","1","Lum Chenda-?? ??????","33","1970-01-01","","1","0","0","0");
INSERT INTO ln_client_callecteral_detail VALUES("5","1","CL000003","5","1","Lum Chenda-?? ??????","44","","22","1","0","0","0");



DROP TABLE ln_client_receipt_money;

CREATE TABLE `ln_client_receipt_money` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `co_id` int(10) unsigned DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL COMMENT 'client id or group id',
  `receiver_id` int(10) unsigned DEFAULT NULL,
  `receipt_no` varchar(50) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `loan_number` varchar(50) DEFAULT NULL,
  `date_pay` date DEFAULT NULL,
  `date_input` date DEFAULT NULL,
  `principal_amount` float(18,3) DEFAULT NULL,
  `total_principal_permonth` float(18,3) DEFAULT NULL,
  `total_payment` float(18,3) DEFAULT NULL COMMENT '????????',
  `amount_payment` float(18,3) DEFAULT NULL COMMENT '????????????????',
  `total_interest` float(18,3) DEFAULT NULL,
  `recieve_amount` float(18,3) DEFAULT NULL COMMENT '?????????????????',
  `penalize_amount` float(18,3) DEFAULT NULL,
  `return_amount` float(18,3) DEFAULT NULL,
  `service_charge` float(18,3) DEFAULT NULL,
  `total_discount` float(18,3) DEFAULT NULL,
  `note` text,
  `user_id` int(11) DEFAULT NULL,
  `is_group` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `payment_option` int(11) DEFAULT NULL,
  `currency_type` int(11) DEFAULT NULL,
  `is_payoff` tinyint(4) DEFAULT '0' COMMENT '1 if loan pay of',
  `is_completed` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO ln_client_receipt_money VALUES("1","1","1","1","PM-00001","1","","2015-09-08","2015-09-08","916.670","83.330","108.330","108.330","25.000","108.330","0.000","0.000","0.000","","","1","0","1","1","2","0","1");



DROP TABLE ln_client_receipt_money_detail;

CREATE TABLE `ln_client_receipt_money_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crm_id` int(11) DEFAULT NULL COMMENT 'id of client reciept money',
  `lfd_id` int(11) DEFAULT NULL COMMENT 'loan fund detail',
  `loan_number` varchar(50) DEFAULT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `date_payment` date DEFAULT NULL,
  `capital` float(15,2) DEFAULT NULL COMMENT 'capital before fund',
  `remain_capital` float(15,2) DEFAULT NULL,
  `principal_permonth` float(15,2) DEFAULT NULL COMMENT 'principal pay for month',
  `total_interest` float(15,2) DEFAULT NULL,
  `total_payment` float(15,2) DEFAULT NULL COMMENT '????????????????',
  `pay_after` varchar(50) DEFAULT NULL,
  `pay_before` varchar(50) DEFAULT NULL,
  `is_completed` tinyint(4) DEFAULT '0' COMMENT '0=not paid complet ,1=complete,2=over paid',
  `is_verify` tinyint(4) DEFAULT '0',
  `verify_by` tinyint(4) DEFAULT '0',
  `is_closingentry` tinyint(4) DEFAULT '0',
  `currency_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1=normal,2=pay before,3=??????????????,4=payof',
  `total_recieve` float(15,2) DEFAULT NULL,
  `service_charge` float(15,2) DEFAULT NULL,
  `penelize_amount` float(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='??????????????????????????????????';

INSERT INTO ln_client_receipt_money_detail VALUES("1","1","1","PPL00001","1","2015-10-07","1000.00","916.67","83.33","25.00","108.33","2","","1","0","0","0","2","1","108.33","0.00","0.00");



DROP TABLE ln_client_reciept;

CREATE TABLE `ln_client_reciept` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `co_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `date_pay` date DEFAULT NULL COMMENT 'date client must pay',
  `date` date DEFAULT NULL COMMENT 'date input to system',
  `remain_principal` int(11) DEFAULT NULL COMMENT 'remain before fund',
  `principal_permonth` float(12,2) DEFAULT NULL,
  `interest_rate` float(12,2) DEFAULT NULL,
  `total_payment` float(12,2) DEFAULT NULL COMMENT '????????? ????????',
  `punish_fee` float(12,2) DEFAULT NULL,
  `total_fund` float(12,2) DEFAULT NULL COMMENT '????????? ??????',
  `loan_fundid` int(11) DEFAULT NULL COMMENT '????id ???????????',
  `note` text,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1=active,0delete',
  `is_complete` tinyint(4) DEFAULT '1' COMMENT '1=paid,2 not complete',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE ln_co;

CREATE TABLE `ln_co` (
  `co_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT '1',
  `position_id` int(11) DEFAULT NULL,
  `co_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `co_khname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `co_firstname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `co_lastname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL COMMENT '1=m,2=f',
  `national_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pob` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'date of birth',
  `address` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'current addresss',
  `degree` tinyint(4) DEFAULT NULL COMMENT '1=ba,2=phd',
  `tel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `create_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `displayby` tinyint(4) DEFAULT '1' COMMENT '1=kh,2=eng',
  `basic_salary` float(12,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `postion_id` int(11) DEFAULT NULL,
  `contract_no` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shift` tinyint(4) DEFAULT '1' COMMENT '1=???????,2=????????',
  `workingtime` tinyint(4) DEFAULT '1' COMMENT '1=????????,2=????????,3=???????? ??? ?????????',
  `photo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `figer_print_id` varbinary(30) DEFAULT NULL,
  `annual_lives` int(11) DEFAULT NULL,
  PRIMARY KEY (`co_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO ln_co VALUES("1","1","1","C001","??? ?????","sarons","","1","33333","phnom penhs","Phnom Penhs","2","0121010101s","mok_channy@yahoo.com","1","0000-00-00","1","1","100.00","2015-01-01","2015-06-17","","44","","1","1","","","","");
INSERT INTO ln_co VALUES("2","1","1","C002","?? ????","dara","chea","2","3444","","Phnom Penh","1","0191919919","darachea@gmail.com","1","0000-00-00","1","1","","","","","","","1","1","","","","");
INSERT INTO ln_co VALUES("5","1","1","C003","SSSS","dd","","1","22222","","","2","","","1","0000-00-00","1","1","","","","","","","1","1","","","","");
INSERT INTO ln_co VALUES("6","1","1","C004","?????","Narith","","1","12345","12345dd","wq2qww","2","0102200202","abc@gmail.com","1","0000-00-00","1","2","","","","","","","1","1","","","","");
INSERT INTO ln_co VALUES("7","1","1","C005","?????","Chear sok","","1","12345","ph,234","phnom penh","2","02020200202","abc@gmail.com","1","0000-00-00","1","2","","","","","","","1","1","","","","");
INSERT INTO ln_co VALUES("8","1","1","C006","??????","abc","","1","555555","PP","PP","2","998552","kh@yahoo.com","1","0000-00-00","1","1","100.00","2014-12-26","2014-12-17","","144","Repay","2","2","","","","");
INSERT INTO ln_co VALUES("9","1","1","C007","?? ????SS","sok chitra","meas","2","22322","","PP","2","0020200202","narith@gmail.com","1","0000-00-00","1","1","","","","","","","1","1","","","","");
INSERT INTO ln_co VALUES("10","1","2","","","dara","","1","","","pp","","020202002","abc@adfas","1","0000-00-00","1","","","","","","","","","","","","","");
INSERT INTO ln_co VALUES("11","1","2","","dokv","sok","dokv","1","","","","","pp","","1","0000-00-00","1","1","0.00","","","","","","1","1","","","","");
INSERT INTO ln_co VALUES("12","1","2","","asdfsa","asdf","asdfsa","1","","","","","","","1","0000-00-00","1","1","0.00","","","","","","1","1","","","","");
INSERT INTO ln_co VALUES("13","1","2","","vikt","sok","vikt","1","","","","","","","1","0000-00-00","1","1","0.00","","","","","","1","1","","","","");
INSERT INTO ln_co VALUES("14","1","2","","chea","sok chandara","chea","1","","","","","","","1","0000-00-00","1","1","0.00","","","","","","1","1","","","","");
INSERT INTO ln_co VALUES("15","1","1","","Long Dara","?? ?????","Long Dara","1","","","","","03939393","","1","0000-00-00","1","1","0.00","","","","","","1","1","","","","");
INSERT INTO ln_co VALUES("16","1","1","","ssssssssssssssss","sssssssssssss","ssssssssssssssss","1","","","","","","","1","0000-00-00","1","1","0.00","","","","","","1","1","","","","");



DROP TABLE ln_commune;

CREATE TABLE `ln_commune` (
  `com_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `district_id` tinyint(10) NOT NULL,
  `commune_name` varchar(60) NOT NULL,
  `commune_namekh` varchar(60) DEFAULT NULL,
  `modify_date` varchar(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `displayby` tinyint(4) DEFAULT NULL COMMENT '1=kh,2=eng',
  `branch_id` int(11) DEFAULT '1',
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

INSERT INTO ln_commune VALUES("1","1","Tonle Bassak","???????????","Apr 7, 2015 3:33:31 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("2","1","Boeng Keng Kang I","???????? I","Apr 7, 2015 3:33:46 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("3","1","Boeng Keng Kang II","???????? II","Apr 7, 2015 3:34:26 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("4","1","Boeng Keng Kang III","???????? III","Apr 7, 2015 3:39:14 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("5","1","Boeng Trabek","?????????","Apr 7, 2015 3:38:57 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("6","1","Tumnup Tuk","????????","Apr 7, 2015 3:39:40 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("7","1","Phsa Doeum Thkow","????????????","Apr 7, 2015 3:39:56 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("8","1","Toul Svay Prey I","???????????? I","Apr 7, 2015 3:40:08 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("9","1","Toul Svay Prey II","???????????? II","Apr 7, 2015 3:40:24 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("10","1","Toul Tum Poung I","???????? I","Apr 7, 2015 3:40:38 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("11","1","Toul Tum Poung II","???????? II","Apr 7, 2015 3:40:51 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("12","1","Olympik","????????","Apr 7, 2015 3:41:03 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("13","2","Srah Chak","??????","Apr 7, 2015 3:41:46 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("14","2","Wat Phnom","????????","Apr 7, 2015 3:42:01 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("15","2","Phsah Chas","?????????","Apr 7, 2015 3:42:17 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("16","2","Phsah Kandal I","??????????? I","Apr 7, 2015 3:42:30 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("17","2","Phsah Kandal II","??????????? II","Apr 7, 2015 3:42:45 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("18","2","Chey Chomneas","???????","Apr 7, 2015 3:43:18 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("19","2","Chaktomuk","??????","Apr 7, 2015 3:43:30 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("20","2","Phsah Thmey I","????????? I","Apr 7, 2015 3:43:44 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("21","2","Phsah Thmey II","???????? II","Apr 7, 2015 3:43:56 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("22","2","Phsah Thmey III","???????? III","Apr 7, 2015 3:44:16 PM","1","1","1","1");
INSERT INTO ln_commune VALUES("23","2","Boeng Raing","???????","Apr 7, 2015 3:44:34 PM","1","1","1","1");



DROP TABLE ln_currency;

CREATE TABLE `ln_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curr_namekh` varchar(255) DEFAULT NULL,
  `curr_nameen` varchar(120) DEFAULT NULL,
  `symbol` varchar(5) DEFAULT NULL,
  `displayby` tinyint(4) DEFAULT NULL COMMENT '1kh,2=en',
  `country_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '1=active,0deactive',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO ln_currency VALUES("2","??????","Dollar","$","","1","1");
INSERT INTO ln_currency VALUES("1","???","Riel","R","","2","1");
INSERT INTO ln_currency VALUES("3","???","Bath","B","","3","1");



DROP TABLE ln_current_capital;

CREATE TABLE `ln_current_capital` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `currency_type` tinyint(4) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE ln_department;

CREATE TABLE `ln_department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_kh` varchar(100) DEFAULT NULL,
  `department_en` varchar(100) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `displayby` tinyint(15) DEFAULT '1' COMMENT '1 khmer ,2 english',
  `status` tinyint(4) DEFAULT '1' COMMENT '1=??????????, 0=?????????????',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO ln_department VALUES("1","???????","Accountant","2015-02-06","1","0","1");
INSERT INTO ln_department VALUES("2","?????????????","IT","2015-02-06","1","1","1");



DROP TABLE ln_displayby;

CREATE TABLE `ln_displayby` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `displayby_en` varchar(40) DEFAULT NULL,
  `displayby_kh` varchar(40) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `displayby` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO ln_displayby VALUES("1","Khmer Title","","1","1");
INSERT INTO ln_displayby VALUES("2","English Title","","1","1");



DROP TABLE ln_district;

CREATE TABLE `ln_district` (
  `dis_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` tinyint(10) DEFAULT NULL,
  `district_name` varchar(60) DEFAULT NULL,
  `district_namekh` varchar(60) DEFAULT NULL,
  `modify_date` varchar(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `displayby` tinyint(4) DEFAULT NULL COMMENT '1=kh,2=en',
  `branch_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`dis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO ln_district VALUES("1","1","Chamkarmon","???????","Apr 7, 2015 3:30:10 PM","1","1","1","");
INSERT INTO ln_district VALUES("2","1","Daun Penh","??????","Apr 7, 2015 3:30:34 PM","1","1","1","");
INSERT INTO ln_district VALUES("3","1","7 Makara","7 ????","Apr 7, 2015 3:30:51 PM","1","1","1","");
INSERT INTO ln_district VALUES("4","1","Toul Kork","??????","Apr 7, 2015 3:31:05 PM","1","1","1","");
INSERT INTO ln_district VALUES("5","1","Dangkor","?????","Apr 7, 2015 3:31:15 PM","1","1","1","");
INSERT INTO ln_district VALUES("6","1","Meanchey","??????","Apr 7, 2015 3:31:26 PM","1","1","1","");
INSERT INTO ln_district VALUES("7","1","Russey Keo","????????","Apr 7, 2015 3:31:35 PM","1","1","1","");
INSERT INTO ln_district VALUES("8","1","Sen Sok","??????","Apr 7, 2015 3:31:46 PM","1","1","1","");
INSERT INTO ln_district VALUES("9","1","Por Sen Chey","???????????","Apr 7, 2015 3:31:54 PM","1","1","1","");
INSERT INTO ln_district VALUES("10","1","Chbar Ampov","?????????","Apr 7, 2015 3:32:04 PM","1","1","1","");
INSERT INTO ln_district VALUES("11","1","Chroy Changvar","??????????","Apr 7, 2015 3:32:14 PM","1","1","1","");
INSERT INTO ln_district VALUES("12","1","Praek Phnov","?????????","Apr 7, 2015 3:32:24 PM","1","1","1","");



DROP TABLE ln_exchange;

CREATE TABLE `ln_exchange` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` tinyint(4) DEFAULT NULL,
  `exchange_type` tinyint(4) DEFAULT NULL,
  `is_single` tinyint(4) DEFAULT '1' COMMENT '1 = single,0 multi exchange',
  `receive_dollar` float(15,2) DEFAULT NULL,
  `receive_riel` float(15,2) DEFAULT NULL,
  `receive_bath` float(15,2) DEFAULT NULL,
  `return_dollar` float(10,2) DEFAULT NULL,
  `return_riel` float(10,2) DEFAULT NULL,
  `return_bath` float(10,2) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `invoice_code` varchar(30) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `date` date DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL,
  `sign` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE ln_exchange_detail;

CREATE TABLE `ln_exchange_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `exchange_id` int(11) DEFAULT NULL,
  `from_currency_type` varchar(1) DEFAULT NULL,
  `to_currency_type` varchar(1) DEFAULT NULL,
  `from_amount` double DEFAULT NULL,
  `to_amount` double DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `from_to` varchar(20) DEFAULT NULL COMMENT 'simbal only',
  `specail_customer` tinyint(1) DEFAULT '0' COMMENT '0: normal, 1 : specail customer set new rate',
  `status` tinyint(5) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE ln_exchangerate;

CREATE TABLE `ln_exchangerate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `in_cur_id` int(11) DEFAULT NULL COMMENT 'The Currency that we take from customer',
  `out_cur_id` int(11) DEFAULT NULL COMMENT 'The Currency that we give to customer',
  `rate_in` double DEFAULT NULL,
  `spread` double DEFAULT NULL,
  `rate_out` double DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1' COMMENT '1:active; 0:Disactive',
  `is_using` tinyint(4) DEFAULT '1',
  `user_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO ln_exchangerate VALUES("1","2","3","32.9","32.95","33","2015-06-23 18:26:34","1","","");
INSERT INTO ln_exchangerate VALUES("2","1","2","3990","4000","4100","2014-02-03 12:07:58","1","","");
INSERT INTO ln_exchangerate VALUES("3","3","1","120.6","120.05","121","2015-06-23 18:26:34","1","","");



DROP TABLE ln_fixed_asset;

CREATE TABLE `ln_fixed_asset` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `depre_code` varchar(30) DEFAULT NULL,
  `fixed_assetname` varchar(120) DEFAULT NULL,
  `fixed_asset_type` tinyint(4) DEFAULT NULL COMMENT '1=shortterm,2=longterm',
  `asset_code` varchar(30) DEFAULT NULL,
  `asset_cost` float(15,2) DEFAULT NULL,
  `term_type` tinyint(4) DEFAULT NULL COMMENT 'month or year',
  `usefull_life` float(10,1) DEFAULT NULL,
  `currency_type` tinyint(4) DEFAULT NULL,
  `salvagevalue` float(10,2) DEFAULT NULL,
  `payment_method` float DEFAULT NULL COMMENT '1 Straight line,2 Double-declining banlance,3 Sum of the year',
  `depreciation_start` float DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL COMMENT 'create date',
  `user_id` int(11) DEFAULT NULL COMMENT 'create by',
  `total_amount` float(15,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1=use,0unuse',
  `pay_type` tinyint(4) DEFAULT NULL COMMENT '1=cash,2=credit,3=other',
  `some_payamount` float(13,3) DEFAULT NULL COMMENT 'input if choose pay_type = 3',
  `note` varchar(100) DEFAULT NULL,
  `is_sold` tinyint(4) DEFAULT '0' COMMENT '1=has sold',
  `is_depreciate` tinyint(4) DEFAULT '0' COMMENT '??????????',
  `auto_post` tinyint(4) DEFAULT '0' COMMENT '1 = auto post every month',
  `is_verify` tinyint(4) DEFAULT NULL,
  `verify_by` int(11) DEFAULT NULL COMMENT 'by user id ?',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

INSERT INTO ln_fixed_asset VALUES("1","1","","car","2","1","22.00","","23.0","","24.00","3","2014","0","2014-01-01","","","1","2","34.000","neymar","0","0","0","","");
INSERT INTO ln_fixed_asset VALUES("21","1","","land","1","2","56.00","","67.0","","68.00","1","2014","0","2014-01-01","","","1","2","0.000","scra","0","0","0","","");
INSERT INTO ln_fixed_asset VALUES("22","1","","moto","2","8","78.00","","98.0","","67.00","2","2014","0","2014-01-01","","","1","2","0.000","dara","0","0","0","","");
INSERT INTO ln_fixed_asset VALUES("23","2","","toyota","1","78","34.00","","23.0","","12.00","1","2014","0","2014-01-01","","","1","1","0.000","serymon","0","0","0","","");
INSERT INTO ln_fixed_asset VALUES("24","1","","bratho","1","12","34.00","","55.0","","56.00","1","2014","0","2014-01-01","","","1","1","0.000","ronadol","0","0","0","","");
INSERT INTO ln_fixed_asset VALUES("25","1","","money","1","12","455.00","","566.0","","123.00","1","2014","0","2014-01-01","","","1","1","0.000","ravy","0","0","0","","");
INSERT INTO ln_fixed_asset VALUES("26","1","","dojo","2","666","2344.00","","1234545.0","","345656.00","2","2014","0","2014-01-01","","","1","2","222.000","bale","0","0","0","","");
INSERT INTO ln_fixed_asset VALUES("27","1","","land","2","325436","12345.00","","3455.0","","345456.00","1","2014","0","2014-01-01","","","1","1","1234.000","isco","0","0","0","","");
INSERT INTO ln_fixed_asset VALUES("28","1","","house","1","655","7889.00","","2334.0","","3455.00","1","2014","0","2014-01-01","","","1","1","0.000","marcello","0","0","0","","");
INSERT INTO ln_fixed_asset VALUES("29","1","","departemnet","1","234","2234.00","","12344.0","","5667.00","3","2014","0","2014-01-01","","","1","1","1233.000","hongda","0","0","0","","");



DROP TABLE ln_fixed_asset_preposal;

CREATE TABLE `ln_fixed_asset_preposal` (
  `id` int(11) DEFAULT NULL,
  `fixed_asset_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `date_sold` date DEFAULT NULL,
  `status` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `receipt_type` tinyint(4) DEFAULT '1' COMMENT '1=cash,2=credit,3=other',
  `amount` float(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE ln_fixed_assetdetail;

CREATE TABLE `ln_fixed_assetdetail` (
  `int` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL,
  `total_depre` float(13,2) DEFAULT NULL,
  `times_depre` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `note` text,
  `for_month` int(11) DEFAULT NULL,
  `post_date` date DEFAULT NULL,
  `is_verify` tinyint(4) DEFAULT '0',
  `verify_by` int(11) DEFAULT NULL,
  `is_closing` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`int`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='????? ?????';




DROP TABLE ln_holiday;

CREATE TABLE `ln_holiday` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `holiday_name` varchar(150) DEFAULT NULL,
  `amount_day` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `modify_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO ln_holiday VALUES("4","Happy New Year 2015","1","2015-03-01","2015-03-03","1","2014-12-31","1","","Stop for khmer New Year");
INSERT INTO ln_holiday VALUES("5","Happy New Year 2015","1","2015-01-01","2015-01-15","","","","","");
INSERT INTO ln_holiday VALUES("6","Happy New Year 2015","1","2015-01-01","","","","","","");
INSERT INTO ln_holiday VALUES("7","","","2015-01-01","","","","","","");
INSERT INTO ln_holiday VALUES("8","Khmer New Year ","3","2015-04-14","2015-04-17","1","2015-04-07","1","","1");



DROP TABLE ln_income_expense;

CREATE TABLE `ln_income_expense` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `total_amount` float(12,2) DEFAULT NULL,
  `fordate` int(11) DEFAULT NULL COMMENT '1to 12',
  `disc` text,
  `date` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1use,1unuse',
  `user_id` int(11) DEFAULT NULL,
  `tran_type` tinyint(4) DEFAULT NULL COMMENT '1 expense,2 income',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE ln_journal;

CREATE TABLE `ln_journal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `receipt_number` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `note` text,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `from_location` int(11) DEFAULT '1' COMMENT '1=disburse,2=recieve,3xchange,4 collecteral,5payment collecteral,6 add capital,7=transfer capital',
  `is_adjust` tinyint(4) DEFAULT '0',
  `client_id` int(11) DEFAULT NULL,
  `is_direct` int(11) DEFAULT '0' COMMENT '1 = input ,0 auto',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;

INSERT INTO ln_journal VALUES("13","2","00001","2015-04-04","2015-04-15","from loan disburse","1","1","1","0","2","0");
INSERT INTO ln_journal VALUES("14","2","00002","2015-04-18","2015-04-15","from loan disburse","1","1","1","0","2","0");
INSERT INTO ln_journal VALUES("15","2","00003","2015-04-15","2015-04-15","from loan disburse","1","1","1","0","2","0");
INSERT INTO ln_journal VALUES("18","1","00001","2015-04-15","2015-04-15","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("26","2","00004","2015-04-15","2015-04-15","from loan disburse","1","1","1","0","2","0");
INSERT INTO ln_journal VALUES("27","2","00001","2015-04-15","2015-04-15","from loan disburse","1","1","1","0","2","0");
INSERT INTO ln_journal VALUES("28","2","00002","2015-04-15","2015-04-15","from loan disburse","1","1","1","0","2","0");
INSERT INTO ln_journal VALUES("29","1","00001","2015-04-16","2015-04-16","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("30","1","00001","2015-04-17","2015-04-17","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("31","1","00002","2015-01-06","2015-04-17","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("32","1","00003","2015-04-17","2015-04-17","from loan disburse","1","1","1","0","4","0");
INSERT INTO ln_journal VALUES("33","1","00004","2015-04-17","2015-04-17","from loan disburse","1","1","1","0","5","0");
INSERT INTO ln_journal VALUES("34","1","00006","2015-04-17","2015-04-17","from loan disburse","1","1","1","0","8","0");
INSERT INTO ln_journal VALUES("35","1","00007","2015-04-17","2015-04-17","from loan disburse","1","1","1","0","7","0");
INSERT INTO ln_journal VALUES("36","1","00008","2015-04-17","2015-04-17","from loan disburse","1","1","1","0","6","0");
INSERT INTO ln_journal VALUES("37","1","00009","2015-04-17","2015-04-17","from loan disburse","1","1","1","0","7","0");
INSERT INTO ln_journal VALUES("38","1","00010","2015-04-17","2015-04-17","from loan disburse","1","1","1","0","4","0");
INSERT INTO ln_journal VALUES("39","2","00011","2015-04-17","2015-04-17","from loan disburse","1","1","1","0","2","0");
INSERT INTO ln_journal VALUES("40","1","00012","2015-04-17","2015-04-17","from loan disburse","1","1","1","0","7","0");
INSERT INTO ln_journal VALUES("41","2","00013","2015-04-17","2015-04-17","from loan disburse","1","1","1","0","2","0");
INSERT INTO ln_journal VALUES("42","1","00001","2015-04-20","2015-04-20","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("43","1","00001","2015-04-22","2015-04-22","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("44","1","00001","2015-04-22","2015-04-22","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("45","1","00002","2015-04-22","2015-04-22","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("46","1","00003","2015-04-22","2015-04-22","from loan disburse","1","1","1","0","4","0");
INSERT INTO ln_journal VALUES("47","1","00004","2015-04-22","2015-04-22","from loan disburse","1","1","1","0","9","0");
INSERT INTO ln_journal VALUES("48","1","00005","2015-04-22","2015-04-22","from loan disburse","1","1","1","0","8","0");
INSERT INTO ln_journal VALUES("49","1","00006","2015-04-22","2015-04-22","from loan disburse","1","1","1","0","6","0");
INSERT INTO ln_journal VALUES("50","1","00007","2015-04-22","2015-04-22","from loan disburse","1","1","1","0","7","0");
INSERT INTO ln_journal VALUES("51","1","00008","2015-04-22","2015-04-22","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("52","2","00009","2015-04-22","2015-04-22","from loan disburse","1","1","1","0","2","0");
INSERT INTO ln_journal VALUES("53","1","00010","2015-04-22","2015-04-22","from loan disburse","1","1","1","0","5","0");
INSERT INTO ln_journal VALUES("54","1","00011","2015-04-22","2015-04-22","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("55","1","00012","2015-04-28","2015-04-28","from loan disburse","1","1","1","0","5","0");
INSERT INTO ln_journal VALUES("56","1","00013","2015-04-29","2015-04-29","from loan disburse","1","1","1","0","11","0");
INSERT INTO ln_journal VALUES("58","1","00013","2015-04-29","2015-04-29","from loan disburse","1","1","1","0","11","0");
INSERT INTO ln_journal VALUES("59","1","00017","2015-04-30","2015-04-30","from loan disburse","1","1","1","0","11","0");
INSERT INTO ln_journal VALUES("60","1","00018","2015-05-03","2015-05-03","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("61","1","00019","2015-05-03","2015-05-03","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("62","1","PPL00001","2015-05-07","2015-05-07","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("63","1","PPL00002","2015-05-07","2015-05-07","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("64","1","PPL00003","2015-05-09","2015-05-09","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("65","1","PPL00004","2015-05-09","2015-05-09","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("66","1","PPL00005","2015-05-09","2015-05-09","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("67","1","PPL00006","2015-05-09","2015-05-09","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("70","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("71","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("72","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("73","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("74","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("75","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("76","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("77","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("78","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("79","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("80","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("81","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("82","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("83","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("84","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("85","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("86","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("87","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("88","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("89","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("90","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("91","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("92","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("93","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("94","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("95","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("96","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("97","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("98","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("99","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("100","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("101","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("102","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("103","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("104","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("105","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("106","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("107","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("108","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("109","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("110","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("111","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("112","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("113","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("114","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("115","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("116","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("117","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("118","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("119","1","PPL00007","2015-05-14","2015-05-14","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("120","1","PPL00007","2015-05-15","2015-05-15","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("121","1","PPL00007","2015-05-15","2015-05-15","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("122","1","PPL00001","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("123","1","PPL00002","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("124","1","PPL00003","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("125","1","PPL00004","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("126","1","PPL00005","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("127","1","PPL00006","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("128","1","PPL00006","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("129","1","PPL00006","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("130","1","PPL00006","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("131","1","PPL00006","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("132","1","PPL00006","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("133","1","PPL00006","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("134","1","PPL00006","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("135","1","PPL00006","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("136","1","PPL00006","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("137","1","PPL00006","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","3","0");
INSERT INTO ln_journal VALUES("138","1","PPL00006","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("139","1","PPL00006","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("140","1","PPL00006","2015-05-21","2015-05-21","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("141","1","PPL00007","2015-05-25","2015-05-25","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("142","1","PPL00008","2015-05-26","2015-05-26","from loan disburse","","1","1","0","4","0");
INSERT INTO ln_journal VALUES("143","1","PPL00001","2015-05-29","2015-05-29","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("145","1","PPL00002","2015-05-29","2015-05-29","from loan disburse","1","1","1","0","2","0");
INSERT INTO ln_journal VALUES("146","1","PPL00003","2015-05-29","2015-05-29","from loan disburse","1","1","1","0","2","0");
INSERT INTO ln_journal VALUES("147","1","PPL00001","2015-05-30","2015-05-30","from loan disburse","1","1","1","0","1","0");
INSERT INTO ln_journal VALUES("148","7","KDL00001","2015-06-02","2015-06-02","from loan disburse","1","1","1","0","5","0");
INSERT INTO ln_journal VALUES("149","1","PPL00001","2015-06-04","2015-06-04","from loan disburse","1","1","1","0","1","0");



DROP TABLE ln_journal_detail;

CREATE TABLE `ln_journal_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jur_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `account_type` tinyint(4) DEFAULT '1' COMMENT '1=debit ,2 credit',
  `is_increase` tinyint(4) DEFAULT '0',
  `currency_type` tinyint(4) DEFAULT NULL,
  `balance` float(13,3) DEFAULT '0.000',
  `is_adjust` tinyint(4) DEFAULT '0' COMMENT '0=not adjust,1=adjust',
  `status` tinyint(4) DEFAULT '1',
  `tran_type` tinyint(4) DEFAULT '1' COMMENT '1=disburse,2=recieve,3xchange,4 collecteral,5payment collecteral',
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=585 DEFAULT CHARSET=utf8;

INSERT INTO ln_journal_detail VALUES("49","13","2","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("50","13","2","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("51","13","2","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("52","13","2","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("53","14","2","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("54","14","2","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("55","14","2","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("56","14","2","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("57","15","2","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("58","15","2","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("59","15","2","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("60","15","2","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("69","18","1","1","1","1","1","1000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("70","18","1","2","2","0","1","1000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("71","18","1","2","2","1","1","1000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("72","18","1","3","2","1","1","1000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("101","26","2","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("102","26","2","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("103","26","2","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("104","26","2","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("105","27","2","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("106","27","2","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("107","27","2","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("108","27","2","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("109","28","2","1","1","1","1","1000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("110","28","2","2","2","0","1","1000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("111","28","2","2","2","1","1","1000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("112","28","2","3","2","1","1","1000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("113","29","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("114","29","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("115","29","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("116","29","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("117","30","1","1","1","1","2","1500.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("118","30","1","2","2","0","2","1500.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("119","30","1","2","2","1","2","1500.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("120","30","1","3","2","1","2","1500.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("121","31","1","1","1","1","2","4000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("122","31","1","2","2","0","2","4000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("123","31","1","2","2","1","2","4000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("124","31","1","3","2","1","2","4000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("125","32","1","1","1","1","2","4000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("126","32","1","2","2","0","2","4000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("127","32","1","2","2","1","2","4000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("128","32","1","3","2","1","2","4000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("129","33","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("130","33","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("131","33","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("132","33","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("133","34","1","1","1","1","2","3000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("134","34","1","2","2","0","2","3000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("135","34","1","2","2","1","2","3000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("136","34","1","3","2","1","2","3000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("137","35","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("138","35","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("139","35","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("140","35","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("141","36","1","1","1","1","2","1000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("142","36","1","2","2","0","2","1000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("143","36","1","2","2","1","2","1000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("144","36","1","3","2","1","2","1000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("145","37","1","1","1","1","2","1000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("146","37","1","2","2","0","2","1000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("147","37","1","2","2","1","2","1000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("148","37","1","3","2","1","2","1000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("149","38","1","1","1","1","2","1000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("150","38","1","2","2","0","2","1000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("151","38","1","2","2","1","2","1000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("152","38","1","3","2","1","2","1000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("153","39","2","1","1","1","1","1000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("154","39","2","2","2","0","1","1000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("155","39","2","2","2","1","1","1000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("156","39","2","3","2","1","1","1000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("157","40","1","1","1","1","2","3000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("158","40","1","2","2","0","2","3000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("159","40","1","2","2","1","2","3000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("160","40","1","3","2","1","2","3000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("161","41","2","1","1","1","1","3000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("162","41","2","2","2","0","1","3000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("163","41","2","2","2","1","1","3000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("164","41","2","3","2","1","1","3000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("165","42","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("166","42","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("167","42","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("168","42","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("169","43","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("170","43","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("171","43","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("172","43","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("173","44","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("174","44","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("175","44","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("176","44","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("177","45","1","1","1","1","1","2000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("178","45","1","2","2","0","1","2000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("179","45","1","2","2","1","1","2000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("180","45","1","3","2","1","1","2000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("181","46","1","1","1","1","3","30000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("182","46","1","2","2","0","3","30000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("183","46","1","2","2","1","3","30000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("184","46","1","3","2","1","3","30000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("185","47","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("186","47","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("187","47","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("188","47","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("189","48","1","1","1","1","2","2000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("190","48","1","2","2","0","2","2000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("191","48","1","2","2","1","2","2000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("192","48","1","3","2","1","2","2000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("193","49","1","1","1","1","2","4000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("194","49","1","2","2","0","2","4000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("195","49","1","2","2","1","2","4000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("196","49","1","3","2","1","2","4000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("197","50","1","1","1","1","1","20000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("198","50","1","2","2","0","1","20000000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("199","50","1","2","2","1","1","20000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("200","50","1","3","2","1","1","20000000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("201","51","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("202","51","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("203","51","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("204","51","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("205","52","2","1","1","1","2","4000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("206","52","2","2","2","0","2","4000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("207","52","2","2","2","1","2","4000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("208","52","2","3","2","1","2","4000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("209","53","1","1","1","1","2","3000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("210","53","1","2","2","0","2","3000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("211","53","1","2","2","1","2","3000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("212","53","1","3","2","1","2","3000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("213","54","1","1","1","1","3","4000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("214","54","1","2","2","0","3","4000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("215","54","1","2","2","1","3","4000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("216","54","1","3","2","1","3","4000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("217","55","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("218","55","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("219","55","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("220","55","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("221","56","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("222","56","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("223","56","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("224","56","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("227","58","1","1","1","1","2","916.670","0","1","1","");
INSERT INTO ln_journal_detail VALUES("228","58","1","2","2","0","2","916.670","0","1","1","");
INSERT INTO ln_journal_detail VALUES("229","59","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("230","59","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("231","59","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("232","59","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("233","60","1","1","1","1","2","2000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("234","60","1","2","2","0","2","2000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("235","60","1","2","2","1","2","2000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("236","60","1","3","2","1","2","2000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("237","61","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("238","61","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("239","61","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("240","61","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("241","62","1","1","1","1","2","100.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("242","62","1","2","2","0","2","100.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("243","62","1","2","2","1","2","100.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("244","62","1","3","2","1","2","100.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("245","63","1","1","1","1","2","3000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("246","63","1","2","2","0","2","3000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("247","63","1","2","2","1","2","3000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("248","63","1","3","2","1","2","3000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("249","64","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("250","64","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("251","64","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("252","64","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("253","65","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("254","65","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("255","65","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("256","65","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("257","66","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("258","66","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("259","66","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("260","66","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("261","67","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("262","67","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("263","67","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("264","67","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("265","70","1","1","1","1","2","22.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("266","70","1","2","2","0","2","22.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("267","70","1","2","2","1","2","22.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("268","70","1","3","2","1","2","22.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("269","71","1","1","1","1","2","22.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("270","71","1","2","2","0","2","22.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("271","71","1","2","2","1","2","22.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("272","71","1","3","2","1","2","22.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("273","72","1","1","1","1","2","22.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("274","72","1","2","2","0","2","22.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("275","72","1","2","2","1","2","22.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("276","72","1","3","2","1","2","22.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("277","73","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("278","73","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("279","73","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("280","73","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("281","74","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("282","74","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("283","74","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("284","74","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("285","75","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("286","75","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("287","75","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("288","75","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("289","76","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("290","76","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("291","76","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("292","76","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("293","77","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("294","77","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("295","77","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("296","77","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("297","78","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("298","78","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("299","78","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("300","78","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("301","79","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("302","79","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("303","79","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("304","79","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("305","80","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("306","80","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("307","80","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("308","80","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("309","81","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("310","81","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("311","81","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("312","81","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("313","82","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("314","82","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("315","82","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("316","82","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("317","83","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("318","83","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("319","83","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("320","83","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("321","84","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("322","84","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("323","84","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("324","84","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("325","85","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("326","85","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("327","85","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("328","85","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("329","86","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("330","86","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("331","86","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("332","86","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("333","87","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("334","87","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("335","87","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("336","87","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("337","88","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("338","88","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("339","88","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("340","88","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("341","89","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("342","89","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("343","89","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("344","89","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("345","90","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("346","90","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("347","90","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("348","90","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("349","91","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("350","91","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("351","91","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("352","91","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("353","92","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("354","92","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("355","92","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("356","92","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("357","93","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("358","93","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("359","93","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("360","93","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("361","94","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("362","94","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("363","94","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("364","94","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("365","95","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("366","95","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("367","95","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("368","95","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("369","96","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("370","96","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("371","96","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("372","96","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("373","97","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("374","97","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("375","97","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("376","97","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("377","98","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("378","98","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("379","98","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("380","98","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("381","99","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("382","99","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("383","99","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("384","99","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("385","100","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("386","100","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("387","100","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("388","100","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("389","101","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("390","101","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("391","101","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("392","101","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("393","102","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("394","102","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("395","102","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("396","102","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("397","103","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("398","103","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("399","103","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("400","103","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("401","104","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("402","104","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("403","104","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("404","104","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("405","105","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("406","105","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("407","105","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("408","105","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("409","106","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("410","106","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("411","106","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("412","106","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("413","107","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("414","107","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("415","107","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("416","107","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("417","108","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("418","108","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("419","108","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("420","108","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("421","109","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("422","109","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("423","109","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("424","109","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("425","110","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("426","110","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("427","110","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("428","110","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("429","111","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("430","111","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("431","111","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("432","111","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("433","112","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("434","112","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("435","112","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("436","112","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("437","113","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("438","113","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("439","113","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("440","113","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("441","114","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("442","114","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("443","114","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("444","114","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("445","115","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("446","115","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("447","115","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("448","115","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("449","116","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("450","116","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("451","116","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("452","116","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("453","117","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("454","117","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("455","117","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("456","117","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("457","118","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("458","118","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("459","118","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("460","118","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("461","119","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("462","119","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("463","119","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("464","119","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("465","120","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("466","120","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("467","120","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("468","120","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("469","121","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("470","121","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("471","121","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("472","121","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("473","122","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("474","122","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("475","122","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("476","122","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("477","123","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("478","123","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("479","123","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("480","123","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("481","124","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("482","124","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("483","124","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("484","124","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("485","125","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("486","125","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("487","125","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("488","125","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("489","126","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("490","126","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("491","126","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("492","126","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("493","127","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("494","127","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("495","127","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("496","127","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("497","128","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("498","128","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("499","128","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("500","128","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("501","129","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("502","129","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("503","129","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("504","129","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("505","130","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("506","130","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("507","130","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("508","130","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("509","131","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("510","131","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("511","131","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("512","131","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("513","132","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("514","132","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("515","132","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("516","132","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("517","133","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("518","133","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("519","133","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("520","133","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("521","134","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("522","134","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("523","134","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("524","134","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("525","135","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("526","135","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("527","135","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("528","135","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("529","136","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("530","136","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("531","136","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("532","136","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("533","137","1","1","1","1","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("534","137","1","2","2","0","2","1200.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("535","137","1","2","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("536","137","1","3","2","1","2","1200.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("537","138","1","1","1","1","2","2400.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("538","138","1","2","2","0","2","2400.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("539","138","1","2","2","1","2","2400.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("540","138","1","3","2","1","2","2400.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("541","139","1","1","1","1","2","2400.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("542","139","1","2","2","0","2","2400.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("543","139","1","2","2","1","2","2400.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("544","139","1","3","2","1","2","2400.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("545","140","1","1","1","1","2","2400.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("546","140","1","2","2","0","2","2400.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("547","140","1","2","2","1","2","2400.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("548","140","1","3","2","1","2","2400.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("549","141","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("550","141","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("551","141","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("552","141","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("553","142","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("554","142","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("555","142","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("556","142","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("557","143","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("558","143","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("559","143","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("560","143","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("565","145","1","1","1","1","1","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("566","145","1","2","2","0","1","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("567","145","1","2","2","1","1","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("568","145","1","3","2","1","1","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("569","146","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("570","146","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("571","146","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("572","146","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("573","147","1","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("574","147","1","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("575","147","1","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("576","147","1","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("577","148","7","1","1","1","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("578","148","7","2","2","0","2","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("579","148","7","2","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("580","148","7","3","2","1","2","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("581","149","1","1","1","1","1","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("582","149","1","2","2","0","1","1000.000","0","1","1","");
INSERT INTO ln_journal_detail VALUES("583","149","1","2","2","1","1","1000.000","0","1","1","Admin fee from disburse loan ");
INSERT INTO ln_journal_detail VALUES("584","149","1","3","2","1","1","1000.000","0","1","1","Admin fee from disburse loan ");



DROP TABLE ln_loan_group;

CREATE TABLE `ln_loan_group` (
  `g_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` int(20) DEFAULT '1' COMMENT '?????? ???????????????',
  `group_id` int(11) DEFAULT NULL COMMENT '?????????? =client id of group',
  `co_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `date_release` date DEFAULT NULL,
  `date_line` date DEFAULT NULL COMMENT 'life of loan',
  `create_date` date DEFAULT NULL,
  `total_duration` int(11) DEFAULT NULL COMMENT '??????????',
  `first_payment` date DEFAULT NULL,
  `time_collect` varchar(30) DEFAULT NULL,
  `collect_typeterm` tinyint(4) DEFAULT NULL COMMENT '???? month ,week, day',
  `pay_term` tinyint(4) DEFAULT NULL COMMENT '?????? ??? week ,day',
  `payment_method` int(11) DEFAULT NULL,
  `holiday` tinyint(4) DEFAULT NULL,
  `is_renew` tinyint(4) DEFAULT '0' COMMENT '0=old list,1=new list',
  `branch_id` int(11) DEFAULT '1',
  `loan_type` tinyint(4) DEFAULT '1' COMMENT '1=individule,2=group',
  `status` tinyint(4) DEFAULT '1' COMMENT '0 deactive ,1 active ,2 complated',
  `is_verify` tinyint(4) DEFAULT '0',
  `is_badloan` tinyint(4) DEFAULT '0',
  `teller_id` int(11) DEFAULT NULL,
  `is_reschedule` tinyint(4) DEFAULT '0' COMMENT '?????? reschedule ???? befor reschedul 1,2=after',
  `user_id` int(11) DEFAULT NULL,
  `for_loantype` int(11) DEFAULT NULL,
  `reschedule_opt` tinyint(4) DEFAULT '0' COMMENT '?????????reschedule ????1= new schedule , 2 overide old schedule',
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO ln_loan_group VALUES("1","1","1","1","1","2015-09-07","2016-10-07","2015-09-07","12","2015-10-07","10:00-11:00 AM","3","3","1","2","0","1","1","1","0","0","","0","","1","0");



DROP TABLE ln_loan_member;

CREATE TABLE `ln_loan_member` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chart_id` int(11) DEFAULT NULL COMMENT 'from chart account 1',
  `group_id` int(11) DEFAULT NULL,
  `loan_number` varchar(20) DEFAULT NULL COMMENT 'first is branch then 5',
  `client_id` int(11) DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `currency_type` tinyint(4) DEFAULT NULL COMMENT '1=khmer ,2=dollar',
  `total_capital` float(15,2) DEFAULT NULL,
  `admin_fee` float(15,2) DEFAULT NULL,
  `other_fee` float(15,2) DEFAULT NULL,
  `collect_typeterm` tinyint(4) DEFAULT NULL,
  `interest_rate` float(10,2) NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  `branch_id` int(11) unsigned DEFAULT '1',
  `loan_cycle` tinyint(4) DEFAULT '0' COMMENT '1= is loan cycle,0 not loan cycle',
  `loan_purpose` text,
  `pay_before` varchar(30) DEFAULT '0' COMMENT '??????????????',
  `pay_after` varchar(30) DEFAULT '0' COMMENT '??????????????',
  `graice_period` int(11) DEFAULT '0',
  `amount_collect_principal` float(15,2) DEFAULT NULL,
  `show_barcode` tinyint(4) DEFAULT '0' COMMENT '1 show,0 not show',
  `is_completed` tinyint(4) DEFAULT '0' COMMENT '0 yet,1 complete,2=some fund',
  `semi` int(11) DEFAULT '1' COMMENT '?????????????????????? ?? ????????????????????????',
  `is_reschedule` tinyint(4) DEFAULT '0' COMMENT '?????? reschedule ???? befor reschedul 1,2=after',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO ln_loan_member VALUES("1","","1","PPL00001","1","1","2","1000.00","10.00","0.00","3","2.50","1","1","0","","0","2","0","1.00","0","0","0","0");



DROP TABLE ln_loanmember_funddetail;

CREATE TABLE `ln_loanmember_funddetail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `total_principal` float(15,2) DEFAULT NULL,
  `principal_permonth` float(15,2) DEFAULT NULL,
  `principle_after` float(15,2) DEFAULT NULL COMMENT '??????????????????????????',
  `total_interest` float(15,2) DEFAULT NULL COMMENT '??????????????????????',
  `total_interest_after` float(15,2) DEFAULT NULL,
  `total_payment` float(15,2) DEFAULT NULL,
  `total_payment_after` float(15,2) DEFAULT NULL,
  `amount_day` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `is_completed` tinyint(4) DEFAULT '0' COMMENT '0=not complete,1=complete,2=in progress',
  `is_approved` tinyint(4) DEFAULT '0' COMMENT '1=approved paycomplete,not yet',
  `date_payment` date DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `collect_by` int(11) DEFAULT '1' COMMENT '?????????????',
  `payment_option` tinyint(4) DEFAULT NULL COMMENT '1=normal,2=before,3=after',
  `penelize` float(15,2) DEFAULT '0.00',
  `service_charge` float(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO ln_loanmember_funddetail VALUES("1","1","1000.00","83.33","83.33","25.00","25.00","108.33","108.33","30","1","1","0","2015-10-07","1","1","1","0.00","0.00");
INSERT INTO ln_loanmember_funddetail VALUES("2","1","916.67","83.33","83.33","23.68","23.68","107.01","107.01","31","1","0","0","2015-11-07","1","1","","0.00","0.00");
INSERT INTO ln_loanmember_funddetail VALUES("3","1","833.34","83.33","83.33","20.83","20.83","104.16","104.16","30","1","0","0","2015-12-07","1","1","","0.00","0.00");
INSERT INTO ln_loanmember_funddetail VALUES("4","1","750.01","83.33","83.33","19.38","19.38","102.71","102.71","31","1","0","0","2016-01-07","1","1","","0.00","0.00");
INSERT INTO ln_loanmember_funddetail VALUES("5","1","666.68","83.33","83.33","17.22","17.22","100.55","100.55","31","1","0","0","2016-02-07","1","1","","0.00","0.00");
INSERT INTO ln_loanmember_funddetail VALUES("6","1","583.35","83.33","83.33","14.10","14.10","97.43","97.43","29","1","0","0","2016-03-07","1","1","","0.00","0.00");
INSERT INTO ln_loanmember_funddetail VALUES("7","1","500.02","83.33","83.33","12.92","12.92","96.25","96.25","31","1","0","0","2016-04-07","1","1","","0.00","0.00");
INSERT INTO ln_loanmember_funddetail VALUES("8","1","416.69","83.33","83.33","10.42","10.42","93.75","93.75","30","1","0","0","2016-05-07","1","1","","0.00","0.00");
INSERT INTO ln_loanmember_funddetail VALUES("9","1","333.36","83.33","83.33","8.61","8.61","91.94","91.94","31","1","0","0","2016-06-07","1","1","","0.00","0.00");
INSERT INTO ln_loanmember_funddetail VALUES("10","1","250.03","83.33","83.33","6.25","6.25","89.58","89.58","30","1","0","0","2016-07-07","1","1","","0.00","0.00");
INSERT INTO ln_loanmember_funddetail VALUES("11","1","166.70","83.33","83.33","4.31","4.31","87.64","87.64","31","1","0","0","2016-08-07","1","1","","0.00","0.00");
INSERT INTO ln_loanmember_funddetail VALUES("12","1","83.37","83.37","83.37","2.15","2.15","85.52","85.52","31","1","0","0","2016-09-07","1","1","","0.00","0.00");



DROP TABLE ln_payment_method;

CREATE TABLE `ln_payment_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_nameen` varchar(50) DEFAULT NULL,
  `payment_namekh` varchar(50) DEFAULT NULL,
  `displayby` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO ln_payment_method VALUES("1","Decline","???????????","","1");
INSERT INTO ln_payment_method VALUES("2","Baloon","????????","","1");
INSERT INTO ln_payment_method VALUES("3","Flat Rate","??????","","1");
INSERT INTO ln_payment_method VALUES("4","Fixed Payment(Full Last Period)","?????????????????","","1");
INSERT INTO ln_payment_method VALUES("5","Semi Baloon","Semi Baloon","","1");
INSERT INTO ln_payment_method VALUES("6","Fixed Payment IRR","Fixed Payment IRR","","1");



DROP TABLE ln_permission;

CREATE TABLE `ln_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `approve_by` int(11) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `permission_type` varchar(100) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `all_day` varchar(20) DEFAULT NULL,
  `paid_leave` varchar(20) DEFAULT NULL,
  `every_day` varchar(20) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO ln_permission VALUES("1","7","1","1","2014-12-10","1","2014-12-23","2014-12-23","00:00:00","1","0","0","??","0","2014-12-24","1");
INSERT INTO ln_permission VALUES("2","4","2","1","2014-12-12","4","2014-12-23","2014-12-23","09:51:08","1","1","0","????????????","0","2015-01-17","1");
INSERT INTO ln_permission VALUES("3","3","1","6","2014-12-04","3","2014-12-23","2014-12-23","00:00:00","0","0","1","?????????","0","2015-01-17","1");
INSERT INTO ln_permission VALUES("4","10","2","6","2014-12-04","2","2014-12-23","2014-12-23","00:00:00","0","1","0","????????????","1","2015-01-17","1");
INSERT INTO ln_permission VALUES("5","6","1","4","2014-12-05","1","2014-12-24","2014-12-24","00:00:00","1","0","0","?????????","1","2015-01-17","1");
INSERT INTO ln_permission VALUES("6","5","1","6","2014-12-19","1","2014-12-24","2014-12-24","00:00:00","1","1","0","????","1","2015-01-17","1");
INSERT INTO ln_permission VALUES("9","8","1","1","2014-12-10","1","2014-12-23","2014-12-23","00:00:00","1","1","0","???????","1","2015-01-17","1");
INSERT INTO ln_permission VALUES("10","1","2","8","2014-12-19","1","2014-12-24","2014-12-24","00:00:00","0","1","1","????","1","2014-12-24","1");
INSERT INTO ln_permission VALUES("11","4","1","2","2014-12-01","1","2014-12-17","2014-12-26","05:55:00","1","0","0","???????","1","2015-01-17","1");
INSERT INTO ln_permission VALUES("12","1","1","2","2014-12-12","3","2014-12-24","2014-12-24","00:00:00","0","1","0","????????????????","1","2014-12-24","1");
INSERT INTO ln_permission VALUES("13","6","1","8","2014-12-17","1","2014-12-11","2014-12-24","00:00:00","0","0","1","?????????","1","2014-12-24","1");



DROP TABLE ln_position;

CREATE TABLE `ln_position` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `position_en` varchar(100) NOT NULL,
  `position_kh` varchar(100) NOT NULL,
  `date` varchar(30) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1 active ,0 deactive',
  `user_id` int(11) NOT NULL COMMENT 'user modify and create',
  `displayby` tinyint(4) DEFAULT '1' COMMENT '1 khmer ,2 english',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO ln_position VALUES("1","","Creditor Officer","????????????","Feb 23, 2014 6:04:30 AM","1","1","1");
INSERT INTO ln_position VALUES("2","","Teller","??????????????","Feb 23, 2014 6:06:30 AM","1","1","1");
INSERT INTO ln_position VALUES("4","","Accountant","?????????","Feb 23, 2014 6:12:47 AM","1","1","1");
INSERT INTO ln_position VALUES("5","","Administrator Officer","???????","Feb 23, 2014 6:17:44 AM","1","1","1");
INSERT INTO ln_position VALUES("6","","Branch Manager","????????????????????","Jun 1, 2014 4:05:12 PM","1","1","1");
INSERT INTO ln_position VALUES("7","","Marketing ","??????","Jun 1, 2014 1:28:44 PM","1","1","1");
INSERT INTO ln_position VALUES("8","","Operation","?????????????????","Jun 1, 2014 1:34:10 PM","1","1","1");



DROP TABLE ln_province;

CREATE TABLE `ln_province` (
  `province_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `province_en_name` varchar(50) DEFAULT NULL,
  `province_kh_name` varchar(60) DEFAULT NULL,
  `modify_date` varchar(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `user_id` int(10) DEFAULT NULL,
  `displayby` tinyint(4) DEFAULT '1' COMMENT '1=kh,2=eng',
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

INSERT INTO ln_province VALUES("1","Phnom Penh","???????","Apr 6, 2015 7:17:50 PM","1","1","1","1");
INSERT INTO ln_province VALUES("2","Battambang","????????","Apr 6, 2015 7:18:30 PM","1","1","1","1");
INSERT INTO ln_province VALUES("3","Banteay Meanchey","????????????","Apr 6, 2015 7:18:14 PM","1","1","1","1");
INSERT INTO ln_province VALUES("4","Kampong Cham","????????","Apr 6, 2015 7:18:45 PM","1","1","1","");
INSERT INTO ln_province VALUES("5","Kampong Chhnang","???????????","Apr 6, 2015 7:19:10 PM","1","1","1","");
INSERT INTO ln_province VALUES("6","Kampong Speu","?????????","Apr 6, 2015 7:19:25 PM","1","1","1","");
INSERT INTO ln_province VALUES("7","Kampong Thom","???????","Apr 6, 2015 7:19:40 PM","1","1","1","");
INSERT INTO ln_province VALUES("8","Kampot","????","Apr 6, 2015 7:19:52 PM","1","1","1","");
INSERT INTO ln_province VALUES("9","Kandal","??????","Apr 6, 2015 7:20:07 PM","1","1","1","");
INSERT INTO ln_province VALUES("10","Koh Kong","??????","Apr 6, 2015 7:20:22 PM","1","1","1","");
INSERT INTO ln_province VALUES("11","Kratie","??????","Apr 6, 2015 7:21:06 PM","1","1","1","");
INSERT INTO ln_province VALUES("12","Mondulkiri","?????????","Apr 6, 2015 7:21:20 PM","1","1","1","");
INSERT INTO ln_province VALUES("13","Oddar Meancheay","Oddar Meancheay","Apr 6, 2015 7:14:26 PM","1","1","1","");
INSERT INTO ln_province VALUES("14","Preah Vihear","?????????","Apr 6, 2015 7:22:11 PM","1","1","1","");
INSERT INTO ln_province VALUES("15","Pursat","?????????","Apr 6, 2015 7:22:32 PM","1","1","1","");
INSERT INTO ln_province VALUES("16","Prey Veng","???????","Apr 6, 2015 7:22:52 PM","1","1","1","");
INSERT INTO ln_province VALUES("17","Ratanakiri","???????","Apr 6, 2015 7:23:08 PM","1","1","1","");
INSERT INTO ln_province VALUES("18","Siem Reap","??????","Apr 6, 2015 7:23:23 PM","1","1","1","");
INSERT INTO ln_province VALUES("19","Stung Treng","??????????","Apr 6, 2015 7:23:38 PM","1","1","1","");
INSERT INTO ln_province VALUES("20","Svay Rieng","????????","Apr 6, 2015 7:23:56 PM","1","1","1","");
INSERT INTO ln_province VALUES("21","Takeo","?????","Apr 6, 2015 7:24:25 PM","1","1","1","");
INSERT INTO ln_province VALUES("22","Kep","???","Apr 6, 2015 7:20:35 PM","1","1","1","");
INSERT INTO ln_province VALUES("23","Pailin","?????","Apr 6, 2015 7:21:55 PM","1","1","1","");
INSERT INTO ln_province VALUES("24","Preah Sihanouk","?????????","Apr 6, 2015 7:17:28 PM","1","1","1","");
INSERT INTO ln_province VALUES("25","Tbong Khmum","??????????","Apr 6, 2015 7:24:39 PM","1","1","1","");



DROP TABLE ln_referenct;

CREATE TABLE `ln_referenct` (
  `ref_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE ln_reschedule;

CREATE TABLE `ln_reschedule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `loan_number` varchar(30) DEFAULT NULL COMMENT '???ID ?? loan group table',
  `reschedule_date` date DEFAULT NULL,
  `re_amount` double(18,2) DEFAULT NULL,
  `re_interest_rate` float DEFAULT NULL,
  `maturity` date DEFAULT NULL,
  `re_payment_method` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `re_loan_number` varchar(30) DEFAULT NULL COMMENT 'loan number after reschedule',
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO ln_reschedule VALUES("1","PPL00002","2015-07-28","1200.00","2.5","2016-08-28","1","1","1","PPL00002R","");
INSERT INTO ln_reschedule VALUES("2","PTL00001","2015-08-11","40000.00","2.5","2016-06-11","3","1","1","PTL00001R","");



DROP TABLE ln_return_collteral;

CREATE TABLE `ln_return_collteral` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `change_id` int(11) DEFAULT NULL COMMENT 'id ??????? ???Return Collateral',
  `giver_name` varchar(50) DEFAULT NULL,
  `receiver_name` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '1' COMMENT '1=??????????',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='return client callateral';

INSERT INTO ln_return_collteral VALUES("1","1","1","1","mok channy-???? ?????","channy","2015-09-03","return back to client","1","1");
INSERT INTO ln_return_collteral VALUES("2","1","3","","channy","sok virak-??? ????","2015-09-25","return back to client","1","1");
INSERT INTO ln_return_collteral VALUES("3","1","3","","channy","sok virak-??? ????","2015-09-25","return back to client","1","1");
INSERT INTO ln_return_collteral VALUES("4","1","3","2","sok virak-??? ????","channy","2015-09-25","return back to client","1","1");
INSERT INTO ln_return_collteral VALUES("5","1","3","","channy","sok virak-??? ????","2015-09-28","return back to client","1","1");
INSERT INTO ln_return_collteral VALUES("6","1","4","","channy","Lum Chenda-?? ??????","2015-09-28","return back to client","1","1");



DROP TABLE ln_return_collteral_detail;

CREATE TABLE `ln_return_collteral_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int(11) DEFAULT NULL COMMENT 'primary from return table',
  `collect_type` int(11) DEFAULT NULL,
  `owner_type` tinyint(4) DEFAULT NULL,
  `owner_name` varchar(50) DEFAULT NULL,
  `number_collteral` varchar(50) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO ln_return_collteral_detail VALUES("1","1","1","1","mok channy-???? ?????","100","2015-09-22","","1");
INSERT INTO ln_return_collteral_detail VALUES("2","2","1","1","sok virak-??? ????","1","2015-09-25","","1");
INSERT INTO ln_return_collteral_detail VALUES("3","2","1","1","sok virak-??? ????","2","2015-09-09","","1");
INSERT INTO ln_return_collteral_detail VALUES("4","3","1","1","sok virak-??? ????","3","2015-09-03","return","1");
INSERT INTO ln_return_collteral_detail VALUES("5","4","7","1","sok virak-??? ????","333","2015-09-10","","1");
INSERT INTO ln_return_collteral_detail VALUES("6","5","5","1","sok virak-??? ????","111","2015-09-10","from channy to virak","1");
INSERT INTO ln_return_collteral_detail VALUES("7","6","1","1","Lum Chenda-?? ??????","11","2015-09-02","return from channy to chenda","1");



DROP TABLE ln_salary;

CREATE TABLE `ln_salary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `staff_id` varchar(50) DEFAULT NULL,
  `basic_salary` float(12,2) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_get_salary` date DEFAULT NULL,
  `for_month` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `detail` varchar(10) DEFAULT 'Click',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE ln_salary_detail;

CREATE TABLE `ln_salary_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bonus_id` int(11) DEFAULT NULL,
  `bonus_type` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `note` text,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE ln_system_setting;

CREATE TABLE `ln_system_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keycode` varchar(150) DEFAULT NULL,
  `value` varchar(11) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

INSERT INTO ln_system_setting VALUES("1","work_saturday","1","1=work on saturday 0 not work");
INSERT INTO ln_system_setting VALUES("2","work_sunday","1","1=work on sunday 0 not work");
INSERT INTO ln_system_setting VALUES("3","servername","localhost","");
INSERT INTO ln_system_setting VALUES("4","dbuser","root","");
INSERT INTO ln_system_setting VALUES("5","dbpassword","","");
INSERT INTO ln_system_setting VALUES("6","dbname","db_loan","");
INSERT INTO ln_system_setting VALUES("7","adminfee","1","10% of loan amount");
INSERT INTO ln_system_setting VALUES("8","interest_late","2","????????????????????????????");
INSERT INTO ln_system_setting VALUES("9","graice_pariod_late","2","???????????????????????");
INSERT INTO ln_system_setting VALUES("10","reschedule_postfix","R","?????????????????????????????????????????????");
INSERT INTO ln_system_setting VALUES("11","claro","Claro","");
INSERT INTO ln_system_setting VALUES("12","nihilo","Nihilo","");
INSERT INTO ln_system_setting VALUES("13","soria","Soria","");
INSERT INTO ln_system_setting VALUES("14","tundra","tundra","");
INSERT INTO ln_system_setting VALUES("15","theme_setting","2","");
INSERT INTO ln_system_setting VALUES("17","send_teller","1","??????????????????");



DROP TABLE ln_test_loan_group;

CREATE TABLE `ln_test_loan_group` (
  `g_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` int(20) DEFAULT '1' COMMENT '?????? ???????????????',
  `group_id` int(11) DEFAULT NULL COMMENT '?????????? =client id of group',
  `co_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `date_release` date DEFAULT NULL,
  `date_line` date DEFAULT NULL COMMENT 'life of loan',
  `create_date` date DEFAULT NULL,
  `total_duration` int(11) DEFAULT NULL COMMENT '??????????',
  `first_payment` date DEFAULT NULL,
  `time_collect` varchar(30) DEFAULT NULL,
  `collect_typeterm` tinyint(4) DEFAULT NULL COMMENT '???? month ,week, day',
  `pay_term` tinyint(4) DEFAULT NULL COMMENT '?????? ??? week ,day',
  `payment_method` int(11) DEFAULT NULL,
  `holiday` tinyint(4) DEFAULT NULL,
  `is_renew` tinyint(4) DEFAULT '0' COMMENT '0=old list,1=new list',
  `branch_id` int(11) DEFAULT '1',
  `loan_type` tinyint(4) DEFAULT '1' COMMENT '1=individule,2=group',
  `status` tinyint(4) DEFAULT '1' COMMENT '0 deactive ,1 active ,2 complated',
  `is_verify` tinyint(4) DEFAULT '0',
  `is_badloan` tinyint(4) DEFAULT '0',
  `teller_id` int(11) DEFAULT NULL,
  `is_reschedule` tinyint(4) DEFAULT '0' COMMENT '?????? reschedule ???? befor reschedul 1,2=after',
  `user_id` int(11) DEFAULT NULL,
  `for_loantype` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO ln_test_loan_group VALUES("1","1","4","1","1","2015-09-28","2017-10-28","2015-09-28","24","2015-10-28","10:00-11:00 AM","3","3","1","2","0","1","1","1","0","0","","0","","1");
INSERT INTO ln_test_loan_group VALUES("2","1","4","1","1","2015-09-28","2017-10-28","2015-09-28","24","2015-10-28","10:00-11:00 AM","3","3","6","2","0","1","1","1","0","0","","0","","1");



DROP TABLE ln_test_loan_member;

CREATE TABLE `ln_test_loan_member` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chart_id` int(11) DEFAULT NULL COMMENT 'from chart account 1',
  `group_id` int(11) DEFAULT NULL,
  `loan_number` varchar(20) DEFAULT NULL COMMENT 'first is branch then 5',
  `client_id` int(11) DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `currency_type` tinyint(4) DEFAULT NULL COMMENT '1=khmer ,2=dollar',
  `total_capital` float(15,2) DEFAULT NULL,
  `admin_fee` float(15,2) DEFAULT NULL,
  `other_fee` float(15,2) DEFAULT NULL,
  `collect_typeterm` tinyint(4) DEFAULT NULL,
  `interest_rate` float(10,2) NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  `branch_id` int(11) unsigned DEFAULT '1',
  `loan_cycle` tinyint(4) DEFAULT '0' COMMENT '1= is loan cycle,0 not loan cycle',
  `loan_purpose` text,
  `pay_before` varchar(30) DEFAULT '0' COMMENT '??????????????',
  `pay_after` varchar(30) DEFAULT '0' COMMENT '??????????????',
  `graice_period` int(11) DEFAULT '0',
  `amount_collect_principal` float(15,2) DEFAULT NULL,
  `show_barcode` tinyint(4) DEFAULT '0' COMMENT '1 show,0 not show',
  `is_completed` tinyint(4) DEFAULT '0' COMMENT '0 yet,1 complete,2=some fund',
  `semi` int(11) DEFAULT '1' COMMENT '?????????????????????? ?? ????????????????????????',
  `is_reschedule` tinyint(4) DEFAULT '0' COMMENT '?????? reschedule ???? befor reschedul 1,2=after',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO ln_test_loan_member VALUES("1","","1","PPL00002","4","1","2","3500.00","35.00","0.00","3","2.00","1","1","0","","0","2","0","1.00","0","0","0","0");
INSERT INTO ln_test_loan_member VALUES("2","","2","PPL00002","4","6","2","3500.00","35.00","0.00","3","2.00","1","1","0","","0","2","0","1.00","0","0","0","0");



DROP TABLE ln_test_loanmember_funddetail;

CREATE TABLE `ln_test_loanmember_funddetail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `total_principal` float(15,3) DEFAULT NULL,
  `principal_permonth` float(15,3) DEFAULT NULL,
  `total_interest` float(15,3) DEFAULT NULL,
  `total_payment` float(15,3) DEFAULT NULL,
  `amount_day` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `is_completed` tinyint(4) DEFAULT '0' COMMENT '0=not complete,1=complete,2=in progress',
  `is_approved` tinyint(4) DEFAULT '0' COMMENT '1=approved paycomplete,not yet',
  `date_payment` date DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `collect_by` int(11) DEFAULT '1' COMMENT '?????????????',
  `payment_option` tinyint(4) DEFAULT NULL COMMENT '1=normal,2=before,3=after',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

INSERT INTO ln_test_loanmember_funddetail VALUES("1","1","3500.000","145.830","70.000","215.830","30","1","0","0","2015-10-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("2","1","3354.170","145.830","69.320","215.150","31","1","0","0","2015-11-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("3","1","3208.340","145.830","64.170","210.000","30","1","0","0","2015-12-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("4","1","3062.510","145.830","63.290","209.120","31","1","0","0","2016-01-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("5","1","2916.680","145.830","60.280","206.110","31","1","0","0","2016-02-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("6","1","2770.850","145.830","53.570","199.400","29","1","0","0","2016-03-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("7","1","2625.020","145.830","54.250","200.080","31","1","0","0","2016-04-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("8","1","2479.190","145.830","49.580","195.410","30","1","0","0","2016-05-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("9","1","2333.360","145.830","48.220","194.050","31","1","0","0","2016-06-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("10","1","2187.530","145.830","43.750","189.580","30","1","0","0","2016-07-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("11","1","2041.700","145.830","42.200","188.030","31","1","0","0","2016-08-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("12","1","1895.870","145.830","39.180","185.010","31","1","0","0","2016-09-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("13","1","1750.040","145.830","35.000","180.830","30","1","0","0","2016-10-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("14","1","1604.210","145.830","33.150","178.980","31","1","0","0","2016-11-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("15","1","1458.380","145.830","29.170","175.000","30","1","0","0","2016-12-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("16","1","1312.550","145.830","27.130","172.960","31","1","0","0","2017-01-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("17","1","1166.720","145.830","24.110","169.940","31","1","0","0","2017-02-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("18","1","1020.890","145.830","19.060","164.890","28","1","0","0","2017-03-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("19","1","875.060","145.830","18.080","163.910","31","1","0","0","2017-04-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("20","1","729.230","145.830","14.580","160.410","30","1","0","0","2017-05-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("21","1","583.400","145.830","12.060","157.890","31","1","0","0","2017-06-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("22","1","437.570","145.830","8.750","154.580","30","1","0","0","2017-07-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("23","1","291.740","145.830","6.030","151.860","31","1","0","0","2017-08-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("24","1","145.910","145.910","3.020","148.930","31","1","0","0","2017-09-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("25","2","3500.000","115.860","119.140","235.000","30","1","0","0","2015-10-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("26","2","3384.140","99.810","115.190","215.000","31","1","0","0","2015-11-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("27","2","3284.330","103.200","111.800","215.000","30","1","0","0","2015-12-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("28","2","3181.130","106.720","108.280","215.000","31","1","0","0","2016-01-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("29","2","3074.410","110.350","104.650","215.000","31","1","0","0","2016-02-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("30","2","2964.060","114.110","100.890","215.000","29","1","0","0","2016-03-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("31","2","2849.950","117.990","97.010","215.000","31","1","0","0","2016-04-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("32","2","2731.960","122.010","92.990","215.000","30","1","0","0","2016-05-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("33","2","2609.950","126.160","88.840","215.000","31","1","0","0","2016-06-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("34","2","2483.790","130.450","84.550","215.000","30","1","0","0","2016-07-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("35","2","2353.340","134.890","80.110","215.000","31","1","0","0","2016-08-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("36","2","2218.450","139.490","75.510","215.000","31","1","0","0","2016-09-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("37","2","2078.960","144.230","70.770","215.000","30","1","0","0","2016-10-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("38","2","1934.730","149.140","65.860","215.000","31","1","0","0","2016-11-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("39","2","1785.590","154.220","60.780","215.000","30","1","0","0","2016-12-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("40","2","1631.370","159.470","55.530","215.000","31","1","0","0","2017-01-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("41","2","1471.900","164.900","50.100","215.000","31","1","0","0","2017-02-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("42","2","1307.000","170.510","44.490","215.000","28","1","0","0","2017-03-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("43","2","1136.490","176.310","38.690","215.000","31","1","0","0","2017-04-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("44","2","960.180","182.320","32.680","215.000","30","1","0","0","2017-05-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("45","2","777.860","188.520","26.480","215.000","31","1","0","0","2017-06-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("46","2","589.340","194.940","20.060","215.000","30","1","0","0","2017-07-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("47","2","394.400","201.570","13.430","215.000","31","1","0","0","2017-08-28","1","1","");
INSERT INTO ln_test_loanmember_funddetail VALUES("48","2","192.830","192.830","22.170","215.000","31","1","0","0","2017-09-28","1","1","");



DROP TABLE ln_theme_user;

CREATE TABLE `ln_theme_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(10) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO ln_theme_user VALUES("1","1","1");



DROP TABLE ln_tranfser_co;

CREATE TABLE `ln_tranfser_co` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `code_from` int(11) DEFAULT NULL COMMENT 'from co id',
  `code_to` int(11) DEFAULT NULL COMMENT 'to co id',
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '3 = transfer loan number',
  `date` date DEFAULT NULL,
  `note` text,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO ln_tranfser_co VALUES("1","2","","","1","2","","","1","1","2015-08-07","co to co , saron to dara","1");
INSERT INTO ln_tranfser_co VALUES("2","1","","","","9","2","","1","2","2015-08-07","client to co","1");
INSERT INTO ln_tranfser_co VALUES("3","8","","15","2","15","26","7","1","3","2015-08-10","transfer loan  PPL00007 to chomroen","1");



DROP TABLE ln_view;

CREATE TABLE `ln_view` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(50) DEFAULT NULL,
  `name_kh` varchar(50) DEFAULT NULL,
  `key_code` varchar(20) DEFAULT NULL,
  `displayby` tinyint(4) DEFAULT '1' COMMENT '1khmer',
  `type` int(11) DEFAULT NULL COMMENT '1=term',
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

INSERT INTO ln_view VALUES("1","Daily","??????????","1","1","1","1");
INSERT INTO ln_view VALUES("2","Weekly","?????????????","2","1","1","1");
INSERT INTO ln_view VALUES("3","Monthly","????????","3","1","1","1");
INSERT INTO ln_view VALUES("4","Yearly","???????????","4","1","1","1");
INSERT INTO ln_view VALUES("5","Before","???","1","1","2","1");
INSERT INTO ln_view VALUES("6","Normal","??????","3","1","2","1");
INSERT INTO ln_view VALUES("7","After","?????????","2","1","2","1");
INSERT INTO ln_view VALUES("8","Active","??????????","1","1","3","1");
INSERT INTO ln_view VALUES("10","Khmer","?????","1","1","4","1");
INSERT INTO ln_view VALUES("11","English","English","2","1","4","1");
INSERT INTO ln_view VALUES("12","Single","?????","1","1","5","1");
INSERT INTO ln_view VALUES("13","Married","?????????","2","1","5","1");
INSERT INTO ln_view VALUES("14","Windowed","??????","3","1","5","1");
INSERT INTO ln_view VALUES("15","Mindowed","???????","4","1","5","1");
INSERT INTO ln_view VALUES("16","National ID","National ID","3","1","6","1");
INSERT INTO ln_view VALUES("17","National ID","National ID","2","1","6","1");
INSERT INTO ln_view VALUES("18","dsfkasf","wdfs","3","1","6","1");
INSERT INTO ln_view VALUES("19","Other","asdfsa","4","1","6","");
INSERT INTO ln_view VALUES("23","Deactive","?????????????","0","1","3","1");
INSERT INTO ln_view VALUES("24","festival","?????????","1","1","7","1");
INSERT INTO ln_view VALUES("25","sickness","??","2","1","7","1");
INSERT INTO ln_view VALUES("26","Married","????????????","3","1","7","1");
INSERT INTO ln_view VALUES("27","Asset","Asset","1","1","8","1");
INSERT INTO ln_view VALUES("28","Liabilities","Liabilities","2","1","8","1");
INSERT INTO ln_view VALUES("29","Equities","Equities","3","1","8","1");
INSERT INTO ln_view VALUES("30","Incomes","Incomes","4","1","8","1");
INSERT INTO ln_view VALUES("32","Operation Account","Operation Account","1","2","10","1");
INSERT INTO ln_view VALUES("33","None Operation Account","None Operation Account","2","1","10","1");
INSERT INTO ln_view VALUES("34","???","???","1","1","12","1");
INSERT INTO ln_view VALUES("35","?????","?????","0","1","12","1");
INSERT INTO ln_view VALUES("36","go to province","????????","4","1","7","1");
INSERT INTO ln_view VALUES("37","Expense","Expense","5","1","8","1");
INSERT INTO ln_view VALUES("38","Moto Rental","????????????","1","1","9","1");
INSERT INTO ln_view VALUES("39","Petrol","Petrol","2","1","9","1");
INSERT INTO ln_view VALUES("40","Good cash Collection","Good cash Collection","3","1","9","1");
INSERT INTO ln_view VALUES("41","M","?????","1","1","11","1");
INSERT INTO ln_view VALUES("42","F","????","2","1","11","1");
INSERT INTO ln_view VALUES("43","motor","motor","1","1","13","1");
INSERT INTO ln_view VALUES("44","national ID","national ID","2","1","13","1");
INSERT INTO ln_view VALUES("45","Day","??????????","1","1","14","1");
INSERT INTO ln_view VALUES("46","Week","?????????????","2","1","14","1");
INSERT INTO ln_view VALUES("47","Month","????????","3","1","14","1");
INSERT INTO ln_view VALUES("48","KHR","???","1","1","15","1");
INSERT INTO ln_view VALUES("49","USD","??????","2","1","15","1");
INSERT INTO ln_view VALUES("50","THB","???","3","1","15","1");
INSERT INTO ln_view VALUES("51","Diploma","Diploma","1","1","20","1");
INSERT INTO ln_view VALUES("52","Associate","Associate","2","1","20","1");
INSERT INTO ln_view VALUES("53","Bechelor","Bechelor","3","1","20","1");
INSERT INTO ln_view VALUES("54","Master","Master","4","1","20","1");
INSERT INTO ln_view VALUES("55","PhD","PhD","5","1","20","1");
INSERT INTO ln_view VALUES("56","Personal","???????????","1","1","21","1");
INSERT INTO ln_view VALUES("57","Representer","?????????????","2","1","21","1");
INSERT INTO ln_view VALUES("58","Straight line","Straight line","1","1","16","1");
INSERT INTO ln_view VALUES("59","Double-declining banlance","Double-declining banlance","2","1","16","1");
INSERT INTO ln_view VALUES("60","Sum of the year","Sum of the year","3","1","16","1");
INSERT INTO ln_view VALUES("61","Long Term","Long Term","1","1","17","1");
INSERT INTO ln_view VALUES("62","Short Term","Short Term","2","1","17","1");
INSERT INTO ln_view VALUES("63","Cash","Cash","1","1","19","1");
INSERT INTO ln_view VALUES("64","Cradit","Cradit","2","1","19","1");
INSERT INTO ln_view VALUES("65","Other","Other","3","1","19","1");
INSERT INTO ln_view VALUES("66","Black List","Black List","1","1","22","1");
INSERT INTO ln_view VALUES("67","Other","Other","5","1","5","1");
INSERT INTO ln_view VALUES("68","National Identity","?????????????","1","1","23","1");
INSERT INTO ln_view VALUES("69","Family Book","????????????","2","1","23","1");
INSERT INTO ln_view VALUES("70","Certificate Of Birth","????????????","3","1","23","1");
INSERT INTO ln_view VALUES("71","Certificate Of ...","??????????????????","4","1","23","1");
INSERT INTO ln_view VALUES("72","Passport","????????????","5","1","23","1");
INSERT INTO ln_view VALUES("73","Other Loan","???????????","1","1","24","1");
INSERT INTO ln_view VALUES("74","Vehicle Loan","??????????????","2","1","24","1");
INSERT INTO ln_view VALUES("75","Personal Loan","????????????????","3","1","24","1");
INSERT INTO ln_view VALUES("76","Commercial Loan","??????????????????????","4","1","24","1");
INSERT INTO ln_view VALUES("77","Student Loan","?????????????????","5","1","24","1");
INSERT INTO ln_view VALUES("78","Housing Loan","????????????","5","1","24","1");
INSERT INTO ln_view VALUES("79","Marreid Loan","?????????????????","6","1","24","1");
INSERT INTO ln_view VALUES("80","Loan Testing","Loan Testing","7","1","24","1");
INSERT INTO ln_view VALUES("81","New Schedule","???????????????","1","1","25","1");
INSERT INTO ln_view VALUES("82","Overide Schedule","????????????????????","2","1","25","1");
INSERT INTO ln_view VALUES("83","sok","sok","8","1","24","1");
INSERT INTO ln_view VALUES("84","other","other1","6","1","23","1");
INSERT INTO ln_view VALUES("85","sok","sok1","7","1","23","1");
INSERT INTO ln_view VALUES("86","Other","??????","3","1","11","1");
INSERT INTO ln_view VALUES("87","testing","testing","8","1","23","1");
INSERT INTO ln_view VALUES("88","testing","testing","9","1","23","1");
INSERT INTO ln_view VALUES("93","vv","vv","10","1","23","1");
INSERT INTO ln_view VALUES("98","Standard","Standard","1","1","26","1");
INSERT INTO ln_view VALUES("99","Special Mention","Special Mention","2","1","26","1");
INSERT INTO ln_view VALUES("100","Substandard","Substandard","3","1","26","1");
INSERT INTO ln_view VALUES("101","Doubtful","Doubtful","4","1","26","1");
INSERT INTO ln_view VALUES("102","Loan Loss","Loan Loss","5","1","26","1");
INSERT INTO ln_view VALUES("103","Business Loan","Business Loan","9","1","24","1");
INSERT INTO ln_view VALUES("104","testing","testingnig","10","1","24","1");
INSERT INTO ln_view VALUES("105","ass","ass","10","1","24","1");



DROP TABLE ln_view_type;

CREATE TABLE `ln_view_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

INSERT INTO ln_view_type VALUES("1","Depreciation Term","1");
INSERT INTO ln_view_type VALUES("2","Holiday Status","1");
INSERT INTO ln_view_type VALUES("3","Using Status","1");
INSERT INTO ln_view_type VALUES("4","Languege","1");
INSERT INTO ln_view_type VALUES("5","Situation Status","1");
INSERT INTO ln_view_type VALUES("6","Oher","1");
INSERT INTO ln_view_type VALUES("7","Permission Type","1");
INSERT INTO ln_view_type VALUES("8","Parents Account","1");
INSERT INTO ln_view_type VALUES("9","Salary Type","1");
INSERT INTO ln_view_type VALUES("10","Account Type","1");
INSERT INTO ln_view_type VALUES("11","Gender","1");
INSERT INTO ln_view_type VALUES("12","Loan Type","1");
INSERT INTO ln_view_type VALUES("13","unknow","1");
INSERT INTO ln_view_type VALUES("14","Term Install","1");
INSERT INTO ln_view_type VALUES("15","Currency Type","1");
INSERT INTO ln_view_type VALUES("16","Depreciation Method","1");
INSERT INTO ln_view_type VALUES("17","Depreciation Type","1");
INSERT INTO ln_view_type VALUES("18","Unknow","1");
INSERT INTO ln_view_type VALUES("19","Payment Type","1");
INSERT INTO ln_view_type VALUES("20","Degree Type","1");
INSERT INTO ln_view_type VALUES("21","Owner Type","1");
INSERT INTO ln_view_type VALUES("22","Black List","1");
INSERT INTO ln_view_type VALUES("23","Document Type","1");
INSERT INTO ln_view_type VALUES("24","Loan Type","1");



DROP TABLE ln_village;

CREATE TABLE `ln_village` (
  `vill_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `commune_id` tinyint(10) DEFAULT NULL,
  `village_name` varchar(60) DEFAULT NULL,
  `village_namekh` varbinary(60) DEFAULT NULL,
  `displayby` tinyint(4) DEFAULT NULL,
  `modify_date` varchar(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`vill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

INSERT INTO ln_village VALUES("1","1","Krang Trolat","ក្រាំងត្រឡាត់","1","Nov 2, 2014 12:00:31 AM","1","1");
INSERT INTO ln_village VALUES("2","1","Dom nak om pel","ក្រាំងត្រឡាត់","1","Jun 5, 2014 6:37:02 AM","1","1");
INSERT INTO ln_village VALUES("3","1","Lvea Chek","ក្រាំងត្រឡាត់","2","Jun 5, 2014 6:38:14 AM","1","1");
INSERT INTO ln_village VALUES("4","1","Tro sok pherm","ក្រាំងត្រឡាត់","1","Jun 5, 2014 6:37:43 AM","1","1");
INSERT INTO ln_village VALUES("5","1","ssss222","ក្រាំងត្រឡាត់","1","Nov 1, 2014 1:26:52 AM","1","1");
INSERT INTO ln_village VALUES("6","1","www","ក្រាំងត្រឡាត់","2","Nov 1, 2014 1:26:59 AM","1","1");
INSERT INTO ln_village VALUES("7","1","Prey kabas","ក្រាំងត្រឡាត់","2","Nov 1, 2014 11:58:14 PM","1","1");
INSERT INTO ln_village VALUES("8","1","Prey New","ក្រាំងត្រឡាត់","2","Nov 2, 2014 12:00:01 AM","1","1");
INSERT INTO ln_village VALUES("9","3","Prey Port","ក្រាំងត្រឡាត់","","Nov 13, 2014 1:48:28 AM","1","1");
INSERT INTO ln_village VALUES("10","2","Krang trolat","ក្រាំងត្រឡាត់","2","Nov 15, 2014 11:30:56 PM","1","1");
INSERT INTO ln_village VALUES("11","4","Tes eng","TESting","1","Apr 7, 2015 11:23:14 AM","1","1");
INSERT INTO ln_village VALUES("12","1","so c","sok","1","May 30, 2015 9:59:06 AM","1","1");
INSERT INTO ln_village VALUES("13","1","so c","sok","1","May 30, 2015 9:59:09 AM","1","1");
INSERT INTO ln_village VALUES("14","1","sadlkfasdf","sok","1","May 30, 2015 10:00:33 AM","1","1");
INSERT INTO ln_village VALUES("15","1","sov","sok","1","May 30, 2015 10:13:02 AM","1","1");
INSERT INTO ln_village VALUES("16","1","sss","testing","1","May 30, 2015 10:13:50 AM","1","1");
INSERT INTO ln_village VALUES("17","1","asdfas","ddf","1","May 30, 2015 10:37:02 AM","1","1");



DROP TABLE ln_xchange;

CREATE TABLE `ln_xchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changedAmount` double DEFAULT NULL,
  `fromAmount` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `recieptNo` varchar(20) DEFAULT NULL,
  `recievedAmount` double DEFAULT NULL,
  `status_in` varchar(5) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  `toAmount` double DEFAULT NULL,
  `toAmountType` varchar(1) DEFAULT NULL,
  `fromAmountType` varchar(1) DEFAULT NULL,
  `from_to` varchar(20) DEFAULT NULL,
  `recievedType` varchar(1) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `specail_customer` tinyint(1) DEFAULT '0' COMMENT '0: normal, 1 : specail customer set new rate',
  `status` tinyint(4) DEFAULT '1',
  `branch_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO ln_xchange VALUES("1","0","200","32.9","W15-05-22/301a843","200","in","2015-07-12 22:40:05","6580","B","$","Dollar - Bath","$","1","0","1","","");
INSERT INTO ln_xchange VALUES("2","0","10","3990","W15-05-29/44e00c8","10","in","2015-05-29 20:48:34","39900","R","$","Dollar - Riel","$","1","0","1","","");
INSERT INTO ln_xchange VALUES("3","100","100","3990","W15-05-29/1644556","200","in","2015-05-29 22:25:33","399000","R","$","Dollar - Riel","$","1","0","1","","");
INSERT INTO ln_xchange VALUES("4","5","10","3990","W15-05-29/5685f43","15","in","2015-05-29 22:30:10","39900","R","$","Dollar - Riel","$","1","0","1","","");
INSERT INTO ln_xchange VALUES("5","0","100","3990","W15-06-23/2233558","100","in","2015-06-23 18:25:00","399000","R","$","Dollar - Riel","$","1","0","1","","");
INSERT INTO ln_xchange VALUES("6","0","1000","32.9","W15-07-10/34559f7","1000","in","2015-07-10 17:04:25","32900","B","$","Dollar - Bath","$","1","0","1","","");
INSERT INTO ln_xchange VALUES("7","0","1000","3990","W15-08-10/003d155","1000","in","2015-08-10 17:35:38","3990000","R","$","Dollar - Riel","$","1","0","1","","");



DROP TABLE ln_zone;

CREATE TABLE `ln_zone` (
  `zone_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(40) NOT NULL,
  `zone_num` varchar(60) NOT NULL,
  `modify_date` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

INSERT INTO ln_zone VALUES("1","zone 11211","001","2014-10-26","1","1");
INSERT INTO ln_zone VALUES("2","zone 2","002","2014-11-22","1","1");
INSERT INTO ln_zone VALUES("3","zone 5","003","0000-00-00","1","1");
INSERT INTO ln_zone VALUES("4","zone 5","004","0000-00-00","1","1");
INSERT INTO ln_zone VALUES("5","zone 22","222","2014-10-31","1","1");
INSERT INTO ln_zone VALUES("6","zone 13","13","2014-10-31","1","1");
INSERT INTO ln_zone VALUES("7","sdfsadf","222","2014-10-31","1","1");
INSERT INTO ln_zone VALUES("8","dakc","222","2014-10-31","1","1");
INSERT INTO ln_zone VALUES("9","WDFSADF","","2014-10-31","1","1");
INSERT INTO ln_zone VALUES("10","addd","","2014-11-01","1","1");
INSERT INTO ln_zone VALUES("11","vvvvv","vvvvv","2015-01-07","1","1");
INSERT INTO ln_zone VALUES("12","soksss","B0012","2015-05-01","0","0");
INSERT INTO ln_zone VALUES("13","kljl;","lkjklj","2015-06-25","1","1");
INSERT INTO ln_zone VALUES("14","sok","sok","2015-06-25","1","1");
INSERT INTO ln_zone VALUES("15","samnang","somnang","2015-06-25","1","1");
INSERT INTO ln_zone VALUES("16","jea","jeas","2015-06-25","1","1");
INSERT INTO ln_zone VALUES("17","","","2015-06-26","1","1");
INSERT INTO ln_zone VALUES("18","","","2015-06-26","1","1");
INSERT INTO ln_zone VALUES("19","","","2015-06-26","1","1");
INSERT INTO ln_zone VALUES("20","Prey Kombas","Prey KOmbas","2015-06-26","1","1");
INSERT INTO ln_zone VALUES("21","????? 1","Z001","2015-08-10","1","1");



DROP TABLE rms_acl_acl;

CREATE TABLE `rms_acl_acl` (
  `acl_id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(50) NOT NULL,
  `controller` varchar(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1: display in menu; 0: disable from menu',
  `rank` int(11) DEFAULT NULL COMMENT 'rank to show in submenu',
  `label` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`acl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

INSERT INTO rms_acl_acl VALUES("1","rsvAcl","index","index","1","","view list");
INSERT INTO rms_acl_acl VALUES("2","rsvAcl","index","add","1","","add url");
INSERT INTO rms_acl_acl VALUES("3","rsvAcl","index","edit","1","","edit url");
INSERT INTO rms_acl_acl VALUES("4","rsvAcl","user","index","1","","view user");
INSERT INTO rms_acl_acl VALUES("5","rsvAcl","user","add","1","","add user");
INSERT INTO rms_acl_acl VALUES("6","rsvAcl","user","add","1","","add user");
INSERT INTO rms_acl_acl VALUES("7","rsvAcl","useraccess","index","1","","view user access");
INSERT INTO rms_acl_acl VALUES("8","rsvAcl","useraccess","add","1","","add user access");
INSERT INTO rms_acl_acl VALUES("9","rsvAcl","usertype","index","1","","view user type");
INSERT INTO rms_acl_acl VALUES("10","rsvAcl","usertype","add","1","","add user type");
INSERT INTO rms_acl_acl VALUES("11","rsvAcl","usertype","edit","1","","edit user type");
INSERT INTO rms_acl_acl VALUES("12","other","branch","index","1","","view branch");
INSERT INTO rms_acl_acl VALUES("13","other","branch","add","1","","add branch");
INSERT INTO rms_acl_acl VALUES("14","other","branch","edit","1","","edit branch");
INSERT INTO rms_acl_acl VALUES("15","other","province","index","1","","view province");
INSERT INTO rms_acl_acl VALUES("16","other","province","add","1","","add province");
INSERT INTO rms_acl_acl VALUES("17","other","province","edit","1","","edit province");
INSERT INTO rms_acl_acl VALUES("18","other","district","index","1","","view district");
INSERT INTO rms_acl_acl VALUES("19","other","district","add","1","","add district");
INSERT INTO rms_acl_acl VALUES("20","other","district","edit","1","","edit district");
INSERT INTO rms_acl_acl VALUES("21","other","commune","index","1","","view commune");
INSERT INTO rms_acl_acl VALUES("22","other","commune","add","1","","add commune");
INSERT INTO rms_acl_acl VALUES("23","other","commune","edit commune","1","","edit commune");
INSERT INTO rms_acl_acl VALUES("24","other","village","index","1","","view village");
INSERT INTO rms_acl_acl VALUES("25","other","village","add","1","","add village");
INSERT INTO rms_acl_acl VALUES("26","other","village","edit","1","","edit village");
INSERT INTO rms_acl_acl VALUES("27","other","zone","index","1","","view zoon");
INSERT INTO rms_acl_acl VALUES("28","other","zone","add","1","","add zone");
INSERT INTO rms_acl_acl VALUES("29","other","zone","add","1","","edit zone");
INSERT INTO rms_acl_acl VALUES("30","other","holiday","index","1","","view holiday");
INSERT INTO rms_acl_acl VALUES("31","other","holiday","add","1","","add holiday");
INSERT INTO rms_acl_acl VALUES("32","other","holiday","edit","1","","edit holiday");
INSERT INTO rms_acl_acl VALUES("33","other","callecteralltype","index","1","","view collateralltype");
INSERT INTO rms_acl_acl VALUES("34","other","callecteralltype","add","1","","add Collateral type");
INSERT INTO rms_acl_acl VALUES("35","other","callecteralltype","edit","1","","edit collateral type");
INSERT INTO rms_acl_acl VALUES("36","group","index","index","1","","view client");
INSERT INTO rms_acl_acl VALUES("37","group","index","add","1","","add client");
INSERT INTO rms_acl_acl VALUES("38","group","index","edit","1","","edit client");
INSERT INTO rms_acl_acl VALUES("39","group","callteral","index","1","","view client collater");
INSERT INTO rms_acl_acl VALUES("40","group","callteral","add","1","","add client collatera");
INSERT INTO rms_acl_acl VALUES("41","group","callteral","edit","1","","edit client collater");
INSERT INTO rms_acl_acl VALUES("42","group","changecollteral","index","1","","view change colltera");
INSERT INTO rms_acl_acl VALUES("43","group","changecollteral","add","1","","add change collteral");
INSERT INTO rms_acl_acl VALUES("44","group","changecollteral","edit","1","","edit change colltera");
INSERT INTO rms_acl_acl VALUES("45","group","returncollteral","index","1","","view return collater");
INSERT INTO rms_acl_acl VALUES("46","group","returncollteral","add","1","","add Return collteral");
INSERT INTO rms_acl_acl VALUES("47","group","returncollteral","edit","1","","edit Return colltera");
INSERT INTO rms_acl_acl VALUES("48","group","clientblacklist","index","1","","view client blacklis");
INSERT INTO rms_acl_acl VALUES("49","group","clientblacklist","add","1","","add client blacklist");
INSERT INTO rms_acl_acl VALUES("50","group","clientblacklist","edit","1","","edit Client blacklis");
INSERT INTO rms_acl_acl VALUES("51","group","index","view","1","","view client detail");
INSERT INTO rms_acl_acl VALUES("52","loan","index","index","1","","view loan list");
INSERT INTO rms_acl_acl VALUES("53","loan","index","add","1","","add loan IL");
INSERT INTO rms_acl_acl VALUES("54","loan","index","edit","1","","edit loan IL");
INSERT INTO rms_acl_acl VALUES("55","loan","index","view","1","","view detail loan IL");
INSERT INTO rms_acl_acl VALUES("56","loan","groupdisburse","index","1","","view droup disburse");
INSERT INTO rms_acl_acl VALUES("57","groupdisburse","index","add","1","","add group disburse");
INSERT INTO rms_acl_acl VALUES("58","loan","groupdisburse","edit","1","","edit group disburse");
INSERT INTO rms_acl_acl VALUES("59","groupDisburse","index","index","1","","view detail group di");
INSERT INTO rms_acl_acl VALUES("60","loan","ilpayment","index","1","","view IL paymennt");
INSERT INTO rms_acl_acl VALUES("61","loan","ilpayment","add","1","","add Il payment");
INSERT INTO rms_acl_acl VALUES("62","loan","ilpayment","edit","1","","edit Il payment");
INSERT INTO rms_acl_acl VALUES("63","laon","ilpayment","view","1","","view detail IL payme");
INSERT INTO rms_acl_acl VALUES("64","loan","grouppayment","index","1","","view group payment");
INSERT INTO rms_acl_acl VALUES("65","loan","grouppayment","add","1","","add group payment");
INSERT INTO rms_acl_acl VALUES("66","loan","grouppayment","edit","1","","edit group payment");
INSERT INTO rms_acl_acl VALUES("67","loan","repaymentschedule","index","1","","view repayment sched");
INSERT INTO rms_acl_acl VALUES("68","loan","repaymentschedule","add","1","","add repayment schedu");
INSERT INTO rms_acl_acl VALUES("69","loan","repaymentschedule","edit","1","","edit repayment sched");
INSERT INTO rms_acl_acl VALUES("70","loan","badloan","index","1","","view bad loan");
INSERT INTO rms_acl_acl VALUES("71","loan","badloan","add","1","","add bad loan");
INSERT INTO rms_acl_acl VALUES("72","loan","badloan","edit","1","","edit bad loan");
INSERT INTO rms_acl_acl VALUES("73","loan","transferco","index","1","","view transferco");
INSERT INTO rms_acl_acl VALUES("74","loan","transferco","add","1","","add transferco");
INSERT INTO rms_acl_acl VALUES("75","loan","transferco","edit","1","","edit transferco");
INSERT INTO rms_acl_acl VALUES("76","loan","transferco-client","index","1","","view transferco-clie");
INSERT INTO rms_acl_acl VALUES("77","loan","transferco-client","edit","1","","edit transferco-clie");
INSERT INTO rms_acl_acl VALUES("78","loan","transferco-client","add","1","","add transferco-clien");
INSERT INTO rms_acl_acl VALUES("79","loan","transferco-loand","index","1","","view transferco-loan");
INSERT INTO rms_acl_acl VALUES("80","loan","transferco-loand","add","1","","add transferco-loand");
INSERT INTO rms_acl_acl VALUES("81","loan","transferco-loand","edit","1","","edit transferco-loan");
INSERT INTO rms_acl_acl VALUES("82","tellerandexchange","index","index","1","","teller");
INSERT INTO rms_acl_acl VALUES("83","report","index","index","1","","report");
INSERT INTO rms_acl_acl VALUES("84","setting","index","index","1","","setting");
INSERT INTO rms_acl_acl VALUES("85","backup","index","index","1","","backup");
INSERT INTO rms_acl_acl VALUES("86","home","index","index","1","","dashboard");
INSERT INTO rms_acl_acl VALUES("87","accounting","index","index","1","","accounting");
INSERT INTO rms_acl_acl VALUES("88","other","index","index","1","","paramater module");
INSERT INTO rms_acl_acl VALUES("89","other","loantype","index","1","","loan type");
INSERT INTO rms_acl_acl VALUES("90","other","loantype","edit","1","","edit loan type");
INSERT INTO rms_acl_acl VALUES("91","other","loantype","add","1","","add loan type");



DROP TABLE rms_acl_user_access;

CREATE TABLE `rms_acl_user_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL COMMENT 'user for access permission',
  PRIMARY KEY (`id`),
  KEY `user_type_id` (`user_type_id`),
  KEY `acl_id` (`acl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8;

INSERT INTO rms_acl_user_access VALUES("7","5","1","1","");
INSERT INTO rms_acl_user_access VALUES("8","6","1","1","");
INSERT INTO rms_acl_user_access VALUES("9","7","1","1","");
INSERT INTO rms_acl_user_access VALUES("10","8","1","1","");
INSERT INTO rms_acl_user_access VALUES("11","9","1","1","");
INSERT INTO rms_acl_user_access VALUES("12","10","1","1","");
INSERT INTO rms_acl_user_access VALUES("13","11","1","1","");
INSERT INTO rms_acl_user_access VALUES("14","12","1","1","");
INSERT INTO rms_acl_user_access VALUES("15","13","1","1","");
INSERT INTO rms_acl_user_access VALUES("16","14","1","1","");
INSERT INTO rms_acl_user_access VALUES("17","15","1","1","");
INSERT INTO rms_acl_user_access VALUES("18","16","1","1","");
INSERT INTO rms_acl_user_access VALUES("19","17","1","1","");
INSERT INTO rms_acl_user_access VALUES("23","21","1","1","");
INSERT INTO rms_acl_user_access VALUES("24","22","1","1","");
INSERT INTO rms_acl_user_access VALUES("25","23","1","1","");
INSERT INTO rms_acl_user_access VALUES("26","24","1","1","");
INSERT INTO rms_acl_user_access VALUES("27","10","2","1","");
INSERT INTO rms_acl_user_access VALUES("28","11","2","1","");
INSERT INTO rms_acl_user_access VALUES("29","12","2","1","");
INSERT INTO rms_acl_user_access VALUES("30","13","2","1","");
INSERT INTO rms_acl_user_access VALUES("31","14","2","1","");
INSERT INTO rms_acl_user_access VALUES("32","15","2","1","");
INSERT INTO rms_acl_user_access VALUES("33","19","2","1","");
INSERT INTO rms_acl_user_access VALUES("34","20","2","1","");
INSERT INTO rms_acl_user_access VALUES("35","21","2","1","");
INSERT INTO rms_acl_user_access VALUES("36","22","2","1","");
INSERT INTO rms_acl_user_access VALUES("37","23","2","1","");
INSERT INTO rms_acl_user_access VALUES("38","24","2","1","");
INSERT INTO rms_acl_user_access VALUES("39","19","3","1","");
INSERT INTO rms_acl_user_access VALUES("40","20","3","1","");
INSERT INTO rms_acl_user_access VALUES("41","21","3","1","");
INSERT INTO rms_acl_user_access VALUES("42","25","1","1","");
INSERT INTO rms_acl_user_access VALUES("43","26","1","1","");
INSERT INTO rms_acl_user_access VALUES("44","27","1","1","");
INSERT INTO rms_acl_user_access VALUES("45","28","1","1","");
INSERT INTO rms_acl_user_access VALUES("46","29","1","1","");
INSERT INTO rms_acl_user_access VALUES("47","25","2","1","");
INSERT INTO rms_acl_user_access VALUES("48","26","2","1","");
INSERT INTO rms_acl_user_access VALUES("49","27","2","1","");
INSERT INTO rms_acl_user_access VALUES("50","28","2","1","");
INSERT INTO rms_acl_user_access VALUES("51","29","2","1","");
INSERT INTO rms_acl_user_access VALUES("52","25","4","1","");
INSERT INTO rms_acl_user_access VALUES("53","26","4","1","");
INSERT INTO rms_acl_user_access VALUES("54","27","4","1","");
INSERT INTO rms_acl_user_access VALUES("55","28","5","1","");
INSERT INTO rms_acl_user_access VALUES("56","25","5","1","");
INSERT INTO rms_acl_user_access VALUES("57","29","4","1","");
INSERT INTO rms_acl_user_access VALUES("58","30","1","1","");
INSERT INTO rms_acl_user_access VALUES("59","31","1","1","");
INSERT INTO rms_acl_user_access VALUES("60","32","1","1","");
INSERT INTO rms_acl_user_access VALUES("61","33","1","1","");
INSERT INTO rms_acl_user_access VALUES("62","33","2","1","");
INSERT INTO rms_acl_user_access VALUES("63","32","2","1","");
INSERT INTO rms_acl_user_access VALUES("64","31","2","1","");
INSERT INTO rms_acl_user_access VALUES("65","30","2","1","");
INSERT INTO rms_acl_user_access VALUES("66","22","3","1","");
INSERT INTO rms_acl_user_access VALUES("67","23","3","1","");
INSERT INTO rms_acl_user_access VALUES("68","31","3","1","");
INSERT INTO rms_acl_user_access VALUES("69","24","3","1","");
INSERT INTO rms_acl_user_access VALUES("70","33","3","1","");
INSERT INTO rms_acl_user_access VALUES("71","32","4","1","");
INSERT INTO rms_acl_user_access VALUES("72","30","4","1","");
INSERT INTO rms_acl_user_access VALUES("73","37","1","1","");
INSERT INTO rms_acl_user_access VALUES("74","38","1","1","");
INSERT INTO rms_acl_user_access VALUES("75","18","1","1","");
INSERT INTO rms_acl_user_access VALUES("76","18","1","1","");
INSERT INTO rms_acl_user_access VALUES("77","18","1","1","");
INSERT INTO rms_acl_user_access VALUES("78","18","1","1","");
INSERT INTO rms_acl_user_access VALUES("79","18","1","1","");
INSERT INTO rms_acl_user_access VALUES("80","18","1","1","");
INSERT INTO rms_acl_user_access VALUES("81","19","1","1","");
INSERT INTO rms_acl_user_access VALUES("82","19","1","1","");
INSERT INTO rms_acl_user_access VALUES("112","4","1","1","");
INSERT INTO rms_acl_user_access VALUES("114","3","1","1","");
INSERT INTO rms_acl_user_access VALUES("115","2","1","1","");
INSERT INTO rms_acl_user_access VALUES("138","59","1","1","");
INSERT INTO rms_acl_user_access VALUES("140","57","1","1","");
INSERT INTO rms_acl_user_access VALUES("147","50","1","1","");
INSERT INTO rms_acl_user_access VALUES("148","49","1","1","");
INSERT INTO rms_acl_user_access VALUES("149","48","1","1","");
INSERT INTO rms_acl_user_access VALUES("150","47","1","1","");
INSERT INTO rms_acl_user_access VALUES("151","46","1","1","");
INSERT INTO rms_acl_user_access VALUES("152","45","1","1","");
INSERT INTO rms_acl_user_access VALUES("153","44","1","1","");
INSERT INTO rms_acl_user_access VALUES("154","43","1","1","");
INSERT INTO rms_acl_user_access VALUES("155","42","1","1","");
INSERT INTO rms_acl_user_access VALUES("159","36","1","1","");
INSERT INTO rms_acl_user_access VALUES("160","35","1","1","");
INSERT INTO rms_acl_user_access VALUES("161","34","1","1","");
INSERT INTO rms_acl_user_access VALUES("162","20","1","1","");
INSERT INTO rms_acl_user_access VALUES("167","86","1","1","");
INSERT INTO rms_acl_user_access VALUES("169","87","1","1","");
INSERT INTO rms_acl_user_access VALUES("170","82","1","1","");
INSERT INTO rms_acl_user_access VALUES("171","85","1","1","");
INSERT INTO rms_acl_user_access VALUES("172","83","1","1","");
INSERT INTO rms_acl_user_access VALUES("173","84","1","1","");
INSERT INTO rms_acl_user_access VALUES("175","53","1","1","");
INSERT INTO rms_acl_user_access VALUES("176","54","1","1","");
INSERT INTO rms_acl_user_access VALUES("177","55","1","1","");
INSERT INTO rms_acl_user_access VALUES("178","56","1","1","");
INSERT INTO rms_acl_user_access VALUES("179","58","1","1","");
INSERT INTO rms_acl_user_access VALUES("180","60","1","1","");
INSERT INTO rms_acl_user_access VALUES("181","61","1","1","");
INSERT INTO rms_acl_user_access VALUES("182","62","1","1","");
INSERT INTO rms_acl_user_access VALUES("183","64","1","1","");
INSERT INTO rms_acl_user_access VALUES("184","81","1","1","");
INSERT INTO rms_acl_user_access VALUES("185","80","1","1","");
INSERT INTO rms_acl_user_access VALUES("186","78","1","1","");
INSERT INTO rms_acl_user_access VALUES("187","79","1","1","");
INSERT INTO rms_acl_user_access VALUES("188","77","1","1","");
INSERT INTO rms_acl_user_access VALUES("189","76","1","1","");
INSERT INTO rms_acl_user_access VALUES("190","75","1","1","");
INSERT INTO rms_acl_user_access VALUES("191","74","1","1","");
INSERT INTO rms_acl_user_access VALUES("192","73","1","1","");
INSERT INTO rms_acl_user_access VALUES("193","72","1","1","");
INSERT INTO rms_acl_user_access VALUES("194","71","1","1","");
INSERT INTO rms_acl_user_access VALUES("195","70","1","1","");
INSERT INTO rms_acl_user_access VALUES("196","69","1","1","");
INSERT INTO rms_acl_user_access VALUES("197","68","1","1","");
INSERT INTO rms_acl_user_access VALUES("198","65","1","1","");
INSERT INTO rms_acl_user_access VALUES("199","66","1","1","");
INSERT INTO rms_acl_user_access VALUES("200","67","1","1","");
INSERT INTO rms_acl_user_access VALUES("201","88","1","1","");
INSERT INTO rms_acl_user_access VALUES("202","40","1","1","");
INSERT INTO rms_acl_user_access VALUES("203","41","1","1","");
INSERT INTO rms_acl_user_access VALUES("204","39","1","1","");
INSERT INTO rms_acl_user_access VALUES("205","63","1","1","");
INSERT INTO rms_acl_user_access VALUES("206","52","1","1","");
INSERT INTO rms_acl_user_access VALUES("207","51","1","1","");
INSERT INTO rms_acl_user_access VALUES("208","89","1","1","");
INSERT INTO rms_acl_user_access VALUES("209","90","1","1","");
INSERT INTO rms_acl_user_access VALUES("210","91","1","1","");
INSERT INTO rms_acl_user_access VALUES("211","1","1","1","");



DROP TABLE rms_acl_user_type;

CREATE TABLE `rms_acl_user_type` (
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(50) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_type_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO rms_acl_user_type VALUES("1","Director","0","1");
INSERT INTO rms_acl_user_type VALUES("2","Administrator","1","1");
INSERT INTO rms_acl_user_type VALUES("3","Credit Officer","2","1");



DROP TABLE rms_hold;

CREATE TABLE `rms_hold` (
  `hold_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NOT NULL,
  `reason` text NOT NULL,
  PRIMARY KEY (`hold_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE rms_rate;

CREATE TABLE `rms_rate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate_type` tinyint(4) DEFAULT NULL,
  `rate` float unsigned DEFAULT NULL,
  `modify_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO rms_rate VALUES("1","1","4100","","");



DROP TABLE rms_setting;

CREATE TABLE `rms_setting` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyName` varchar(450) DEFAULT NULL,
  `keyValue` varchar(4500) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `access_type` int(11) NOT NULL DEFAULT '1' COMMENT '1=access all,2=foundation access,3=accounting access,4=no access',
  `status` tinyint(4) DEFAULT '1' COMMENT '1,use ,0 not use ,2 not access',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

INSERT INTO rms_setting VALUES("0","label_animation","??????? ?????????? ??????? ??????? : ????????????? ??????????? ?????????????????????????????","1","0","1");
INSERT INTO rms_setting VALUES("1","sms-warnning-kh","???????????????????????????????????????????","1","0","1");
INSERT INTO rms_setting VALUES("2","system_name","????????????????? ???????????","1","1","1");
INSERT INTO rms_setting VALUES("3","client_company_name","Credit For Cambodian People","1","1","1");
INSERT INTO rms_setting VALUES("4","power_by","VSS Consultancy","1","1","1");
INSERT INTO rms_setting VALUES("6","branch-tel","Tel :(855) 10 78 55 44","1","1","1");
INSERT INTO rms_setting VALUES("7","branch_email","Email : info@vssservice.com","1","1","1");
INSERT INTO rms_setting VALUES("8","branch_add","??????? ??? ???????? ??? ??????? ????????? ?????? ???????","1","1","1");
INSERT INTO rms_setting VALUES("10","logo-path-name","images/loan-animation.gif","1","1","1");
INSERT INTO rms_setting VALUES("11","website","www.vssservice.com","1","1","1");
INSERT INTO rms_setting VALUES("12","branch-add-client","??????? ????????189(?) ?????????????????????????????????????","1","1","1");
INSERT INTO rms_setting VALUES("13","tel-client","Tel :? 092 515 555?? / 012 438 283","1","1","1");
INSERT INTO rms_setting VALUES("21","footer_branch","# 15,St 528 ,Boeung Kak I,Toul Kork ,Phnom Penh/# 47,St 173 ,Toul Svay Prey I,Chamkarmorn,Phnom Penh./#171-173,Pheah Ang Eng Street,Kampong Cham Town.","1","1","1");
INSERT INTO rms_setting VALUES("22","foot_phone","Phone:(855)23 998 233/Phone:(855)23 220 093/Phone:(855)42 942 024","1","1","1");
INSERT INTO rms_setting VALUES("23","f_email_website","Fax:(855)23 990n699/E-mail :info_wu@/Website western.edu.kh","1","1","1");
INSERT INTO rms_setting VALUES("25","reciept_kh","???????????????????","1","0","1");
INSERT INTO rms_setting VALUES("29","exchange_ratetitle","?????????????????????","0","0","1");
INSERT INTO rms_setting VALUES("30","exchange_reciept","?????????????????????","0","0","1");
INSERT INTO rms_setting VALUES("31","brand_title","??????? ?????????? ??????? ???????","0","1","1");
INSERT INTO rms_setting VALUES("34","comment","????????????????????????????????? ??????????????????","0","0","1");
INSERT INTO rms_setting VALUES("36","rpt-transfer-title-eng","Tel 010 78 55 44","0","1","1");
INSERT INTO rms_setting VALUES("38","brand_zone","?????????????????","0","0","1");
INSERT INTO rms_setting VALUES("39","brand_Staff","?????????????????","0","0","1");
INSERT INTO rms_setting VALUES("40","brand_client","Client","0","0","1");
INSERT INTO rms_setting VALUES("42","Report Agreement","Report Agreement","0","0","1");
INSERT INTO rms_setting VALUES("43","brand_adress","??????? ??? ???????? ??? ??????? ????????? ?????? ???????","0","1","1");
INSERT INTO rms_setting VALUES("44","phone_brand","TEL :(855) 10 78 55 44","0","1","1");
INSERT INTO rms_setting VALUES("45","brand_holiday","?????????????????","0","0","1");
INSERT INTO rms_setting VALUES("46","brand_call","??????????????????","0","0","1");
INSERT INTO rms_setting VALUES("47","il_payment_title","????????? ???????????????????","0","0","1");
INSERT INTO rms_setting VALUES("48","il_payment","??????????????????","0","0","1");
INSERT INTO rms_setting VALUES("49","rpt_loan_release","?????????????????????","0","0","1");
INSERT INTO rms_setting VALUES("50","rpt_loan_release_co","???????????????????????????","0","0","1");
INSERT INTO rms_setting VALUES("51","rpt_loan_collect","????????????????","0","0","1");
INSERT INTO rms_setting VALUES("52","rpt_loan_outstanding","????????????????????????","0","0","1");
INSERT INTO rms_setting VALUES("53","village","????????????????","0","0","1");
INSERT INTO rms_setting VALUES("54","brand_name","?????????????","0","0","1");
INSERT INTO rms_setting VALUES("55","brand_client","???????????????","0","0","1");
INSERT INTO rms_setting VALUES("56","brand_callecteral","???????????????????????????","0","0","1");
INSERT INTO rms_setting VALUES("57","brand_callecteral_change","??????????????????????????","0","0","1");
INSERT INTO rms_setting VALUES("58","brand_returncollteral","????????????????????????????????????","0","0","1");
INSERT INTO rms_setting VALUES("59","brand_clientblacklist","???????????????????????","0","0","1");
INSERT INTO rms_setting VALUES("60","rpt_bad_loan","?????????????????","0","1","1");
INSERT INTO rms_setting VALUES("61","rpt_loan_late","?????????????????","0","1","1");
INSERT INTO rms_setting VALUES("62","client_website","www.sokhamicrofinance.com","0","1","1");
INSERT INTO rms_setting VALUES("63","email_client","Email : info@sokhamicrofinance.com","0","1","1");
INSERT INTO rms_setting VALUES("64","rpt-transfer-title-kh","?????????????????????","1","0","1");
INSERT INTO rms_setting VALUES("65","rpt-transfer-business-meaning-kh","????????????????????????? ?????????????????????","0","1","1");
INSERT INTO rms_setting VALUES("66","rpt-transfer-business-meaning-eng","Loan,Exchange and Transfer Money","0","1","1");
INSERT INTO rms_setting VALUES("67","client_company_name_kh","??????? ?????????? ??????? ???????","0","1","1");
INSERT INTO rms_setting VALUES("68","asdklfjasdf","??????????????????????????","0","1","1");
INSERT INTO rms_setting VALUES("69","rpt-paymentschedule","??????????????????????????","0","1","1");
INSERT INTO rms_setting VALUES("70","claro","Theme","0","1","1");
INSERT INTO rms_setting VALUES("71","nihilo","Theme","0","1","1");
INSERT INTO rms_setting VALUES("72","soria","Theme","0","1","1");
INSERT INTO rms_setting VALUES("73","tundra","Theme","0","1","1");



DROP TABLE rms_user_log;

CREATE TABLE `rms_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `log_date` datetime NOT NULL,
  `log_type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

INSERT INTO rms_user_log VALUES("1","1","2015-09-22 11:13:16","in");
INSERT INTO rms_user_log VALUES("2","1","2015-09-22 15:14:54","in");
INSERT INTO rms_user_log VALUES("3","1","2015-09-22 21:32:06","in");
INSERT INTO rms_user_log VALUES("4","1","2015-09-23 19:02:45","in");
INSERT INTO rms_user_log VALUES("5","1","2015-09-24 14:54:57","in");
INSERT INTO rms_user_log VALUES("6","1","2015-09-24 23:05:12","in");
INSERT INTO rms_user_log VALUES("7","1","2015-09-25 15:06:27","in");
INSERT INTO rms_user_log VALUES("8","1","2015-09-25 16:18:16","in");
INSERT INTO rms_user_log VALUES("9","1","2015-09-26 19:44:43","in");
INSERT INTO rms_user_log VALUES("10","1","2015-09-27 17:06:59","in");
INSERT INTO rms_user_log VALUES("11","1","2015-09-28 08:16:58","in");
INSERT INTO rms_user_log VALUES("12","1","2015-09-28 13:34:58","in");
INSERT INTO rms_user_log VALUES("13","1","2015-09-28 14:04:27","in");
INSERT INTO rms_user_log VALUES("14","1","2015-09-28 14:04:59","in");
INSERT INTO rms_user_log VALUES("15","1","2015-09-28 14:05:12","in");
INSERT INTO rms_user_log VALUES("16","1","2015-09-28 14:06:21","in");
INSERT INTO rms_user_log VALUES("17","1","2015-09-28 14:08:01","in");
INSERT INTO rms_user_log VALUES("18","1","2015-09-28 14:16:07","in");
INSERT INTO rms_user_log VALUES("19","1","2015-09-28 14:17:18","in");
INSERT INTO rms_user_log VALUES("20","1","2015-09-28 14:33:44","in");
INSERT INTO rms_user_log VALUES("21","1","2015-09-28 14:51:24","in");
INSERT INTO rms_user_log VALUES("22","1","2015-09-28 14:56:41","in");
INSERT INTO rms_user_log VALUES("23","1","2015-09-28 15:05:28","in");
INSERT INTO rms_user_log VALUES("24","1","2015-09-28 20:30:26","in");
INSERT INTO rms_user_log VALUES("25","1","2015-09-29 09:03:17","in");
INSERT INTO rms_user_log VALUES("26","1","2015-09-29 10:28:43","in");
INSERT INTO rms_user_log VALUES("27","1","2015-09-29 10:37:50","in");
INSERT INTO rms_user_log VALUES("28","1","2015-09-29 10:39:19","in");
INSERT INTO rms_user_log VALUES("29","1","2015-09-29 13:38:10","in");
INSERT INTO rms_user_log VALUES("30","1","2015-09-29 19:36:57","in");
INSERT INTO rms_user_log VALUES("31","1","2015-09-29 23:13:09","in");



DROP TABLE rms_users;

CREATE TABLE `rms_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `user_name` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` tinyint(1) DEFAULT '0' COMMENT '0: transfer; 1:admin',
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO rms_users VALUES("1","?????","????","channy","5f4dcc3b5aa765d61d8327deb882cf99","1","1");
INSERT INTO rms_users VALUES("2","??????","????","soeurn","5f4dcc3b5aa765d61d8327deb882cf99","2","1");
INSERT INTO rms_users VALUES("3","dara","dara","dara","e10adc3949ba59abbe56e057f20f883e","1","1");



DROP TABLE v_badloan;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_badloan` AS (select `b`.`id` AS `id`,`b`.`total_amount` AS `total_amount`,`b`.`intrest_amount` AS `interest_amount`,`b`.`date` AS `payof_date`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 26) and (`ln_view`.`key_code` = `b`.`tem`)) limit 1) AS `condition_term`,`l`.`member_id` AS `member_id`,`l`.`loan_number` AS `loan_number`,`l`.`group_id` AS `group_id`,`l`.`branch_id` AS `branch_id`,`l`.`client_id` AS `client_id`,`l`.`total_capital` AS `total_capital`,`l`.`interest_rate` AS `interest_rate`,`l`.`curr_type` AS `curr_type`,`l`.`total_duration` AS `total_duration`,`l`.`date_release` AS `date_release`,`l`.`date_line` AS `date_line`,`l`.`loan_type` AS `loantype`,`l`.`payment_nameen` AS `from_paymentmethod`,`l`.`client_number` AS `client_number`,`l`.`client_name` AS `client_name`,`l`.`branch_name` AS `branch_name`,`l`.`currency_type` AS `currency_type`,`l`.`Term Borrow` AS `termborrow`,`l`.`co_name` AS `co_name`,`l`.`loan_type` AS `loan_type` from (`v_default` `l` join `ln_badloan` `b`) where (`b`.`loan_number` = `l`.`loan_number`));




DROP TABLE v_default;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_default` AS (select `m`.`member_id` AS `member_id`,`m`.`loan_number` AS `loan_number`,`m`.`group_id` AS `group_id`,sum(`m`.`admin_fee`) AS `admin_fee`,sum(`m`.`other_fee`) AS `other_fee`,`m`.`branch_id` AS `branch_id`,`m`.`client_id` AS `client_id`,sum(`m`.`total_capital`) AS `total_capital`,`m`.`interest_rate` AS `interest_rate`,`m`.`currency_type` AS `curr_type`,`lg`.`level` AS `loan_level`,`lg`.`pay_term` AS `pay_term_id`,`lg`.`total_duration` AS `total_duration`,`lg`.`date_release` AS `date_release`,`lg`.`date_line` AS `date_line`,`lg`.`co_id` AS `co_id`,`lg`.`loan_type` AS `loantype`,`lg`.`collect_typeterm` AS `collect_typeterm`,`m`.`pay_after` AS `pay_after`,(select `p`.`payment_nameen` from `ln_payment_method` `p` where (`p`.`id` = `lg`.`payment_method`)) AS `payment_nameen`,(select `c`.`client_number` from `ln_client` `c` where (`c`.`client_id` = `m`.`client_id`) limit 1) AS `client_number`,(select `c`.`phone` from `ln_client` `c` where (`c`.`client_id` = `m`.`client_id`) limit 1) AS `client_phone`,(select `c`.`name_kh` from `ln_client` `c` where (`c`.`client_id` = `m`.`client_id`) limit 1) AS `client_name`,(select `ln_branch`.`branch_namekh` from `ln_branch` where (`ln_branch`.`br_id` = `m`.`branch_id`) limit 1) AS `branch_name`,(select `ln_currency`.`symbol` from `ln_currency` where (`ln_currency`.`id` = `m`.`currency_type`)) AS `currency_type`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 14) and (`ln_view`.`key_code` = `lg`.`pay_term`))) AS `Term Borrow`,(select `ln_co`.`co_khname` from `ln_co` where (`ln_co`.`co_id` = `lg`.`co_id`) limit 1) AS `co_name`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 14) and (`ln_view`.`key_code` = `lg`.`pay_term`)) limit 1) AS `name_en`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 24) and (`ln_view`.`key_code` = `lg`.`for_loantype`)) limit 1) AS `loan_type` from (`ln_loan_group` `lg` join `ln_loan_member` `m`) where ((`lg`.`g_id` = `m`.`group_id`) and (`m`.`status` = 1) and (`lg`.`g_id` = `m`.`group_id`)) group by `m`.`group_id` order by `m`.`currency_type`);

INSERT INTO v_default VALUES("1","PPL00001","1","10.00","0.00","1","1","1000.00","2.50","2","1","3","12","2015-09-07","2016-10-07","1","1","3","2","Decline","PP000001","070 41 8002","???? ?????","???????","$","Month","??? ?????","Month","Other Loan");



DROP TABLE v_getallcallateral;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_getallcallateral` AS (select `c`.`id` AS `id`,`d`.`number_collecteral` AS `number_collecteral`,`d`.`is_return` AS `is_return`,`d`.`issue_date` AS `issue_date`,`d`.`note` AS `note`,(select `ln_branch`.`branch_namekh` from `ln_branch` where (`ln_branch`.`br_id` = `c`.`branch_id`) limit 1) AS `branch_name`,(select `ln_co`.`co_khname` from `ln_co` where (`ln_co`.`co_id` = `c`.`co_id`) limit 1) AS `co_id`,`d`.`collecteral_code` AS `collecteral_code`,(select `ln_client`.`client_number` from `ln_client` where (`ln_client`.`client_id` = `c`.`client_id`) limit 1) AS `client_code`,`d`.`owner_name` AS `collecteral_type`,(select `ln_view`.`name_kh` from `ln_view` where ((`ln_view`.`type` = 21) and (`ln_view`.`key_code` = `d`.`owner_type`))) AS `collecteral_owner`,(select `ct`.`title_en` from `ln_callecteral_type` `ct` where (`ct`.`id` = `d`.`collecteral_type`)) AS `collecteral_title_en`,(select `ln_client`.`name_kh` from `ln_client` where (`ln_client`.`client_id` = `c`.`client_id`) limit 1) AS `name_kh`,(select `ln_client`.`name_en` from `ln_client` where (`ln_client`.`client_id` = `c`.`client_id`) limit 1) AS `client_name`,`c`.`client_id` AS `client_id`,`c`.`branch_id` AS `branch_id`,`c`.`join_with` AS `join_with`,`c`.`relative` AS `relative`,`c`.`date` AS `date`,`c`.`status` AS `status` from (`ln_client_callecteral` `c` join `ln_client_callecteral_detail` `d`) where ((`c`.`id` = `d`.`client_coll_id`) and (`c`.`status` = 1) and (`d`.`status` = 1)));

INSERT INTO v_getallcallateral VALUES("1","22","0","1970-01-01","","???????","SSSS","CL000001","PP000004","Lum Chenda-?? ??????","???????????","Family Book","?? ??????","Lum Chenda","4","1","","","2015-09-28","1");
INSERT INTO v_getallcallateral VALUES("1","33","0","1970-01-01","","???????","SSSS","CL000002","PP000004","Lum Chenda-?? ??????","???????????","Vehicle Credentials","?? ??????","Lum Chenda","4","1","","","2015-09-28","1");
INSERT INTO v_getallcallateral VALUES("1","44","0","","22","???????","SSSS","CL000003","PP000004","Lum Chenda-?? ??????","???????????","Resident Letter","?? ??????","Lum Chenda","4","1","","","2015-09-28","1");



DROP TABLE v_getallclient;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_getallclient` AS (select `ln_client`.`client_id` AS `client_id`,`ln_client`.`pro_id` AS `pro_id`,`ln_client`.`village_id` AS `village_id`,`ln_client`.`dis_id` AS `dis_id`,`ln_client`.`com_id` AS `com_id`,`ln_client`.`branch_id` AS `branch_id`,`ln_client`.`client_number` AS `client_number`,concat(`ln_client`.`name_kh`,',',`ln_client`.`name_en`) AS `client_name`,`ln_client`.`dob` AS `dob`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 5) and (`ln_view`.`key_code` = `ln_client`.`sit_status`))) AS `situation`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 23) and (`ln_view`.`key_code` = `ln_client`.`client_d_type`))) AS `doc_name`,`ln_client`.`nation_id` AS `id_number`,`ln_client`.`job` AS `job`,`ln_client`.`join_with` AS `join_with`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 23) and (`ln_view`.`key_code` = `ln_client`.`join_d_type`))) AS `joint_doc_type`,`ln_client`.`join_nation_id` AS `join_nation_id`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 11) and (`ln_client`.`sex` = `ln_view`.`key_code`)) limit 1) AS `sex`,`ln_client`.`phone` AS `phone`,`ln_client`.`house` AS `house`,`ln_client`.`street` AS `street`,(select `ln_branch`.`branch_namekh` from `ln_branch` where (`ln_branch`.`br_id` = `ln_client`.`branch_id`)) AS `branch_name`,(select `ln_village`.`village_name` from `ln_village` where (`ln_village`.`vill_id` = `ln_client`.`village_id`)) AS `village_name`,(select `c`.`commune_name` from `ln_commune` `c` where (`c`.`com_id` = `ln_client`.`com_id`) limit 1) AS `com_name`,(select `d`.`district_name` from `ln_district` `d` where (`d`.`dis_id` = `ln_client`.`dis_id`) limit 1) AS `dis_name`,(select `ln_province`.`province_en_name` from `ln_province` where (`ln_province`.`province_id` = `ln_client`.`pro_id`) limit 1) AS `pro_name`,`ln_client`.`spouse_name` AS `spouse_name`,`ln_client`.`create_date` AS `create_date`,(select concat(`rms_users`.`first_name`,' ',`rms_users`.`last_name`) from `rms_users` where (`rms_users`.`id` = `ln_client`.`user_id`)) AS `user_name`,`ln_client`.`status` AS `status` from `ln_client`);

INSERT INTO v_getallclient VALUES("1","1","0","1","0","1","PP000001","???? ?????,mok channy","1990-03-30","Single","Family Book","123","","sok lin","Certificate Of Birth","1234","M","070 41 8002","","","???????","","","Chamkarmon","Phnom Penh","sok leang","2015-08-28","????? ????","1");
INSERT INTO v_getallclient VALUES("2","1","0","2","17","1","PP000002","????,Dara","2015-09-09","Single","Family Book","2333","teacher","","","","M","","233","12","???????","","Phsah Kandal II","Daun Penh","Phnom Penh","","2015-09-01","????? ????","1");
INSERT INTO v_getallclient VALUES("3","5","0","0","0","1","PP000003","??? ????,sok virak","2015-09-16","Single","other","343","222","","","","M","3030202002","","","???????","","","","Kampong Chhnang","","2015-09-01","????? ????","1");
INSERT INTO v_getallclient VALUES("4","1","-1","5","0","1","PP000004","?? ??????,Lum Chenda","0000-00-00","Married","National Identity","2122","teacher","","","","M","010201021","","","???????","","","Dangkor","Phnom Penh","","2015-09-28","????? ????","1");



DROP TABLE v_getchangcolleral;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_getchangcolleral` AS (select (select `ln_branch`.`branch_namekh` from `ln_branch` where (`ln_branch`.`br_id` = `c`.`branch_id`)) AS `branch_name`,`c`.`client_id` AS `client_id`,`c`.`branch_id` AS `branch_id`,`c`.`date` AS `date`,`c`.`status` AS `statuss`,`c`.`note` AS `notes`,(select `cc`.`collecteral_code` from `ln_client_callecteral` `cc` where (`cc`.`id` = `cd`.`change_id`) limit 1) AS `collecteral_code`,(select `ct`.`title_en` from `ln_callecteral_type` `ct` where (`ct`.`id` = `cd`.`from_collateral_type`) limit 1) AS `collecteral_title_old`,(select `ct`.`title_en` from `ln_callecteral_type` `ct` where (`ct`.`id` = `cd`.`collateral_type`) limit 1) AS `collecteral_title_en`,(select `ln_view`.`name_kh` from `ln_view` where ((`ln_view`.`type` = 21) and (`ln_view`.`key_code` = `cd`.`owner_id`)) limit 1) AS `collecteral_owner`,(select concat(`ln_client`.`client_number`,' - ',`ln_client`.`name_kh`,' - ',`ln_client`.`name_en`) from `ln_client` where (`ln_client`.`client_id` = `c`.`client_id`) limit 1) AS `client_name`,`cd`.`id` AS `id`,`cd`.`change_id` AS `change_id`,`cd`.`client_coll_id` AS `client_coll_id`,`cd`.`from_id` AS `from_id`,`cd`.`from_collateral_type` AS `from_collateral_type`,`cd`.`from_owner_id` AS `from_owner_id`,`cd`.`from_owner_name` AS `from_owner_name`,`cd`.`from_number_collateral` AS `from_number_collateral`,`cd`.`from_note` AS `from_note`,`cd`.`to_id` AS `to_id`,`cd`.`collateral_type` AS `collateral_type`,`cd`.`owner_id` AS `owner_id`,`cd`.`toowner_name` AS `toowner_name`,`cd`.`number_collateral` AS `number_collateral`,`cd`.`note` AS `note`,`cd`.`status` AS `status`,`cd`.`is_changed` AS `is_changed`,`cd`.`issue_date` AS `issue_date` from (`ln_changecollteral` `c` join `ln_changecollteral_detail` `cd`) where ((`c`.`id` = `cd`.`change_id`) and (`cd`.`status` = 1)) order by `c`.`client_id`);

INSERT INTO v_getchangcolleral VALUES("???????","1","1","2015-09-03","1","","CL000001","Real Estate Certification Mark","Real Estate Certification Mark","???????????","PP000001 - ???? ????? - mok channy","1","1","19","","1","1","mok channy-???? ?????","100","","","1","1","mok channy-???? ?????","44444","444444444","1","","2015-09-22");
INSERT INTO v_getchangcolleral VALUES("???????","3","1","2015-09-25","1","","","Driver\'s License","Resident Letter","???????????","PP000003 - ??? ???? - sok virak","2","2","24","","7","1","sok virak-??? ????","333","","","5","1","sok virak-??? ????","111","note","1","","2015-09-10");



DROP TABLE v_getclientblacklist;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_getclientblacklist` AS (select `b`.`id` AS `id`,(select `ln_branch`.`branch_namekh` from `ln_branch` where (`ln_branch`.`br_id` = `b`.`branch_id`) limit 1) AS `branch_name`,`b`.`branch_id` AS `branch_id`,`b`.`client_id` AS `client_id`,`b`.`date` AS `date`,`b`.`reason` AS `reason`,`b`.`status` AS `status`,`c`.`client_number` AS `client_number`,concat(`c`.`name_kh`,',',`c`.`name_en`) AS `client_name`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 11) and (`ln_view`.`key_code` = `c`.`sex`))) AS `sex`,`c`.`dob` AS `dob`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 5) and (`ln_view`.`key_code` = `c`.`sit_status`))) AS `situation`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 23) and (`ln_view`.`key_code` = `c`.`id_type`))) AS `doc_name`,`c`.`nation_id` AS `id_number`,(select `ln_village`.`village_name` from `ln_village` where (`ln_village`.`vill_id` = `c`.`village_id`) limit 1) AS `village_name`,(select `ln_commune`.`commune_name` from `ln_commune` where (`ln_commune`.`com_id` = `c`.`com_id`) limit 1) AS `commune_name`,(select `ln_district`.`district_name` from `ln_district` where (`ln_district`.`dis_id` = `c`.`dis_id`) limit 1) AS `district_name`,(select `ln_province`.`province_en_name` from `ln_province` where (`ln_province`.`province_id` = `c`.`pro_id`) limit 1) AS `province_name`,`c`.`street` AS `street`,`c`.`house` AS `house` from (`ln_client` `c` join `ln_client_blacklist` `b`) where (`c`.`client_id` = `b`.`client_id`));




DROP TABLE v_getcollect;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_getcollect` AS (select (select `ln_branch`.`branch_namekh` from `ln_branch` where (`ln_branch`.`br_id` = `lf`.`branch_id`)) AS `branch_name`,(select `m`.`client_id` from `ln_loan_member` `m` where (`m`.`member_id` = `lf`.`member_id`)) AS `client_id`,(select (select concat(`ln_client`.`name_kh`,' - ',`ln_client`.`name_en`) from `ln_client` where (`ln_client`.`client_id` = `m`.`client_id`)) from `ln_loan_member` `m` where (`m`.`member_id` = `lf`.`member_id`)) AS `client_name`,(select `m`.`loan_number` from `ln_loan_member` `m` where (`m`.`member_id` = `lf`.`member_id`)) AS `loan_number`,(select `m`.`currency_type` from `ln_loan_member` `m` where (`m`.`member_id` = `lf`.`member_id`)) AS `currency_type`,(select (select `ln_currency`.`symbol` from `ln_currency` where (`ln_currency`.`id` = `m`.`currency_type`)) from `ln_loan_member` `m` where (`m`.`member_id` = `lf`.`member_id`)) AS `currency_typeshow`,(select concat(`ln_co`.`co_khname`,' - ',`ln_co`.`co_firstname`,' ',`ln_co`.`co_lastname`) from `ln_co` where (`ln_co`.`co_id` = `lf`.`collect_by`)) AS `co_name`,`lf`.`id` AS `id`,`lf`.`member_id` AS `member_id`,`lf`.`total_principal` AS `total_principal`,`lf`.`principal_permonth` AS `principal_permonth`,`lf`.`total_interest` AS `total_interest`,`lf`.`total_payment` AS `total_payment`,`lf`.`amount_day` AS `amount_day`,`lf`.`status` AS `status`,`lf`.`is_completed` AS `is_completed`,`lf`.`is_approved` AS `is_approved`,`lf`.`date_payment` AS `date_payment`,`lf`.`branch_id` AS `branch_id`,`lf`.`collect_by` AS `collect_by`,`lf`.`payment_option` AS `payment_option` from `ln_loanmember_funddetail` `lf`);

INSERT INTO v_getcollect VALUES("???????","1","???? ????? - mok channy","PPL00001","2","$","??? ????? - sarons ","1","1","1000.00","83.33","25.00","108.33","30","1","1","0","2015-10-07","1","1","1");
INSERT INTO v_getcollect VALUES("???????","1","???? ????? - mok channy","PPL00001","2","$","??? ????? - sarons ","2","1","916.67","83.33","23.68","107.01","31","1","0","0","2015-11-07","1","1","");
INSERT INTO v_getcollect VALUES("???????","1","???? ????? - mok channy","PPL00001","2","$","??? ????? - sarons ","3","1","833.34","83.33","20.83","104.16","30","1","0","0","2015-12-07","1","1","");
INSERT INTO v_getcollect VALUES("???????","1","???? ????? - mok channy","PPL00001","2","$","??? ????? - sarons ","4","1","750.01","83.33","19.38","102.71","31","1","0","0","2016-01-07","1","1","");
INSERT INTO v_getcollect VALUES("???????","1","???? ????? - mok channy","PPL00001","2","$","??? ????? - sarons ","5","1","666.68","83.33","17.22","100.55","31","1","0","0","2016-02-07","1","1","");
INSERT INTO v_getcollect VALUES("???????","1","???? ????? - mok channy","PPL00001","2","$","??? ????? - sarons ","6","1","583.35","83.33","14.10","97.43","29","1","0","0","2016-03-07","1","1","");
INSERT INTO v_getcollect VALUES("???????","1","???? ????? - mok channy","PPL00001","2","$","??? ????? - sarons ","7","1","500.02","83.33","12.92","96.25","31","1","0","0","2016-04-07","1","1","");
INSERT INTO v_getcollect VALUES("???????","1","???? ????? - mok channy","PPL00001","2","$","??? ????? - sarons ","8","1","416.69","83.33","10.42","93.75","30","1","0","0","2016-05-07","1","1","");
INSERT INTO v_getcollect VALUES("???????","1","???? ????? - mok channy","PPL00001","2","$","??? ????? - sarons ","9","1","333.36","83.33","8.61","91.94","31","1","0","0","2016-06-07","1","1","");
INSERT INTO v_getcollect VALUES("???????","1","???? ????? - mok channy","PPL00001","2","$","??? ????? - sarons ","10","1","250.03","83.33","6.25","89.58","30","1","0","0","2016-07-07","1","1","");
INSERT INTO v_getcollect VALUES("???????","1","???? ????? - mok channy","PPL00001","2","$","??? ????? - sarons ","11","1","166.70","83.33","4.31","87.64","31","1","0","0","2016-08-07","1","1","");
INSERT INTO v_getcollect VALUES("???????","1","???? ????? - mok channy","PPL00001","2","$","??? ????? - sarons ","12","1","83.37","83.37","2.15","85.52","31","1","0","0","2016-09-07","1","1","");



DROP TABLE v_getcollectmoney;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_getcollectmoney` AS (select (select `ln_branch`.`branch_namekh` from `ln_branch` where (`ln_branch`.`br_id` = `crm`.`branch_id`)) AS `branch_name`,(select `ln_client`.`client_id` from `ln_client` where (`ln_client`.`client_id` = `crm`.`group_id`)) AS `client_id`,(select concat(`ln_client`.`name_kh`,' - ',`ln_client`.`name_en`) from `ln_client` where (`ln_client`.`client_id` = `crm`.`group_id`)) AS `client_name`,(select `ln_client`.`client_number` from `ln_client` where (`ln_client`.`client_id` = `crm`.`group_id`)) AS `client_number`,(select `ln_currency`.`symbol` from `ln_currency` where (`ln_currency`.`id` = `crm`.`currency_type`)) AS `currency_typeshow`,(select `c`.`co_khname` from `ln_co` `c` where (`c`.`co_id` = `crm`.`co_id`)) AS `co_name`,`crm`.`id` AS `id`,`crm`.`co_id` AS `co_id`,`crm`.`group_id` AS `group_id`,`crm`.`receiver_id` AS `receiver_id`,`crm`.`receipt_no` AS `receipt_no`,`crm`.`branch_id` AS `branch_id`,`crm`.`date_pay` AS `date_pay`,`crm`.`date_input` AS `date_input`,`crm`.`note` AS `note`,`crm`.`user_id` AS `user_id`,`crm`.`is_group` AS `is_group`,`crm`.`return_amount` AS `return_amount`,`crm`.`status` AS `status`,`crm`.`payment_option` AS `payment_option`,`crm`.`currency_type` AS `currency_type`,`crm`.`principal_amount` AS `principal_amount`,`crm`.`is_payoff` AS `is_payoff`,`d`.`loan_number` AS `loan_number`,`d`.`principal_permonth` AS `total_principal_permonth`,`d`.`total_payment` AS `total_payment`,`d`.`total_interest` AS `total_interest`,`d`.`total_recieve` AS `recieve_amount`,`d`.`penelize_amount` AS `penalize_amount`,`d`.`service_charge` AS `service_charge` from (`ln_client_receipt_money` `crm` join `ln_client_receipt_money_detail` `d`) where (`crm`.`id` = `d`.`crm_id`));

INSERT INTO v_getcollectmoney VALUES("???????","1","???? ????? - mok channy","PP000001","$","??? ?????","1","1","1","1","PM-00001","1","2015-09-08","2015-09-08","","1","0","0.000","1","1","2","916.670","0","PPL00001","83.33","108.33","25.00","108.33","0.00","0.00");



DROP TABLE v_getexpectincome;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_getexpectincome` AS (select `f`.`id` AS `id`,`f`.`principle_after` AS `principle_permonth`,`f`.`total_interest_after` AS `total_interest`,`f`.`status` AS `status`,`f`.`date_payment` AS `date_payment`,(select `b`.`branch_namekh` from `ln_branch` `b` where (`b`.`br_id` = `g`.`branch_id`)) AS `branch_name`,`g`.`date_release` AS `date_release`,`g`.`date_line` AS `date_line`,`g`.`total_duration` AS `total_duration`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 14) and (`ln_view`.`key_code` = `g`.`pay_term`))) AS `termborrow`,(select `ln_currency`.`symbol` from `ln_currency` where (`ln_currency`.`id` = `m`.`currency_type`)) AS `currency_typeshow`,`m`.`currency_type` AS `currency_type`,`m`.`branch_id` AS `branch_id`,`m`.`loan_number` AS `loan_number`,`m`.`interest_rate` AS `interest_rate`,`m`.`total_capital` AS `total_capital`,`m`.`group_id` AS `group_id`,(select `c`.`client_number` from `ln_client` `c` where (`c`.`client_id` = `m`.`client_id`) limit 1) AS `client_number`,(select `c`.`name_kh` from `ln_client` `c` where (`c`.`client_id` = `m`.`client_id`) limit 1) AS `client_name` from ((`ln_loanmember_funddetail` `f` join `ln_loan_member` `m`) join `ln_loan_group` `g`) where ((`f`.`member_id` = `m`.`member_id`) and (`g`.`g_id` = `m`.`group_id`) and (`f`.`status` = 1)) order by `m`.`currency_type`,`m`.`branch_id`,`m`.`group_id`,`m`.`client_id`);

INSERT INTO v_getexpectincome VALUES("2","83.33","23.68","1","2015-11-07","???????","2015-09-07","2016-10-07","12","Month","$","2","1","PPL00001","2.50","1000.00","1","PP000001","???? ?????");
INSERT INTO v_getexpectincome VALUES("7","83.33","12.92","1","2016-04-07","???????","2015-09-07","2016-10-07","12","Month","$","2","1","PPL00001","2.50","1000.00","1","PP000001","???? ?????");
INSERT INTO v_getexpectincome VALUES("12","83.37","2.15","1","2016-09-07","???????","2015-09-07","2016-10-07","12","Month","$","2","1","PPL00001","2.50","1000.00","1","PP000001","???? ?????");
INSERT INTO v_getexpectincome VALUES("1","83.33","25.00","1","2015-10-07","???????","2015-09-07","2016-10-07","12","Month","$","2","1","PPL00001","2.50","1000.00","1","PP000001","???? ?????");
INSERT INTO v_getexpectincome VALUES("6","83.33","14.10","1","2016-03-07","???????","2015-09-07","2016-10-07","12","Month","$","2","1","PPL00001","2.50","1000.00","1","PP000001","???? ?????");
INSERT INTO v_getexpectincome VALUES("11","83.33","4.31","1","2016-08-07","???????","2015-09-07","2016-10-07","12","Month","$","2","1","PPL00001","2.50","1000.00","1","PP000001","???? ?????");
INSERT INTO v_getexpectincome VALUES("5","83.33","17.22","1","2016-02-07","???????","2015-09-07","2016-10-07","12","Month","$","2","1","PPL00001","2.50","1000.00","1","PP000001","???? ?????");
INSERT INTO v_getexpectincome VALUES("10","83.33","6.25","1","2016-07-07","???????","2015-09-07","2016-10-07","12","Month","$","2","1","PPL00001","2.50","1000.00","1","PP000001","???? ?????");
INSERT INTO v_getexpectincome VALUES("4","83.33","19.38","1","2016-01-07","???????","2015-09-07","2016-10-07","12","Month","$","2","1","PPL00001","2.50","1000.00","1","PP000001","???? ?????");
INSERT INTO v_getexpectincome VALUES("9","83.33","8.61","1","2016-06-07","???????","2015-09-07","2016-10-07","12","Month","$","2","1","PPL00001","2.50","1000.00","1","PP000001","???? ?????");
INSERT INTO v_getexpectincome VALUES("3","83.33","20.83","1","2015-12-07","???????","2015-09-07","2016-10-07","12","Month","$","2","1","PPL00001","2.50","1000.00","1","PP000001","???? ?????");
INSERT INTO v_getexpectincome VALUES("8","83.33","10.42","1","2016-05-07","???????","2015-09-07","2016-10-07","12","Month","$","2","1","PPL00001","2.50","1000.00","1","PP000001","???? ?????");



DROP TABLE v_getloancollects;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_getloancollects` AS (select `f`.`id` AS `id`,`f`.`member_id` AS `member_id`,`f`.`total_principal` AS `total_principal`,`f`.`principal_permonth` AS `principal_permonth`,`f`.`total_interest` AS `total_interest`,`f`.`total_payment` AS `total_payment`,`f`.`amount_day` AS `amount_day`,`f`.`date_payment` AS `date_payment`,`f`.`collect_by` AS `collect_by`,`f`.`branch_id` AS `branch_id`,(select `ln_loan_member`.`loan_number` from `ln_loan_member` where (`ln_loan_member`.`member_id` = `f`.`member_id`)) AS `loan_number`,(select `ln_loan_member`.`client_id` from `ln_loan_member` where (`ln_loan_member`.`member_id` = `f`.`member_id`)) AS `client_id`,(select `ln_co`.`co_khname` from `ln_co` where (`ln_co`.`co_id` = `f`.`collect_by`)) AS `co_name`,(select `ln_co`.`co_id` from `ln_co` where (`ln_co`.`co_id` = `f`.`collect_by`)) AS `co_id`,(select `ln_branch`.`branch_namekh` from `ln_branch` where (`ln_branch`.`br_id` = `f`.`branch_id`)) AS `branch_kh`,(select concat(`ln_client`.`client_number`,' - ',`ln_client`.`name_kh`,'-',`ln_client`.`name_en`,'-','st:',`ln_client`.`street`,';No:',`ln_client`.`house`) from `ln_client` where (`ln_client`.`client_id` = (select `ln_loan_member`.`client_id` from `ln_loan_member` where (`ln_loan_member`.`member_id` = `f`.`member_id`) limit 1)) limit 1) AS `client_name`,(select `ln_client`.`phone` from `ln_client` where (`ln_client`.`client_id` = (select `ln_loan_member`.`client_id` from `ln_loan_member` where (`ln_loan_member`.`member_id` = `f`.`member_id`) limit 1)) limit 1) AS `phone_number` from `ln_loanmember_funddetail` `f` where ((`f`.`is_completed` = 0) and (`f`.`status` = 1)));

INSERT INTO v_getloancollects VALUES("2","1","916.67","83.33","23.68","107.01","31","2015-11-07","1","1","PPL00001","1","??? ?????","1","???????","PP000001 - ???? ?????-mok channy-st:;No:","070 41 8002");
INSERT INTO v_getloancollects VALUES("3","1","833.34","83.33","20.83","104.16","30","2015-12-07","1","1","PPL00001","1","??? ?????","1","???????","PP000001 - ???? ?????-mok channy-st:;No:","070 41 8002");
INSERT INTO v_getloancollects VALUES("4","1","750.01","83.33","19.38","102.71","31","2016-01-07","1","1","PPL00001","1","??? ?????","1","???????","PP000001 - ???? ?????-mok channy-st:;No:","070 41 8002");
INSERT INTO v_getloancollects VALUES("5","1","666.68","83.33","17.22","100.55","31","2016-02-07","1","1","PPL00001","1","??? ?????","1","???????","PP000001 - ???? ?????-mok channy-st:;No:","070 41 8002");
INSERT INTO v_getloancollects VALUES("6","1","583.35","83.33","14.10","97.43","29","2016-03-07","1","1","PPL00001","1","??? ?????","1","???????","PP000001 - ???? ?????-mok channy-st:;No:","070 41 8002");
INSERT INTO v_getloancollects VALUES("7","1","500.02","83.33","12.92","96.25","31","2016-04-07","1","1","PPL00001","1","??? ?????","1","???????","PP000001 - ???? ?????-mok channy-st:;No:","070 41 8002");
INSERT INTO v_getloancollects VALUES("8","1","416.69","83.33","10.42","93.75","30","2016-05-07","1","1","PPL00001","1","??? ?????","1","???????","PP000001 - ???? ?????-mok channy-st:;No:","070 41 8002");
INSERT INTO v_getloancollects VALUES("9","1","333.36","83.33","8.61","91.94","31","2016-06-07","1","1","PPL00001","1","??? ?????","1","???????","PP000001 - ???? ?????-mok channy-st:;No:","070 41 8002");
INSERT INTO v_getloancollects VALUES("10","1","250.03","83.33","6.25","89.58","30","2016-07-07","1","1","PPL00001","1","??? ?????","1","???????","PP000001 - ???? ?????-mok channy-st:;No:","070 41 8002");
INSERT INTO v_getloancollects VALUES("11","1","166.70","83.33","4.31","87.64","31","2016-08-07","1","1","PPL00001","1","??? ?????","1","???????","PP000001 - ???? ?????-mok channy-st:;No:","070 41 8002");
INSERT INTO v_getloancollects VALUES("12","1","83.37","83.37","2.15","85.52","31","2016-09-07","1","1","PPL00001","1","??? ?????","1","???????","PP000001 - ???? ?????-mok channy-st:;No:","070 41 8002");



DROP TABLE v_getloanlates;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_getloanlates` AS (select `mf`.`id` AS `id`,`mf`.`status` AS `status`,`mf`.`member_id` AS `member_id`,(select `ln_co`.`co_khname` from `ln_co` where (`ln_co`.`co_id` = `mf`.`member_id`)) AS `name_kh`,`mf`.`total_principal` AS `total_principal`,`mf`.`principal_permonth` AS `principal_permonth`,`mf`.`total_interest` AS `total_interest`,`mf`.`total_payment` AS `total_payment`,(select `b`.`branch_namekh` from `ln_branch` `b` where (`b`.`br_id` = `mf`.`branch_id`)) AS `branch_name`,`m`.`currency_type` AS `currency_type`,`m`.`branch_id` AS `branch_id`,(select `ln_currency`.`symbol` from `ln_currency` where (`ln_currency`.`id` = `m`.`currency_type`)) AS `currency_typeshow`,`mf`.`date_payment` AS `date_payment`,`mf`.`amount_day` AS `amount_day`,`mf`.`is_approved` AS `is_approved` from (`ln_loanmember_funddetail` `mf` join `ln_loan_member` `m`) where ((`mf`.`member_id` = `m`.`member_id`) and (`mf`.`is_completed` = 0) and (`mf`.`status` = 1)) group by `m`.`group_id`,`mf`.`date_payment` order by `mf`.`date_payment`);

INSERT INTO v_getloanlates VALUES("2","1","1","??? ?????","916.67","83.33","23.68","107.01","???????","2","1","$","2015-11-07","31","0");
INSERT INTO v_getloanlates VALUES("3","1","1","??? ?????","833.34","83.33","20.83","104.16","???????","2","1","$","2015-12-07","30","0");
INSERT INTO v_getloanlates VALUES("4","1","1","??? ?????","750.01","83.33","19.38","102.71","???????","2","1","$","2016-01-07","31","0");
INSERT INTO v_getloanlates VALUES("5","1","1","??? ?????","666.68","83.33","17.22","100.55","???????","2","1","$","2016-02-07","31","0");
INSERT INTO v_getloanlates VALUES("6","1","1","??? ?????","583.35","83.33","14.10","97.43","???????","2","1","$","2016-03-07","29","0");
INSERT INTO v_getloanlates VALUES("7","1","1","??? ?????","500.02","83.33","12.92","96.25","???????","2","1","$","2016-04-07","31","0");
INSERT INTO v_getloanlates VALUES("8","1","1","??? ?????","416.69","83.33","10.42","93.75","???????","2","1","$","2016-05-07","30","0");
INSERT INTO v_getloanlates VALUES("9","1","1","??? ?????","333.36","83.33","8.61","91.94","???????","2","1","$","2016-06-07","31","0");
INSERT INTO v_getloanlates VALUES("10","1","1","??? ?????","250.03","83.33","6.25","89.58","???????","2","1","$","2016-07-07","30","0");
INSERT INTO v_getloanlates VALUES("11","1","1","??? ?????","166.70","83.33","4.31","87.64","???????","2","1","$","2016-08-07","31","0");
INSERT INTO v_getloanlates VALUES("12","1","1","??? ?????","83.37","83.37","2.15","85.52","???????","2","1","$","2016-09-07","31","0");



DROP TABLE v_getloanpayoff;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_getloanpayoff` AS (select `rm`.`id` AS `id`,`rm`.`status` AS `status_type`,`rm`.`principal_permonth` AS `principal_permonth`,`rm`.`total_interest` AS `total_interest`,`rm`.`total_payment` AS `total_payment`,`rm`.`total_recieve` AS `total_recieve`,`rm`.`service_charge` AS `service_charge`,`rm`.`penelize_amount` AS `penelize_amount`,`rm`.`date_payment` AS `date_payment`,`l`.`member_id` AS `member_id`,`l`.`loan_number` AS `loan_number`,`l`.`group_id` AS `group_id`,`l`.`branch_id` AS `branch_id`,`l`.`client_id` AS `client_id`,`l`.`total_capital` AS `total_capital`,`l`.`interest_rate` AS `interest_rate`,`l`.`curr_type` AS `curr_type`,`l`.`total_duration` AS `total_duration`,`l`.`date_release` AS `date_release`,`l`.`date_line` AS `date_line`,`l`.`loan_type` AS `loantype`,`l`.`payment_nameen` AS `from_paymentmethod`,`l`.`client_number` AS `client_number`,`l`.`client_name` AS `client_name`,`l`.`branch_name` AS `branch_name`,`l`.`currency_type` AS `currency_type`,`l`.`Term Borrow` AS `termborrow`,`l`.`co_name` AS `co_name`,`l`.`loan_type` AS `loan_type`,`l`.`loan_level` AS `loan_level` from (`v_default` `l` join `ln_client_receipt_money_detail` `rm`) where ((`l`.`loan_number` = `rm`.`loan_number`) and (`rm`.`status` = 4)));




DROP TABLE v_getnplloan;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_getnplloan` AS (select `lg`.`date_release` AS `date_release`,`lg`.`date_line` AS `date_line`,`lg`.`total_duration` AS `total_duration`,`lg`.`branch_id` AS `branch_id`,(select `ln_branch`.`branch_namekh` from `ln_branch` where (`ln_branch`.`br_id` = `lg`.`branch_id`) limit 1) AS `branch_name`,`lm`.`total_capital` AS `total_capital`,`lm`.`interest_rate` AS `interest_rate`,`lm`.`currency_type` AS `curr_type`,`lm`.`pay_after` AS `pay_after`,`lm`.`loan_number` AS `loan_number`,(select `c`.`client_number` from `ln_client` `c` where (`c`.`client_id` = `lm`.`client_id`) limit 1) AS `client_number`,(select `c`.`name_kh` from `ln_client` `c` where (`c`.`client_id` = `lm`.`client_id`) limit 1) AS `name_kh`,(select `ln_currency`.`symbol` from `ln_currency` where (`ln_currency`.`id` = `lm`.`currency_type`)) AS `currency_type`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 14) and (`ln_view`.`key_code` = `lg`.`pay_term`))) AS `term_borrow`,(select `crm`.`date_input` from (`ln_client_receipt_money` `crm` join `ln_client_receipt_money_detail` `crmd`) where ((`crm`.`loan_number` = `lm`.`loan_number`) and (`crm`.`id` = `crmd`.`crm_id`) and (`crmd`.`lfd_id` = `f`.`id`)) order by `crm`.`date_input` desc limit 1) AS `last_pay_date`,`f`.`total_principal` AS `total_principal`,`f`.`date_payment` AS `date_payment` from ((`ln_loanmember_funddetail` `f` join `ln_loan_group` `lg`) join `ln_loan_member` `lm`) where ((`f`.`is_completed` = 0) and (`lg`.`g_id` = `lm`.`group_id`) and (`lm`.`member_id` = `f`.`member_id`) and (`lg`.`status` = 1) and (`lm`.`status` = 1)) group by `lm`.`loan_number` order by `f`.`date_payment`);

INSERT INTO v_getnplloan VALUES("2015-09-07","2016-10-07","12","1","???????","1000.00","2.50","2","2","PPL00001","PP000001","???? ?????","$","Month","","916.67","2015-11-07");



DROP TABLE v_getreturncalleral;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_getreturncalleral` AS (select `r`.`id` AS `id`,`r`.`branch_id` AS `branch_id`,`r`.`client_id` AS `client_id`,`r`.`giver_name` AS `giver_name`,`r`.`receiver_name` AS `receiver_name`,`r`.`date` AS `date`,`r`.`note` AS `note`,`r`.`status` AS `status`,`r`.`user_id` AS `user_id`,`r`.`change_id` AS `change_id`,(select `b`.`branch_namekh` from `ln_branch` `b` where (`b`.`br_id` = `r`.`branch_id`) limit 1) AS `branch_name`,(select `v`.`name_kh` from `ln_view` `v` where ((`v`.`type` = 21) and (`v`.`key_code` = `cd`.`owner_type`))) AS `re_owner_type`,(select `ct`.`title_en` from `ln_callecteral_type` `ct` where (`ct`.`id` = `cd`.`collect_type`) limit 1) AS `collecteral_type`,(select `c`.`client_number` from `ln_client` `c` where (`c`.`client_id` = `r`.`client_id`) limit 1) AS `client_code`,`cd`.`return_id` AS `return_id`,`cd`.`collect_type` AS `collect_type`,`cd`.`owner_type` AS `owner_type`,`cd`.`owner_name` AS `owner_name`,`cd`.`number_collteral` AS `number_collteral`,`cd`.`issue_date` AS `issue_date` from (`ln_return_collteral` `r` join `ln_return_collteral_detail` `cd`) where (`r`.`id` = `cd`.`return_id`));

INSERT INTO v_getreturncalleral VALUES("1","1","1","mok channy-???? ?????","channy","2015-09-03","return back to client","1","1","1","???????","???????????","Real Estate Certification Mark","PP000001","1","1","1","mok channy-???? ?????","100","2015-09-22");
INSERT INTO v_getreturncalleral VALUES("2","1","3","channy","sok virak-??? ????","2015-09-25","return back to client","1","1","","???????","???????????","Real Estate Certification Mark","PP000003","2","1","1","sok virak-??? ????","1","2015-09-25");
INSERT INTO v_getreturncalleral VALUES("2","1","3","channy","sok virak-??? ????","2015-09-25","return back to client","1","1","","???????","???????????","Real Estate Certification Mark","PP000003","2","1","1","sok virak-??? ????","2","2015-09-09");
INSERT INTO v_getreturncalleral VALUES("3","1","3","channy","sok virak-??? ????","2015-09-25","return back to client","1","1","","???????","???????????","Real Estate Certification Mark","PP000003","3","1","1","sok virak-??? ????","3","2015-09-03");
INSERT INTO v_getreturncalleral VALUES("4","1","3","sok virak-??? ????","channy","2015-09-25","return back to client","1","1","2","???????","???????????","Driver\'s License","PP000003","4","7","1","sok virak-??? ????","333","2015-09-10");
INSERT INTO v_getreturncalleral VALUES("5","1","3","channy","sok virak-??? ????","2015-09-28","return back to client","1","1","","???????","???????????","Resident Letter","PP000003","5","5","1","sok virak-??? ????","111","2015-09-10");
INSERT INTO v_getreturncalleral VALUES("6","1","4","channy","Lum Chenda-?? ??????","2015-09-28","return back to client","1","1","","???????","???????????","Real Estate Certification Mark","PP000004","6","1","1","Lum Chenda-?? ??????","11","2015-09-02");



DROP TABLE v_gettransferloan;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_gettransferloan` AS (select `tf`.`id` AS `id`,`tf`.`date` AS `date`,`tf`.`note` AS `note`,`tf`.`status` AS `status`,`tf`.`type` AS `type`,`tf`.`loan_id` AS `loan_number`,`tf`.`branch_id` AS `branch_id`,`tf`.`client_id` AS `client_id`,`tf`.`from` AS `from`,`tf`.`to` AS `to`,(select `ln_branch`.`branch_namekh` from `ln_branch` where (`ln_branch`.`br_id` = `tf`.`branch_id`) limit 1) AS `branch_name`,(select `c`.`client_number` from `ln_client` `c` where (`c`.`client_id` = `tf`.`client_id`) limit 1) AS `client_number`,(select `c`.`name_kh` from `ln_client` `c` where (`c`.`client_id` = `tf`.`client_id`) limit 1) AS `client_name`,(select `ln_co`.`co_khname` from `ln_co` where (`ln_co`.`co_id` = `tf`.`from`) limit 1) AS `from_coname`,(select `ln_co`.`co_khname` from `ln_co` where (`ln_co`.`co_id` = `tf`.`to`) limit 1) AS `to_coname` from `ln_tranfser_co` `tf` order by `tf`.`id` desc);

INSERT INTO v_gettransferloan VALUES("3","2015-08-10","transfer loan  PPL00007 to chomroen","1","3","7","8","26","2","15","??????????","","","?? ????","Long Dara");
INSERT INTO v_gettransferloan VALUES("2","2015-08-07","client to co","1","2","","1","2","","9","???????","PP000002","????","","?? ????SS");
INSERT INTO v_gettransferloan VALUES("1","2015-08-07","co to co , saron to dara","1","1","","2","","1","2","???? ????????","","","??? ?????","?? ????");



DROP TABLE v_loangroupmember;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_loangroupmember` AS (select `m`.`member_id` AS `member_id`,`m`.`loan_number` AS `loan_number`,`m`.`group_id` AS `group_id`,`m`.`admin_fee` AS `admin_fee`,`m`.`other_fee` AS `other_fee`,`m`.`branch_id` AS `branch_id`,`m`.`client_id` AS `client_id`,`m`.`total_capital` AS `total_capital`,`m`.`interest_rate` AS `interest_rate`,`m`.`currency_type` AS `curr_type`,`lg`.`pay_term` AS `pay_term_id`,`lg`.`total_duration` AS `total_duration`,`lg`.`date_release` AS `date_release`,`lg`.`date_line` AS `date_line`,`lg`.`co_id` AS `co_id`,`lg`.`loan_type` AS `loantype`,(select `c`.`client_number` from `ln_client` `c` where (`c`.`client_id` = `m`.`client_id`) limit 1) AS `client_number`,(select `c`.`name_en` from `ln_client` `c` where (`c`.`client_id` = `m`.`client_id`) limit 1) AS `client_name`,(select `ln_branch`.`branch_namekh` from `ln_branch` where (`ln_branch`.`br_id` = `m`.`branch_id`) limit 1) AS `branch_name`,(select `ln_currency`.`symbol` from `ln_currency` where (`ln_currency`.`id` = `m`.`currency_type`)) AS `currency_type`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 14) and (`ln_view`.`key_code` = `lg`.`pay_term`))) AS `Term Borrow`,(select `ln_co`.`co_khname` from `ln_co` where (`ln_co`.`co_id` = `lg`.`co_id`) limit 1) AS `co_name`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 14) and (`ln_view`.`key_code` = `lg`.`pay_term`)) limit 1) AS `name_en`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 24) and (`ln_view`.`key_code` = `lg`.`for_loantype`)) limit 1) AS `loan_type` from (`ln_loan_group` `lg` join `ln_loan_member` `m`) where ((`lg`.`g_id` = `m`.`group_id`) and (`lg`.`status` = 1) and (`m`.`status` = 1) and (`lg`.`g_id` = `m`.`group_id`)));

INSERT INTO v_loangroupmember VALUES("1","PPL00001","1","10.00","0.00","1","1","1000.00","2.50","2","3","12","2015-09-07","2016-10-07","1","1","PP000001","mok channy","???????","$","Month","??? ?????","Month","Other Loan");



DROP TABLE v_loanoutstanding;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_loanoutstanding` AS (select `g`.`member_id` AS `member_id`,`g`.`loan_number` AS `loan_number`,sum(`g`.`total_capital`) AS `total_capital`,`g`.`interest_rate` AS `interest_rate`,`g`.`currency_type` AS `curr_type`,`g`.`client_id` AS `client_id`,(select `ln_branch`.`br_id` from `ln_branch` where (`ln_branch`.`br_id` = `g`.`branch_id`) limit 1) AS `br_id`,(select `ln_branch`.`branch_namekh` from `ln_branch` where (`ln_branch`.`br_id` = `g`.`branch_id`) limit 1) AS `branch_name`,(select `ln_client`.`client_number` from `ln_client` where (`ln_client`.`client_id` = `g`.`client_id`) limit 1) AS `client_number`,(select `ln_client`.`name_kh` from `ln_client` where (`ln_client`.`client_id` = `g`.`client_id`) limit 1) AS `client_kh`,(select `ln_client`.`name_en` from `ln_client` where (`ln_client`.`client_id` = `g`.`client_id`) limit 1) AS `client_en`,(select `ln_currency`.`symbol` from `ln_currency` where (`ln_currency`.`id` = `g`.`currency_type`)) AS `currency_type`,(select sum(`cd`.`principal_permonth`) from `ln_client_receipt_money_detail` `cd` where (`cd`.`loan_number` = `g`.`loan_number`)) AS `total_payment`,`lg`.`date_release` AS `date_release`,`lg`.`date_line` AS `date_line`,`lg`.`co_id` AS `co_id`,`lg`.`total_duration` AS `total_duration`,`lg`.`loan_type` AS `loantype`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 24) and (`ln_view`.`key_code` = `lg`.`for_loantype`)) limit 1) AS `loan_type`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 14) and (`ln_view`.`key_code` = `lg`.`pay_term`))) AS `pay_term`,(select `ln_co`.`co_khname` from `ln_co` where (`ln_co`.`co_id` = `lg`.`co_id`)) AS `co_name`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 14) and (`ln_view`.`key_code` = `lg`.`pay_term`))) AS `name_en` from (`ln_loan_group` `lg` join `ln_loan_member` `g`) where ((`lg`.`g_id` = `g`.`group_id`) and (`g`.`status` = 1) and (`g`.`is_completed` = 0) and (`g`.`is_reschedule` <> 1)) group by `g`.`group_id`);

INSERT INTO v_loanoutstanding VALUES("1","PPL00001","1000.00","2.50","2","1","1","???????","PP000001","???? ?????","mok channy","$","83.33","2015-09-07","2016-10-07","1","12","1","Other Loan","Month","??? ?????","Month");



DROP TABLE v_loanreleased;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_loanreleased` AS select `m`.`member_id` AS `member_id`,`m`.`loan_number` AS `loan_number`,`m`.`group_id` AS `group_id`,sum(`m`.`admin_fee`) AS `admin_fee`,sum(`m`.`other_fee`) AS `other_fee`,`m`.`branch_id` AS `branch_id`,`m`.`client_id` AS `client_id`,sum(`m`.`total_capital`) AS `total_capital`,`m`.`interest_rate` AS `interest_rate`,`lg`.`level` AS `loan_level`,`m`.`currency_type` AS `curr_type`,`lg`.`pay_term` AS `pay_term_id`,`lg`.`total_duration` AS `total_duration`,`lg`.`date_release` AS `date_release`,`lg`.`date_line` AS `date_line`,`lg`.`co_id` AS `co_id`,`lg`.`loan_type` AS `loantype`,(select `p`.`payment_nameen` from `ln_payment_method` `p` where (`p`.`id` = `lg`.`payment_method`)) AS `payment_name`,(select `c`.`client_number` from `ln_client` `c` where (`c`.`client_id` = `m`.`client_id`) limit 1) AS `client_number`,(select `c`.`name_en` from `ln_client` `c` where (`c`.`client_id` = `m`.`client_id`) limit 1) AS `client_name`,(select `c`.`name_kh` from `ln_client` `c` where (`c`.`client_id` = `m`.`client_id`) limit 1) AS `client_khname`,(select `ln_branch`.`branch_namekh` from `ln_branch` where (`ln_branch`.`br_id` = `m`.`branch_id`) limit 1) AS `branch_name`,(select `ln_currency`.`symbol` from `ln_currency` where (`ln_currency`.`id` = `m`.`currency_type`)) AS `currency_type`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 14) and (`ln_view`.`key_code` = `lg`.`pay_term`))) AS `Term Borrow`,(select `ln_co`.`co_khname` from `ln_co` where (`ln_co`.`co_id` = `lg`.`co_id`) limit 1) AS `co_name`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 14) and (`ln_view`.`key_code` = `lg`.`pay_term`)) limit 1) AS `name_en`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 24) and (`ln_view`.`key_code` = `lg`.`for_loantype`)) limit 1) AS `loan_type` from (`ln_loan_group` `lg` join `ln_loan_member` `m`) where ((`lg`.`g_id` = `m`.`group_id`) and (`m`.`status` = 1) and (`lg`.`is_reschedule` = 0) and (`lg`.`g_id` = `m`.`group_id`)) group by `m`.`group_id` order by `lg`.`branch_id`,`m`.`currency_type`;

INSERT INTO v_loanreleased VALUES("1","PPL00001","1","10.00","0.00","1","1","1000.00","2.50","1","2","3","12","2015-09-07","2016-10-07","1","1","Decline","PP000001","mok channy","???? ?????","???????","$","Month","??? ?????","Month","Other Loan");



DROP TABLE v_newloancolect;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_newloancolect` AS (select `f`.`id` AS `id`,`f`.`member_id` AS `member_id`,`f`.`total_principal` AS `total_principal`,sum(`f`.`principal_permonth`) AS `principal_permonth`,sum(`f`.`principle_after`) AS `principle_after`,sum(`f`.`total_interest`) AS `total_interest`,sum(`f`.`total_interest_after`) AS `total_interest_after`,sum(`f`.`total_payment`) AS `total_payment`,sum(`f`.`penelize`) AS `penelize`,sum(`f`.`service_charge`) AS `service_charge`,`f`.`amount_day` AS `amount_day`,`f`.`status` AS `status`,`f`.`is_completed` AS `is_completed`,`f`.`is_approved` AS `is_approved`,`f`.`date_payment` AS `date_payment`,`f`.`branch_id` AS `branch_id`,`f`.`collect_by` AS `collect_by`,`f`.`payment_option` AS `payment_option`,sum(`lm`.`total_capital`) AS `total_capital`,`lm`.`loan_number` AS `loan_number`,`lm`.`pay_after` AS `pay_after`,`lm`.`interest_rate` AS `interest_rate`,`lm`.`currency_type` AS `currency_type`,(select `lg`.`date_release` from `ln_loan_group` `lg` where (`lg`.`g_id` = `lm`.`group_id`)) AS `date_release`,(select `lg`.`date_line` from `ln_loan_group` `lg` where (`lg`.`g_id` = `lm`.`group_id`)) AS `date_line`,(select `lb`.`branch_namekh` from `ln_branch` `lb` where (`lb`.`br_id` = `f`.`branch_id`)) AS `branch_kh`,(select `c`.`phone` from `ln_client` `c` where (`c`.`client_id` = `lm`.`client_id`)) AS `phone_number`,(select `c`.`name_kh` from `ln_client` `c` where (`c`.`client_id` = `lm`.`client_id`)) AS `client_name`,(select `co`.`co_khname` from `ln_co` `co` where (`co`.`co_id` = (select `ln_loan_group`.`co_id` from `ln_loan_group` where (`ln_loan_group`.`g_id` = `lm`.`group_id`)))) AS `co_name`,(select `crm`.`date_input` from (`ln_client_receipt_money` `crm` join `ln_client_receipt_money_detail` `crmd`) where ((`crm`.`loan_number` = `lm`.`loan_number`) and (`crm`.`id` = `crmd`.`crm_id`) and (`crmd`.`lfd_id` = `f`.`id`)) order by `crm`.`date_input` desc limit 1) AS `last_pay_date`,`lm`.`collect_typeterm` AS `collect_typeterm` from (`ln_loanmember_funddetail` `f` join `ln_loan_member` `lm`) where ((`f`.`is_completed` = 0) and (`lm`.`status` = 1) and (`f`.`member_id` = `lm`.`member_id`)) group by `lm`.`group_id` order by `lm`.`member_id`);

INSERT INTO v_newloancolect VALUES("2","1","916.67","916.67","916.67","139.87","139.87","1056.54","0.00","0.00","31","1","0","0","2015-11-07","1","1","","11000.00","PPL00001","2","2.50","2","2015-09-07","2016-10-07","???????","070 41 8002","???? ?????","??? ?????","","3");



DROP TABLE v_released_co;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_released_co` AS (select `g`.`member_id` AS `member_id`,`g`.`loan_number` AS `loan_number`,`lg`.`branch_id` AS `branch_id`,`lg`.`pay_term` AS `pay_term_id`,`lg`.`date_line` AS `date_line`,`lg`.`loan_type` AS `for_loan_type`,sum(`g`.`total_capital`) AS `total_capital`,sum(`g`.`admin_fee`) AS `admin_fee`,sum(`g`.`other_fee`) AS `other_fee`,`g`.`interest_rate` AS `interest_rate`,`g`.`currency_type` AS `curr_type`,(select `p`.`payment_nameen` from `ln_payment_method` `p` where (`p`.`id` = `lg`.`payment_method`)) AS `payment_name`,(select `ln_branch`.`branch_namekh` from `ln_branch` where (`ln_branch`.`br_id` = `lg`.`branch_id`) limit 1) AS `branch_name`,(select `ln_client`.`client_id` from `ln_client` where (`ln_client`.`client_id` = `g`.`client_id`) limit 1) AS `client_id`,(select `ln_client`.`client_number` from `ln_client` where (`ln_client`.`client_id` = `g`.`client_id`) limit 1) AS `client_number`,(select `ln_client`.`name_en` from `ln_client` where (`ln_client`.`client_id` = `g`.`client_id`) limit 1) AS `client_name`,(select `ln_currency`.`symbol` from `ln_currency` where (`ln_currency`.`id` = `g`.`currency_type`)) AS `currency_type`,(select `ln_loan_group`.`total_duration` from `ln_loan_group` where (`ln_loan_group`.`g_id` = `g`.`group_id`) limit 1) AS `total_duration`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 14) and (`ln_view`.`key_code` = (select `ln_loan_group`.`pay_term` from `ln_loan_group` where (`ln_loan_group`.`g_id` = `g`.`group_id`) limit 1)))) AS `pay_term`,(select `ln_loan_group`.`date_release` from `ln_loan_group` where (`ln_loan_group`.`g_id` = `g`.`group_id`) limit 1) AS `date_release`,(select `ln_co`.`co_code` from `ln_co` where (`ln_co`.`co_id` = (select `ln_loan_group`.`co_id` from `ln_loan_group` where (`ln_loan_group`.`g_id` = `g`.`group_id`) limit 1))) AS `co_code`,(select `ln_co`.`co_khname` from `ln_co` where (`ln_co`.`co_id` = (select `ln_loan_group`.`co_id` from `ln_loan_group` where (`ln_loan_group`.`g_id` = `g`.`group_id`) limit 1))) AS `co_name`,(select `ln_co`.`co_firstname` from `ln_co` where (`ln_co`.`co_id` = (select `ln_loan_group`.`co_id` from `ln_loan_group` where (`ln_loan_group`.`g_id` = `g`.`group_id`) limit 1))) AS `co_name_en`,(select `ln_co`.`sex` from `ln_co` where (`ln_co`.`co_id` = (select `ln_loan_group`.`co_id` from `ln_loan_group` where (`ln_loan_group`.`g_id` = `g`.`group_id`) limit 1))) AS `sex`,(select `ln_loan_group`.`co_id` from `ln_loan_group` where (`ln_loan_group`.`g_id` = `g`.`group_id`) limit 1) AS `co_id`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 14) and (`ln_view`.`key_code` = `lg`.`pay_term`))) AS `name_en`,(select `ln_view`.`name_en` from `ln_view` where ((`ln_view`.`type` = 24) and (`ln_view`.`key_code` = `lg`.`for_loantype`)) limit 1) AS `loan_type` from (`ln_loan_group` `lg` join `ln_loan_member` `g`) where ((`lg`.`g_id` = `g`.`group_id`) and (`g`.`status` = 1) and (`lg`.`is_reschedule` = 0)) group by `g`.`group_id`);

INSERT INTO v_released_co VALUES("1","PPL00001","1","3","2016-10-07","1","1000.00","10.00","0.00","2.50","2","Decline","???????","1","PP000001","mok channy","$","12","Month","2015-09-07","C001","??? ?????","sarons","1","1","Month","Other Loan");



DROP TABLE v_rescheduleloan;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rescheduleloan` AS (select `r`.`id` AS `id`,`r`.`reschedule_date` AS `reschedule_date`,`r`.`re_amount` AS `re_amount`,`r`.`re_interest_rate` AS `re_interest_rate`,`r`.`re_loan_number` AS `re_loan_number`,`r`.`maturity` AS `maturity`,(select `p`.`payment_nameen` from `ln_payment_method` `p` where (`p`.`id` = `r`.`re_payment_method`)) AS `re_payment_method`,`l`.`member_id` AS `member_id`,`l`.`loan_number` AS `loan_number`,`l`.`group_id` AS `group_id`,`l`.`branch_id` AS `branch_id`,`l`.`client_id` AS `client_id`,`l`.`total_capital` AS `total_capital`,`l`.`interest_rate` AS `interest_rate`,`l`.`curr_type` AS `curr_type`,`l`.`total_duration` AS `total_duration`,`l`.`date_release` AS `date_release`,`l`.`date_line` AS `date_line`,`l`.`loan_type` AS `loantype`,`l`.`payment_nameen` AS `from_paymentmethod`,`l`.`client_number` AS `client_number`,`l`.`client_name` AS `client_name`,`l`.`branch_name` AS `branch_name`,`l`.`currency_type` AS `currency_type`,`l`.`Term Borrow` AS `Term Borrow`,`l`.`co_name` AS `co_name`,`l`.`loan_type` AS `loan_type` from (`ln_reschedule` `r` join `v_default` `l`) where (`l`.`loan_number` = `r`.`loan_number`));




DROP TABLE v_xchange;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_xchange` AS (select (select `ln_branch`.`branch_namekh` from `ln_branch` where (`ln_branch`.`br_id` = `ln_xchange`.`branch_id`) limit 1) AS `branch_name`,(select `ln_client`.`name_kh` from `ln_client` where (`ln_client`.`client_id` = `ln_xchange`.`client_id`) limit 1) AS `client_name`,`ln_xchange`.`id` AS `id`,`ln_xchange`.`client_id` AS `client_id`,`ln_xchange`.`branch_id` AS `branch_id`,`ln_xchange`.`changedAmount` AS `changedAmount`,`ln_xchange`.`fromAmount` AS `fromAmount`,`ln_xchange`.`rate` AS `rate`,`ln_xchange`.`recieptNo` AS `recieptNo`,`ln_xchange`.`recievedAmount` AS `recievedAmount`,`ln_xchange`.`status_in` AS `status_in`,`ln_xchange`.`statusDate` AS `statusDate`,`ln_xchange`.`toAmount` AS `toAmount`,`ln_xchange`.`toAmountType` AS `toAmountType`,`ln_xchange`.`fromAmountType` AS `fromAmountType`,`ln_xchange`.`from_to` AS `from_to`,`ln_xchange`.`recievedType` AS `recievedType`,`ln_xchange`.`userid` AS `userid`,`ln_xchange`.`specail_customer` AS `specail_customer`,`ln_xchange`.`status` AS `status` from `ln_xchange`);

INSERT INTO v_xchange VALUES("","","1","","","0","200","32.9","W15-05-22/301a843","200","in","2015-07-12 22:40:05","6580","B","$","Dollar - Bath","$","1","0","1");
INSERT INTO v_xchange VALUES("","","2","","","0","10","3990","W15-05-29/44e00c8","10","in","2015-05-29 20:48:34","39900","R","$","Dollar - Riel","$","1","0","1");
INSERT INTO v_xchange VALUES("","","3","","","100","100","3990","W15-05-29/1644556","200","in","2015-05-29 22:25:33","399000","R","$","Dollar - Riel","$","1","0","1");
INSERT INTO v_xchange VALUES("","","4","","","5","10","3990","W15-05-29/5685f43","15","in","2015-05-29 22:30:10","39900","R","$","Dollar - Riel","$","1","0","1");
INSERT INTO v_xchange VALUES("","","5","","","0","100","3990","W15-06-23/2233558","100","in","2015-06-23 18:25:00","399000","R","$","Dollar - Riel","$","1","0","1");
INSERT INTO v_xchange VALUES("","","6","","","0","1000","32.9","W15-07-10/34559f7","1000","in","2015-07-10 17:04:25","32900","B","$","Dollar - Bath","$","1","0","1");
INSERT INTO v_xchange VALUES("","","7","","","0","1000","3990","W15-08-10/003d155","1000","in","2015-08-10 17:35:38","3990000","R","$","Dollar - Riel","$","1","0","1");



