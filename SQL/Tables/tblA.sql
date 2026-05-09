drop table a_tblcase;

create table a_tblcase (
    idncase varchar,
    alien_city varchar,
    alien_state varchar,
    alien_zipcode varchar,
    updated_zipcode varchar,
    updated_city varchar,
    nat varchar,
    lang varchar,
    custody varchar,
    site_type varchar,
    e_28_date varchar,
    atty_nbr varchar,
    case_type varchar,
    update_site varchar,
    latest_hearing varchar,
    latest_time varchar,
    latest_cal_type varchar,
    up_bond_date varchar,
    up_bond_rsn varchar,
    correctional_fac varchar,
    release_month varchar,
    release_year varchar,
    inmate_housing varchar,
    date_of_entry varchar,
    c_asy_type varchar,
    c_birthdate varchar,
    c_release_date varchar,
    updated_state varchar,
    address_changedon varchar,
    zbond_mrg_flag varchar,
    sex varchar,
    date_detained varchar,
    date_released varchar,
    lpr varchar,
    detention_date varchar,
    detention_location varchar,
    dco_location varchar,
    detention_facility_type varchar,
    casepriority_code varchar
);

copy a_tblcase
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\EOIR Case Data\A_TblCase_final.csv'
with (
    FORMAT csv,
    delimiter E'\t',
    header true,
    null ''
);

create table a_tblcaseidentifier (
	IDNCASEID varchar,
	IDNCASE varchar,
	CASE_ID varchar
);

create table b_tblproceedcharges (
	IDNPRCDCHG varchar,
	IDNCASE varchar,
	IDNPROCEEDING varchar,
	CHARGE varchar,
	CHG_STATUS varchar
);

create table b_tblproceeding(
	IDNPROCEEDING varchar,
	IDNCASE varchar,
	OSC_DATE varchar,
	INPUT_DATE varchar,
	BASE_CITY_CODE varchar,
	HEARING_LOC_CODE varchar,
	IJ_CODE varchar,
	TRANS_IN_DATE varchar,
	PREV_HEARING_LOC varchar,
	PREV_HEARING_BASE varchar,
	PREV_IJ_CODE varchar,
	TRANS_NBR varchar,
	HEARING_DATE varchar,
	HEARING_TIME varchar,
	DEC_TYPE varchar,
	DEC_CODE varchar,
	DEPORTED_1 varchar,
	DEPORTED_2 varchar,
	OTHER_COMP varchar,
	APPEAL_RSVD varchar,
	APPEAL_NOT_FILED varchar,
	COMP_DATE varchar,
	ABSENTIA varchar,
	VENUE_CHG_GRANTED varchar,
	TRANSFER_TO varchar,
	DATE_APPEAL_DUE_STATUS varchar,
	TRANSFER_STATUS varchar,
	CUSTODY varchar,
	CASE_TYPE varchar,
	NAT varchar,
	LANG varchar,
	SCHEDULED_HEAR_LOC varchar,
	CORRECTIONAL_FAC varchar,
	CRIM_IND varchar,
	IHP varchar,
	AGGRAVATE_FELON varchar,
	DATE_DETAINED varchar,
	DATE_RELEASED varchar
);

create table tblappeal (
	idnAppeal varchar,
	idncase varchar,
	idnProceeding varchar,
	strAppealCategory varchar,
	strAppealType varchar,
	datAppealFiled varchar,
	strFiledBy varchar,
	datAttorneyE27 varchar,
	datBIADecision varchar,
	strBIADecision varchar,
	strBIADecisionType varchar,
	strCaseType varchar,
	strLang varchar,
	strNat varchar,
	strProceedingIHP varchar,
	strCustody varchar,
	strProbono varchar
);

create table tbl_casepriorityhistory (
	idnCasePriHistory varchar,
	casePriority_code varchar,
	idnCase varchar,
	DATCREATEDON varchar,
	DATMODIFIEDON varchar
);

create table tbl_court_appln (
	IDNPROCEEDINGAPPLN varchar,
	IDNPROCEEDING varchar,
	IDNCASE varchar,
	APPL_CODE varchar,
	APPL_RECD_DATE varchar,
	APPL_DEC varchar
);

create table tbl_court_motions (
	IDNMOTION varchar,
	IDNPROCEEDING varchar,
	IDNCASE varchar,
	OSC_DATE varchar,
	REC_TYPE varchar,
	GENERATION varchar,
	SUB_GENERATION varchar,
	UPDATE_DATE varchar,
	UPDATE_TIME varchar,
	INPUT_DATE varchar,
	INPUT_TIME varchar,
	REJ_Remove varchar,
	BASE_CITY_CODE varchar,
	HEARING_LOC_CODE varchar,
	IJ_CODE varchar,
	IJ_NAME_Remove varchar,
	DEC varchar,
	COMP_DATE varchar,
	MOTION_RECD_DATE varchar,
	DATMOTIONDUE varchar,
	WU_MSG_Remove varchar,
	APPEAL_RSVD varchar,
	APPEAL_NOT_FILED varchar,
	RESP_DUE_DATE varchar,
	STAY_GRANT varchar,
	JURISDICTION varchar,
	DATE_APPEAL_DUE varchar,
	DATE_TO_BIA varchar,
	DECISION_RENDERED_Remove varchar,
	DATE_MAILED_TO_IJ varchar,
	DATE_RECD_FROM_BIA varchar,
	DATE_TO_BIA_UPDATE_Remove varchar,
	STRFILINGPARTY varchar,
	STRFILINGMETHOD varchar,
	STRCERTOFSERVICECODE varchar,
	E_28_RECPTFLAG_Remove varchar,
	E_28_DATE varchar,
	O_CLOCK_OPTION varchar,
	SCHEDULED_HEAR_LOC_Remove varchar,
	BLNDELETED_Remove varchar,
	strDJScenario varchar
);

create table tbl_repsassigned (
	IDNREPSASSIGNED varchar,
	IDNCASE varchar,
	STRATTYLEVEL varchar,
	STRATTYTYPE varchar,
	PARENT_TABLE varchar,
	PARENT_IDN varchar,
	BASE_CITY_CODE varchar,
	INS_TA_DATE_ASSIGNED varchar,
	E_27_DATE varchar,
	E_28_DATE varchar,
	BLNPRIMEATTY varchar
);

alter table tbl_repassigned


copy a_tblcaseidentifier
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\EOIR Case Data\A_TblCaseIdentifier_final.csv'
with (format csv, delimiter E'\t', header true, null '');

copy b_tblproceeding
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\EOIR Case Data\B_TblProceeding_final.csv'
with (format csv, delimiter E'\t', header true, null '');

copy b_tblproceedcharges
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\EOIR Case Data\B_TblProceedCharges_final.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tblappeal
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\EOIR Case Data\tblAppeal_final.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tbl_casepriorityhistory
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\EOIR Case Data\tbl_CasePriorityHistory_final.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tbl_court_appln
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\EOIR Case Data\tbl_Court_Appln_final.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tbl_court_motions
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\EOIR Case Data\tbl_Court_Motions_final.csv'
with (format csv, delimiter E'\t', header true, null '');

copy tbl_repsassigned
from 'C:\Users\dkim2\Desktop\projects\EOIR Case Data 2026-0401\EOIR Case Data\tbl_RepsAssigned_final.csv'
with (format csv, delimiter E'\t', header true, null '');