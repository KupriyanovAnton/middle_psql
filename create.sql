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

CREATE TABLE IF NOT EXISTS kupriyanov.documents_type(
	code	serial PRIMARY KEY,
	name	varchar(8)
);

CREATE TABLE IF NOT EXISTS kupriyanov.documents(
	code serial PRIMARY KEY,
	doc_type integer CONSTRAINT doc_type_cstr REFERENCES kupriyanov.documents_type NOT NULL,
	doc_series varchar(4) NOT NULL,
	doc_number varchar(6) NOT NULL,
	user REFERENCES users NOT NULL,
	relevant boolean,
	CONSTRAINT unique_docs_cstr UNIQUE(doc_type, doc_series, doc_number)
);
