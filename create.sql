CREATE TABLE IF NOT EXISTS kupriyanov.users(
	code serial PRIMARY KEY,
	login varchar(75) NOT NULL
);

CREATE TABLE IF NOT EXISTS kupriyanov.currencies(
	code	varchar(3) PRIMARY KEY,
	name	varchar(20)
);

CREATE TABLE IF NOT EXISTS kupriyanov.operations_type(
	code	serial PRIMARY KEY,
	name	varchar(8),
	constraint operation_name_cstr CHECK(name IN ('withdraw', 'deposit'))
);

CREATE TABLE IF NOT EXISTS kupriyanov.documents_type(
	code	serial PRIMARY KEY,
	name	varchar(8)
);

CREATE TABLE IF NOT EXISTS kupriyanov.documents(
	code serial PRIMARY KEY,
	doc_type_code integer CONSTRAINT doc_type_cstr REFERENCES kupriyanov.documents_type NOT NULL,
	doc_series varchar(4) NOT NULL,
	doc_number varchar(6) NOT NULL,
	user_code integer REFERENCES kupriyanov.users NOT NULL,
	relevant boolean NOT NULL,
	CONSTRAINT unique_docs_cstr UNIQUE(doc_type_code, doc_series, doc_number)
);

CREATE TABLE IF NOT EXISTS kupriyanov.accounts(
	code serial PRIMARY KEY,
	acc_uuid UUID NOT NULL,
	currencie_code varchar(3) REFERENCES kupriyanov.currencies NOT NULL,
	user_code integer REFERENCES kupriyanov.users NOT NULL,
	CONSTRAINT acc_code_currencie_unq UNIQUE(code, currencie_code)
);

CREATE TABLE IF NOT EXISTS kupriyanov.operations(
	code serial PRIMARY KEY,
	account_code integer NOT NULL, 
	currencies_code varchar(3) NOT NULL, 
	ammount numeric(10, 2), 
	operations_type_code integer REFERENCES kupriyanov.operations_type NOT NULL,
	CONSTRAINT account_currency_match_cstr FOREIGN KEY (account_code, currencies_code) REFERENCES kupriyanov.accounts(code, currencie_code) 
);
