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
