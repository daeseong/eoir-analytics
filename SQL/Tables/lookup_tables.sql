create table tbllookupappealtype(
	idnAppealType varchar,
	strApplCode varchar,
	strApplDescription varchar,
	datCreatedOn varchar,
	datModifiedOn varchar,
	blnActive varchar,
	blnDDAppeal varchar
);

create table tbllookup_appln (
	idnAppln varchar,
	strcode varchar,
	strdescription varchar,
	strAllowedCaseTypes varchar,
	strAllowedDecisionCodes varchar,
	APL_casetype_1 varchar,
	APL_casetype_2 varchar,
	APL_casetype_3 varchar,
	APL_casetype_4 varchar,
	APL_casetype_5 varchar,
	APL_casetype_6 varchar,
	APL_casetype_7 varchar,
	datCreatedOn varchar,
	datModifiedOn varchar,
	blnActive varchar
);

create table tbllookupcasetype (
	idnCaseType varchar,
	strCode varchar,
	strDescription varchar,
	blnActive varchar,
	datCreatedOn varchar,
	datModifiedOn varchar,
	strAnsirCode varchar
);

create table tbllookupcustodystatus (
	idnCustodyStatus varchar,
	strCode varchar,
	strSelecBoxVal varchar,
	strDescription varchar,
	blnActive varchar,
	datCreatedOn varchar,
	datModifiedOn varchar
);


create table tbllookupbiadecision (
	idnBIAdec varchar,
	strCode varchar,
	strDescription varchar,
	blnActive varchar,
	datCreatedOn varchar,
	datModifiedOn varchar
);

create table tbllookup_casepriority (
	idnCasePriority varchar,
	strCode varchar,
	strDescription varchar,
	strDays varchar,
	DATCREATEDON varchar,
	DATMODIFIEDON varchar,
	blnActive varchar,
	blnBypasscal varchar
);

create table tbllookupcharges (
	idnCharges varchar,
	strCode varchar,
	strCodeString varchar,
	strCodeDescription varchar,
	applicable_case_type1 varchar,
	applicable_case_type2 varchar,
	applicable_case_type3 varchar,
	criminal_flag varchar,
	aggravate_felon varchar,
	DatCreatedOn varchar,
	DatModifiedOn varchar,
	blnActive varchar
);

create table tbllookupbasecity (
	idnBaseCity varchar,
	BASE_CITY_CODE varchar,
	BASE_CITY_NAME varchar,
	BaseAutomated varchar,
	BASE_ST_ADDRESS varchar,
	BASE_CITY varchar,
	BASE_STATE varchar,
	BASE_ZIP_1 varchar,
	BASE_ZIP_2 varchar,
	BASE_PHONE_NO varchar,
	strRegion varchar,
	BaseEoir1Flag varchar,
	BaseEoir1Code varchar,
	BaseEoir1Suba varchar,
	BaseEoir1Subb varchar,
	BaseEoir1Subc varchar,
	BaseEoir1Subd varchar,
	BaseEoir1Sube varchar,
	BaseEoir1Subf varchar,
	BaseEoir2Flag varchar,
	BaseEoir2Code varchar,
	BaseEoir2Suba varchar,
	BaseEoir2Subb varchar,
	BaseEoir2Subc varchar,
	BaseEoir2Subd varchar,
	BaseEoir2Sube varchar,
	BaseEoir2Subf varchar,
	BaseEoir5Flag varchar,
	BaseEoir5Code varchar,
	BaseEoir5Suba varchar,
	BaseEoir5Subb varchar,
	BaseEoir5Subc varchar,
	BaseEoir5Subd varchar,
	BaseEoir5Sube varchar,
	BaseEoir5Subf varchar,
	BaseEoir6Flag varchar,
	BaseEoir6Code varchar,
	BaseEoir6Suba varchar,
	BaseEoir6Subb varchar,
	BaseEoir6Subc varchar,
	BaseEoir6Subd varchar,
	BaseEoir6Sube varchar,
	BaseEoir6Subf varchar,
	BaseEoir7Flag varchar,
	BaseEoir7Code varchar,
	BaseEoir7Suba varchar,
	BaseEoir7Subb varchar,
	BaseEoir7Subc varchar,
	BaseEoir7Subd varchar,
	BaseEoir7Sube varchar,
	BaseEoir7Subf varchar,
	BaseEoir34Flag varchar,
	BaseEoir34Code varchar,
	BaseEoir34Suba varchar,
	BaseEoir34Subb varchar,
	BaseEoir34Subc varchar,
	BaseEoir34Subd varchar,
	BaseEoir34Sube varchar,
	BaseEoir34Subf varchar,
	BaseEoir35Flag varchar,
	BaseEoir35Code varchar,
	BaseEoir35Suba varchar,
	BaseEoir35Subb varchar,
	BaseEoir35Subc varchar,
	BaseEoir35Subd varchar,
	BaseEoir35Sube varchar,
	BaseEoir35Subf varchar,
	BaseEoir36Flag varchar,
	BaseEoir36Code varchar,
	BaseEoir36Suba varchar,
	BaseEoir36Subb varchar,
	BaseEoir36Subc varchar,
	BaseEoir36Subd varchar,
	BaseEoir36Sube varchar,
	BaseEoir36Subf varchar,
	BaseEoir39Flag varchar,
	BaseEoir39Code varchar,
	BaseEoir39Suba varchar,
	BaseEoir39Subb varchar,
	BaseEoir39Subc varchar,
	BaseEoir39Subd varchar,
	BaseEoir39Sube varchar,
	BaseEoir39Subf varchar,
	I122Flag varchar,
	I122Code varchar,
	I122Suba varchar,
	I122Subb varchar,
	I122Subc varchar,
	I122Subd varchar,
	I122Sube varchar,
	I122Subf varchar,
	RopDefault varchar,
	RopPrtClass varchar,
	BaseSplPrtClass varchar,
	datCreatedOn varchar,
	datModifiedOn varchar,
	blnActive varchar,
	blnBCIS varchar
);

create table tblookupcourtdecision (
	idnCourtDecision varchar,
	strCaseType varchar,
	strDecCode varchar,
	strDecDescription varchar,
	strDecType varchar,
	strFinalDisposition varchar,
	blnActive varchar,
	datCreatedOn varchar,
	datModifiedOn varchar
);

create table tbllookupfiledby (
	idnFiled varchar,
	strCode varchar,
	strDescription varchar,
	blnActive varchar,
	datCreatedOn varchar,
	datModifiedOn varchar
);

create table tbllookupsex (
	idnSex varchar,
	strcode varchar,
	strDescription varchar,
	datCreatedOn varchar,
	datModifiedOn varchar,
	blnActive varchar
);

create table tbllookupjudge (
	idnJudge varchar,
	JUDGE_CODE varchar,
	JUDGE_NAME varchar,
	JUDGE_ST_ADDRESS varchar,
	JUDGE_CITY varchar,
	JUDGE_STATE varchar,
	JUDGE_ZIP_1 varchar,
	JUDGE_ZIP_2 varchar,
	JUDGE_PHONE_NO varchar,
	datCreatedOn varchar,
	datModifiedOn varchar,
	blnActive varchar,
	blnSkippedOnWheel varchar,
	blnLastOnWheel varchar,
	blnSkippedOnWheelMA varchar,
	blnLastOnWheelMA varchar,
	intOrderMA varchar,
	intOrderMM varchar
);

create table tbllanguage (
	idnLang varchar,
	strCode varchar,
	strDescription varchar,
	datCreatedOn varchar,
	datModifiedOn varchar,
	blnActive varchar
);

create table tbllookupnationality (
	ID varchar,
	NAT_CODE varchar,
	NAT_NAME varchar,
	NAT_COUNTRY_NAME varchar,
	NAT_NACARA_COUNTRY varchar,
	datCreatedOn varchar,
	datModifiedOn varchar,
	blnActive varchar
);

copy tbllanguage
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\Lookup\tblLanguage.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tbllookupnationality
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\Lookup\tblLookupNationality.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tbllookupappealtype
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\Lookup\tbllookupAppealType.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tbllookupcasetype
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\Lookup\tblLookupCaseType.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tbllookupcustodystatus
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\Lookup\tblLookupCustodyStatus.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tbllookupbiadecision
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\Lookup\tblLookupBIADecision.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tbllookup_casepriority
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\Lookup\tblLookup_CasePriority.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tbllookupcharges
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\Lookup\tbllookupCharges.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tbllookupbasecity
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\Lookup\tblLookupBaseCity.csv'
with (format csv, delimiter E'\t', header true, null '');


copy tbllookupfiledby
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\Lookup\tblLookupFiledBy.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tbllookupsex
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\Lookup\tblLookupSex.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tbllookupjudge
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\Lookup\tblLookupJudge.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tbllookup_appln
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\Lookup\tblLookUp_Appln_final.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tblookupcourtdecision
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\Lookup\tblLookupCourtDecision_final.csv'
with (format csv, delimiter E'\t', header true, null '');
